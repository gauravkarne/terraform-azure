provider "azurerm" {
  features {}
}

resource "azurerm_storage_account" "sa1" {
  name                     = "grkstorage"
  resource_group_name      = "TerraformRG"
  location                 = "East US"
  account_tier             = "Standard"
  account_replication_type = "LRS"
}


resource "azurerm_storage_container" "cont2" {
  name                  = "gk2container"
  storage_account_name  = azurerm_storage_account.sa1.name
  container_access_type = "private"
}

/*resource "azurerm_storage_blob" "blob1" {
  name                   = "gk1storageblob"
  storage_account_name   = azurerm_storage_account.sa1.name
  storage_container_name = azurerm_storage_container.cont2.name
  type                   = "Block"
  source                 = "Demo.zip"
}*/
