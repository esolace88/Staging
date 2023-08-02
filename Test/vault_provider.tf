 terraform {

   required_version = ">=0.12"

   required_providers {
     azurerm = {
       source = "hashicorp/azurerm"
       version = "~>2.0"
     }
   }
 }

 provider "azurerm" {
   version = "~>2.0"
   subscription_id = var_subcription_id
   client_id = var.sp_id
   client_secret = var.sp_secret
   tenant_id = var.tenant_id
   features {}
 }


provider "azurerm" {

    version = "~>2.0"
        subscription_id = ""
        client_id = "sp appId"
        client_secret = "sp password"
        tenant_id = "sp tenant"
        features {}

}
