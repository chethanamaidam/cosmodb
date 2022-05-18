provider "azurerm" {
    features {
      key_vault {
      purge_soft_delete_on_destroy = true
    }
  }
}

module "resource_group" {
    source = "../modules/rg"
}  

module "key_vault" {
  source = "../modules/Keyvault"
  depends_on            =     [module.resource_group]
  resource_group_name   =     module.resource_group.resource_group_name
  location              =     module.resource_group.resource_location_name
}
module "cosmos_db" {
  source = "../modules/CosmosDb"
  depends_on            =     [module.resource_group]
  resource_group_name   =     module.resource_group.resource_group_name
  location              =     module.resource_group.resource_location_name
}

module "key_vault_secret" {
  source = "../modules/KeyVaultSecret"
  depends_on      =     [module.key_vault, module.cosmos_db]
  key_vault_id    =     module.key_vault.key_vault_id_output
  name            =     module.cosmos_db.cosmodb_name
  connectionstrings = [module.cosmos_db.connectionsrings[0], module.cosmos_db.connectionsrings[1],
                      module.cosmos_db.connectionsrings[2],module.cosmos_db.connectionsrings[3]]

}