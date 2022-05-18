variable "name"{
    
    default = ""
}
variable "value" {
    default = "szechuan"
}

variable "key_vault_id" {
    default = ""
}

variable "connectionstrings" {
    type = list(string)
    default = []
 }

 variable "connstr" {
    default = ""
 }
  variable "connstr1" {
    default = ""
 }