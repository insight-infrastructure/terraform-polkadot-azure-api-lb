output "lb_public_ip" {
  value = azurerm_public_ip.this.ip_address
}

output "lb_frontend_ip_config_name" {
  value = azurerm_lb.this.frontend_ip_configuration[0].name
}

output "lb_id" {
  value = azurerm_lb.this.id
}
