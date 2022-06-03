# Definimos el app service a crear
resource "azurerm_app_service" "test" {
    name                = "webapp-FCT"
    location            = var.rglocation
    resource_group_name = var.rgname
    app_service_plan_id = var.spid

    app_settings = {
        "ApiUrl" = "www.google.es",
        "Version" = "1.0"
    }

    tags = {
        iniciales = "SAS"
        Entorno = "TEST"
    }
}