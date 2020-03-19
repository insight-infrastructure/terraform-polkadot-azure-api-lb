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
  location            = var.zone
  resource_group_name = data.azurerm_resource_group.this.name
  allocation_method   = "Static"
}

resource "azurerm_lb" "this" {
  name                = "api-lb"
  location            = var.zone
  resource_group_name = data.azurerm_resource_group.this.name
  tags                = module.label.tags

  frontend_ip_configuration {
    name                 = "api-lb-pub-ip"
    public_ip_address_id = azurerm_public_ip.this.id
  }
}

