output "outrglocation" { 
    value       = azurerm_resource_group.desplieguewebapptest.location
    description = "Azure Resource Group location"
}

output "outrgname" { 
    value       = azurerm_resource_group.desplieguewebapptest.name
    description = "Azure Resource Group name"
}