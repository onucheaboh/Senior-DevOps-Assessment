resource "azurerm_sql_server" "my_sql_server" {
  name                         = "assessment-server"
  resource_group_name          = azurerm_resource_group.my_sql_server.name
  location                     = azurerm_resource_group.my_sql_server.location
  version                      = "12.0"
  administrator_login          = "admin"
  administrator_login_password = "Password456!"
}

resource "azurerm_sql_database" "my_sql_database" {
  name                = "assessment-db"
  resource_group_name = azurerm_resource_group.my_sql_database.name
  location            = azurerm_resource_group.my_sql_database.location
  server_name         = azurerm_sql_server.my_sql_database.name
  edition             = var.sql_db_sku
  collation           = "SQL_Latin1_General_CP1_CI_AS"
  max_size_gb         = var.sql_db_size
}
