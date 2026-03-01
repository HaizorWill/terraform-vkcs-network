variable "sdn" {
  type        = string
  description = "The SDN of the network"
  default     = "sprut"
}

variable "name" {
  type        = string
  description = "The name of the network"
  default     = null
}

variable "description" {
  type        = string
  description = "The description of the network"
  default     = null
}

variable "tags" {
  type        = list(string)
  description = "The list of tags for the network"
  default     = []
}

variable "admin_state_up" {
  type        = bool
  description = "Controls the admin state of the network"
  default     = true
}

variable "port_security_enabled" {
  type        = bool
  description = "Controls the state of port security on the network"
  default     = true
}

variable "private_dns_domain" {
  type        = string
  description = "The local DNS domain of the network"
  default     = null
}

variable "value_specs" {
  type        = map(string)
  description = "The map of additional options of the network; refer to VK Cloud documentation for additional information"
  default     = {}
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
  description = "The list of subnets which are added to the network"
  default     = null
}
