resource "azurerm_virtual_network" "aks_vnet" {
  name                = "aks-vnet"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.assessment_resource_group.location
  resource_group_name = azurerm_resource_group.assessment_resource_group.name
}
