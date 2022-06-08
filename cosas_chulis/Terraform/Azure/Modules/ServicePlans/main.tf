#Definimos el service plan a crear
resource "azurerm_app_service_plan" "app_service_FCT_test" {
    name                = "mv-FCT-test"
    location            = var.rglocation
    resource_group_name = var.rgname

    sku {
        tier = "Standard"
        size = "S1"
    }

    tags = {
        iniciales = "SAS"
        Entorno = "TEST"
    }
}