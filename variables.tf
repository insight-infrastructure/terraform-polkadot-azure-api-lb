#####
# Azure
#####

variable "azure_resource_group_name" {
  description = "Name of Azure Resource Group"
  type        = string
}

########
# Label
########
variable "tags" {
  description = ""
  type        = map(string)
  default     = {}
}

//variable "environment" {
//  description = "The environment"
//  type        = string
//  default     = ""
//}
//
//variable "namespace" {
//  description = "The namespace to deploy into"
//  type        = string
//  default     = ""
//}
//
//variable "stage" {
//  description = "The stage of the deployment"
//  type        = string
//  default     = ""
//}

variable "network_name" {
  description = "The network name, ie kusama / mainnet"
  type        = string
  default     = ""
}

//variable "owner" {
//  description = "Owner of the infrastructure"
//  type        = string
//  default     = ""
//}

variable "region" {
  description = "The Azure region to deploy in"
  type        = string
  default     = "eastus"
}

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