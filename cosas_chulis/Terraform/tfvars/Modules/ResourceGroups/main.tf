#Definimos el resource group a crear
resource "azurerm_resource_group" "desplieguewebapptest" {
    name     = var.rgname
    location = var.rglocation

    tags = {
        iniciales = "SAS"
        Entorno = "TEST"
    }
}

