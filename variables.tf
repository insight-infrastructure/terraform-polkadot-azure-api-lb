#######
# Azure
#######
variable "azure_resource_group_name" {
  description = "Name of Azure Resource Group"
  type        = string
}

variable "region" {
  description = "The Azure region to deploy in"
  type        = string
  default     = "eastus"
}

#######
# Label
#######
variable "tags" {
  description = "Tags in the form of key value pairs to associate with resources"
  type        = map(string)
  default     = {}
}

variable "network_name" {
  description = "The network name, ie kusama / mainnet"
  type        = string
  default     = ""
}

########
# Params
########
variable "use_external_lb" {
  description = "Bool to switch between public (true) or private (false)"
  type        = bool
  default     = true
}

variable "subnet_id" {
  description = "Subnet ID to deploy load balancer into"
  type        = string
  default     = ""
}