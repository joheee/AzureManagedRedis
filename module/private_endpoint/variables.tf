variable "name" {
    type = string
}
variable "rg_name" {
    type = string
}
variable "location" {
    type = string
}
variable "subnet_id" {
    type = string
}
variable "psc_name" {
    type = string
}
variable "psc_resource_id" {
    type = string
}
variable "psc_is_manual_connection" {
    type = bool
}
variable "psc_subresource_names" {
    type = list(string)
}