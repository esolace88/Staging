# Importing pre-existing resources
# To complete import run "terraform import terraform_id azure_id"

resource "azurerm_resource_group" "k8s" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  location            = var.vnet_location
  resource_group_name = var.vnet_rg_name
  address_space       = ["10.1.0.0/16"]
}

resource "azurerm_subnet" "subnet" {
  name                 = var.subnet_name
  resource_group_name  = azurerm_virtual_network.vnet.resource_group_name
  address_prefixes     = ["10.1.0.0/24"]
  virtual_network_name = azurerm_virtual_network.vnet.name
}

# Creating K8s Cluster

resource "azurerm_kubernetes_cluster" "k8s" {
  name                = var.cluster_name
  location            = azurerm_resource_group.k8s.location
  resource_group_name = azurerm_resource_group.k8s.name
  dns_prefix          = var.dns_prefix

  linux_profile {
    admin_username = "ubuntu"
    ssh_key {
      key_data = file(var.ssh_public_key)
    }
  }

  default_node_pool {
    name            = "agentpool"
    node_count      = var.agent_count
    vm_size         = "Standard_D2s_v3"
    os_disk_size_gb = 30

    vnet_subnet_id = azurerm_subnet.subnet.id
  }

  service_principal {
    client_id     = var.aks_service_principal_app_id
    client_secret = var.aks_service_principal_client_secret
  }

  network_profile {
    load_balancer_sku = "Standard"
    network_plugin    = var.network_plugin
  }

  tags = {
    Environment = "Development"
  }
}
