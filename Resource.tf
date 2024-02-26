resource "azurerm_resource_group" "assessment_resource_group" {
  name     = "aks-sql-resources"
  location = var.azure_region
}
