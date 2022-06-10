# Definimos el resource group a crear
resource "azurerm_resource_group" "desplieguemv" {
    name     = var.name
    location = var.location
    tags = var.tags
}