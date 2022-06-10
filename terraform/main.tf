# PROVIDERS
provider "azurerm" {
    # The "feature" block is required for AzureRM provider 2.x.
    # If you're using version 1.x, the "features" block is not allowed.
    version     = "~>3.0"
    skip_provider_registration = true
    features {}
}

module "resourcegroups" {
    source      = "./Modules/ResourceGroups"
    name = var.rgname
    location = var.rglocation
    tags = var.tags
}

module "virtualmachines" {
    source      = "./Modules/VirtualMachines"
    vmlocation = module.resourcegroups.outrglocation
    rgname = var.rgname
    prefix = var.vmprefix
    tags = var.tags
}
