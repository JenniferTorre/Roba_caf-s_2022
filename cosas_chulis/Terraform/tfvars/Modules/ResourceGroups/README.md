# Un módulo de Terraform para la creación de un Resource Group en Azure.

## Funcionamiento general del módulo
El siguiente módulo de terraform usa dos variables (<code>rgname y rglocation</code>) que pueden variar en función de si se trata de un entorno de desarrollo o de producción

#### Fichero main.tf 
En este fichero se declara el recurso con las diferentes variables 
``` Terraform
resource "azurerm_resource_group" "desplieguewebapptest" {
    name     = var.rgname
    location = var.rglocation

    tags = {
        iniciales = "SAS"
        Entorno = "TEST"
    }
}
``` 

#### Fichero variables.tf
En este fichero se deben de definir las variables de entrada de nuestro módulo

``` Terraform
variable "rglocation" {
  type = string
  default = "No se ha definido una localizacion"
}

variable "rgname" {
  type = string
  default = "No se ha definido un nombre para el resource group"
}
``` 

Con el campo "default" se puede indicar un valor por defecto para inicializar la variable. Al meter el fichero tfvars sustituirá este valor por defecto por el valor indicado en el tfvars. Esto se considera **una buena práctica**, puesto que evita que se declaren variables en un módulo que no se inicialicen.

#### Fichero outputs.tf
En este fichero se indicarían los output del módulo. En este caso no se indican.
Se podrían declarar, como prueba, el valor de las variables como output

``` Terraform
output "outrglocation" { 
    value       = azurerm_resource_group.desplieguewebapptest.location
    description = "Azure Resource Group location"
}
```


## Despliegue del entorno de producción
Para llevar a cabo el despliegue del módulo en el entorno de producción se debe usar el fichero <code>dev.tfvars</code> con las variables definidas para ese entorno

``` Terraform
terraform plan -var-file="production.tfvars"
``` 

## Despliegue del entorno de desarrollo
Para llevar a cabo el despliegue del módulo en el entorno de desarrollo se debe usar el fichero <code>dev.tfvars</code> con las variables definidas para ese entorno

``` Terraform
terraform plan -var-file="dev.tfvars"
```