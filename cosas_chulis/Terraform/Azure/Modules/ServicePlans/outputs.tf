output "outspid" { 
    value       = azurerm_app_service_plan.app_service_FCT_test.id
    description = "Azure Service Plan id"
    sensitive = true
}