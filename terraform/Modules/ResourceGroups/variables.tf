variable "name" {
    type = string
    description = "nombre del grupo de recursos"
}

variable "tags" {
    type = map(string)
    description = "tags"
}

variable "location" {
    type = string
    description = "localización del grupo de recursos"
}