output "outrglocation" { 
    value       = azurerm_resource_group.desplieguemv.location
    description = "Azure Resource Group location"
}

output "outrgname" { 
    value       = azurerm_resource_group.desplieguemv.name
    description = "Azure Resource Group name"
}