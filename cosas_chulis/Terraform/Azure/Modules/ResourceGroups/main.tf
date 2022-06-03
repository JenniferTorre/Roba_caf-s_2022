#Definimos el resource group a crear
resource "azurerm_resource_group" "desplieguewebapptest" {
    name     = "webapp_test"
    location = "westeurope"

    tags = {
        iniciales = "SAS"
        Entorno = "TEST"
    }
}

