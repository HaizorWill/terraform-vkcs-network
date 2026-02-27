variable "sdn" {
  type    = string
  default = "sprut"
}

variable "name" {
  type    = string
  default = null
}

variable "description" {
  type    = string
  default = null
}

variable "tags" {
  type    = list(string)
  default = []
}

variable "admin_state_up" {
  type    = bool
  default = true
}

variable "port_security_enabled" {
  type    = bool
  default = true
}

variable "private_dns_domain" {
  type    = string
  default = "mcs.local."
}

variable "value_specs" {
  type    = map(string)
  default = {}
}

variable "vkcs_services_access" {
  type    = bool
  default = null
}

variable "subnets" {
  type = list(object({
    name         = optional(string)
    description  = optional(string)
    tags         = optional(list(string))
    resource_key = optional(string)
    cidr         = optional(string)
    no_gateway   = optional(bool)
    gateway_ip   = optional(string)
    enable_dhcp  = optional(bool)
    allocation_pool = optional(list(object({
      start = string
      end   = string
    })))
    enable_private_dns = optional(bool)
    dns_nameservers    = optional(list(string))
  }))
  default = null
}
