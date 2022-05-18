resource "azurerm_key_vault_secret" "key_vault_secret" {
  count        = length(var.connectionstrings)
  name         = "kvs-${var.name}-cn-${tostring(count.index)}"
  value        = var.connectionstrings[count.index]
  key_vault_id = var.key_vault_id
}