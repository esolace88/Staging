variable "resource_group_name" {
  description = "Default resource group name that the network will be created in"
  default     = ""
}

variable "location" {
  description = "The location/region where the core network will be created."
  default     = "East US"
}

variable key_vault_name {
  description = "Name of the keyVault"
  default     = "k8s-test"
}

variable virtual_machine_id {
    description = "the resource id of the vm"
    default     = ""
}
variable encryption_algorithm {
  description = " Algo for encryption"
  default     = "RSA-OAEP"
}

variable "volume_type" {
  default = "All"
}

variable "encrypt_operation" {
  default = "EnableEncryption"
}

variable "type_handler_version" {
  description = "Type handler version of the VM extension to use. Defaults to 2.2 on Windows and 1.1 on Linux"
  default     = "2.2"
}
