resource "random_string" "password" {
  length  = 16
  special = false
}

data "azurerm_resource_group" "test" {
  name = var.resource_group_name
}

resource "azurerm_key_vault" "keyvault" {
  name                            = var.key_vault_name
  resource_group_name             = var.resource_group_name
  enabled_for_disk_encryption     = true
  enabled_for_deployment          = true
  enabled_for_template_deployment = true
  location                        = data.azurerm_resource_group.test.location
  sku_name                        = "standard"
  tenant_id                       = data.azurerm_client_config.current.tenant_id
  soft_delete_enabled             = true
  soft_delete_retention_days      = 90
   
}

resource "azurerm_key_vault_access_policy" "myPolicy" {
  key_vault_id = azurerm_key_vault.keyvault.id
  tenant_id    = data.azurerm_client_config.current.tenant_id
  object_id    = data.azurerm_client_config.current.object_id
  
  key_permissions = [
    "get",
    "create",
    "delete"
  ]
}

resource "azurerm_key_vault_key" "testKEK" {
  name         = "testKEK"
  key_vault_id = azurerm_key_vault.keyvault.id
  key_type     = "RSA"
  key_size     = 2048
   depends_on  = [
    azurerm_key_vault_access_policy.myPolicy
  ]
  key_opts = [
    "decrypt",
    "encrypt",
    "sign",
    "unwrapKey",
    "verify",
    "wrapKey",
  ]
}
 
resource "azurerm_virtual_machine_extension" "vmextension" {
  name                       = random_string.password.result
  virtual_machine_id         = var.virtual_machine_id
  publisher                  = "Microsoft.Azure.Security"
  type                       = "AzureDiskEncryption"
  type_handler_version       = var.type_handler_version
  auto_upgrade_minor_version = true

  settings = <<SETTINGS
    {
        "EncryptionOperation": "${var.encrypt_operation}",
        "KeyVaultURL": "${azurerm_key_vault.keyvault.vault_uri}",
        "KeyVaultResourceId": "${azurerm_key_vault.keyvault.id}",                   
        "KeyEncryptionKeyURL": "${azurerm_key_vault_key.testKEK.id}",
        "KekVaultResourceId": "${azurerm_key_vault.keyvault.id}",                   
        "KeyEncryptionAlgorithm": "${var.encryption_algorithm}",
        "VolumeType": "${var.volume_type}"
    }
SETTINGS

  
}
