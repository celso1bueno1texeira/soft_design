terraform {
    required_providers {
        azurerm = {
        source  = "hashicorp/azurerm"
        version = "=3.0.0"
        }
    }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
    features {}
}

resource "azurerm_resource_group" "rg_softdesign" {
    name = "rg_softdesign"
    location = "brazilsouth"
}

resource "azurerm_kubernetes_cluster" "aks1_celsinho_softdesign" {
    name                = "aks1_celsinho_softdesign"
    location            = "brazilsouth"
    resource_group_name = azurerm_resource_group.rg_softdesign.name
    dns_prefix          = "softdesign-celsinho"
    
    default_node_pool {
        name       = "default"
        node_count = 3
        vm_size    = "standard_a2_v2"
    }

    identity {
        type = "SystemAssigned"
    }
}

