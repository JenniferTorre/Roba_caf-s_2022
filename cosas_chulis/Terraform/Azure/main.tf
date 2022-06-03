# PROVIDERS
provider "azurerm" {
    # The "feature" block is required for AzureRM provider 2.x.
    # If you're using version 1.x, the "features" block is not allowed.
    version     = "~>2.0"
    skip_provider_registration = true
    features {}
}

# Declaramos nuestros módulos
module "webapps" {
    source      = "./Modules/Webapps/"

    spid        = module.serviceplans.outspid
    rgname      = module.resourcegroups.outrgname
    rglocation  = module.resourcegroups.outrglocation
}

module "resourcegroups" {
    source      = "./Modules/ResourceGroups"
}

module "serviceplans" {
    source      = "./Modules/ServicePlans"

    rgname      = module.resourcegroups.outrgname
    rglocation  = module.resourcegroups.outrglocation
}

module "virtualmachines" {
    source      = "./Modules/VirtualMachines"
}
