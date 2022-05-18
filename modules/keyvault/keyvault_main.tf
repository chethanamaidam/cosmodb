data "azurerm_client_config" "current" {}

resource "azurerm_key_vault" "key_vault" {
  name                        = var.key_vault_name
  location                    = var.location
  resource_group_name         = var.resource_group_name
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  sku_name = "standard"

     access_policy {
    
    tenant_id     = data.azurerm_client_config.current.tenant_id
    object_id     = data.azurerm_client_config.current.object_id

    key_permissions = [
      "Create","Delete","Get","List","Purge","Update","Restore",
    ]

    secret_permissions = [
      "Set","Get","Delete","Purge","Restore","List",
    ]
  }

  access_policy {
    
    tenant_id     = data.azurerm_client_config.current.tenant_id
    object_id     = "22b187f1-26bb-4314-b512-ded94c4b8f81"
    key_permissions = [
      "Get","List",
    ]

    secret_permissions = [
     "Get", "List",
    ]
  }
}

