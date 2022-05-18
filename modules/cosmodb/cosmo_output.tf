output "connectionsrings" {
  value = azurerm_cosmosdb_account.db.connection_strings
 }

output "cosmodb_name" {
  value = azurerm_cosmosdb_account.db.name
}