module "label" {
  source = "github.com/robc-io/terraform-null-label.git?ref=0.16.1"
  tags = {
    NetworkName = var.network_name
    Owner       = var.owner
    Terraform   = true
    VpcType     = "main"
  }

  environment = var.environment
  namespace   = var.namespace
  stage       = var.stage
}

data azurerm_resource_group "this" {
  name = var.azure_resource_group_name
}

resource "azurerm_public_ip" "this" {
  name                = "api-lb-pub-ip"
  location            = var.region
  resource_group_name = data.azurerm_resource_group.this.name
  allocation_method   = "Static"
}

resource "azurerm_lb" "this" {
  name                = "api-lb"
  location            = var.region
  resource_group_name = data.azurerm_resource_group.this.name
  tags                = module.label.tags

  frontend_ip_configuration {
    name                 = "api-lb-pub-ip"
    public_ip_address_id = azurerm_public_ip.this.id
  }
}

resource "azurerm_lb_backend_address_pool" "this" {
  loadbalancer_id     = azurerm_lb.this.id
  name                = "BackendAddressPool"
  resource_group_name = data.azurerm_resource_group.this.name
}

resource "azurerm_lb_probe" "node-synced" {
  loadbalancer_id     = azurerm_lb.this.id
  name                = "node-sync-hc"
  port                = 5500
  protocol            = "Http"
  request_path        = "/"
  resource_group_name = data.azurerm_resource_group.this.name
}

resource "azurerm_lb_rule" "substrate-rpc" {
  name            = "substrateRPC"
  loadbalancer_id = azurerm_lb.this.id

  frontend_ip_configuration_name = "api-lb-pub-ip"
  frontend_port                  = 9933

  backend_address_pool_id = azurerm_lb_backend_address_pool.this.id
  backend_port            = 9933
  probe_id                = azurerm_lb_probe.node-synced.id

  load_distribution   = "SourceIPProtocol"
  protocol            = "Tcp"
  resource_group_name = data.azurerm_resource_group.this.name
}
