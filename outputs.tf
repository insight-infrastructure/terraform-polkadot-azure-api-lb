output "lb_endpoint_ip" {
  value = var.use_external_lb ? azurerm_public_ip.this[0].ip_address : azurerm_lb.private[0].frontend_ip_configuration[0].private_ip_address
}

output "lb_frontend_ip_config_name" {
  value = var.use_external_lb ? azurerm_lb.public[0].frontend_ip_configuration[0].name : azurerm_lb.private[0].frontend_ip_configuration[0].name
}

output "lb_id" {
  value = var.use_external_lb ? azurerm_lb.public[0].id : azurerm_lb.private[0].id
}

output "lb_backend_pool_id" {
  value = azurerm_lb_backend_address_pool.this.id
}

output "lb_health_probe_id" {
  value = azurerm_lb_probe.node-synced.id
}

output "lb_rpc_rule_id" {
  value = azurerm_lb_rule.substrate-rpc.id
}
