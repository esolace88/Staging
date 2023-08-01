variable "resource_group_name" {
  default = "RG-TerraformTest"
}

variable "location" {
  default = "eastus"
}

variable "network_plugin" {
  default = "azure"
}

variable "vnet_name" {
  default = "testvnet"
}

variable "vnet_location" {
  default = "eastus"
}

variable "vnet_rg_name" {
  default = "RG-VNET"
}

variable "subnet_name" {
  default = "testsubnet"
}

#variable "resource_group_location" {
#    default = "eastus"
#}

variable "agent_count" {
  default = 3
}

variable "ssh_public_key" {
  default = "~/.ssh/id_rsa.pub"
}

variable "dns_prefix" {
  default = "k8sproject"
}

variable "cluster_name" {
  default = "k8sproject"
}

variable "aks_service_principal_app_id" {
  default = "51494876-1253-4ad7-b160-8513557087db"
}

variable "aks_service_principal_client_secret" {
  default = "XFy8Q~w-ewdbqVzSVrbOI2J6AkfSHIKX7AuPMc.M"
