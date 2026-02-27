output "network" {
  value = {
    id                    = vkcs_networking_network.this.id
    name                  = vkcs_networking_network.this.name
    description           = vkcs_networking_network.this.description
    tags                  = vkcs_networking_network.this.all_tags
    sdn                   = vkcs_networking_network.this.sdn
    admin_state_up        = vkcs_networking_network.this.admin_state_up
    port_security_enabled = vkcs_networking_network.this.port_security_enabled
    private_dns_domain    = vkcs_networking_network.this.private_dns_domain
  }
}

output "subnets" {
  value = { for key, subnet in vkcs_networking_subnet.this : key => {
    id              = vkcs_networking_subnet.this[key].id
    name            = vkcs_networking_subnet.this[key].name
    description     = vkcs_networking_subnet.this[key].description
    network_id      = vkcs_networking_subnet.this[key].network_id
    cidr            = vkcs_networking_subnet.this[key].cidr
    gateway_ip      = vkcs_networking_subnet.this[key].gateway_ip
    allocation_pool = vkcs_networking_subnet.this[key].allocation_pool
    }
  }
}
