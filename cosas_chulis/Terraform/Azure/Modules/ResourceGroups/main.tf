#Definimos el resource group a crear
resource "azurerm_resource_group" "desplieguemv" {
    name     = "mv_despliegue"
    location = "westeurope"

    tags = {
        iniciales = "SAS"
        Entorno = "TEST"
    }
}

