# General
# -------
variable "friendly_name_prefix" {
  type        = string
  description = "Name prefix used for resources"
}

variable "active_active" {
  default     = true
  type        = bool
  description = "True if TFE running in active-active configuration"
}

variable "disk_mode" {
  type        = bool
  description = "Is the production type for Terraform Enterprise 'disk'?"
}

variable "enable_ssh" {
  type        = bool
  description = "Enable SSH access on port 22 to the VM instance (standalone, load_balancer deployments only, not App GW). This is ***NOT RECOMMENDED*** for production deployments."
}

# Provider
# --------
variable "location" {
  type        = string
  description = "Azure location name e.g. East US"
}

variable "resource_group_name" {
  type        = string
  description = "Azure resource group name"
}

# Bastion
# -------
variable "create_bastion" {
  default     = true
  type        = bool
  description = "If true, will create Azure Bastion PaaS and required resources https://azure.microsoft.com/en-us/services/azure-bastion/"
}

# Network
# -------
variable "network_cidr" {
  type        = string
  description = "CIDR range for network"
}

variable "network_private_subnet_cidr" {
  type        = string
  description = "Subnet CIDR range for TFE"
}

variable "network_frontend_subnet_cidr" {
  type        = string
  description = "Subnet CIDR range for frontend"
}

variable "network_bastion_subnet_cidr" {
  type        = string
  description = "Subnet CIDR range for Bastion"
}

variable "network_redis_subnet_cidr" {
  type        = string
  description = "Subnet CIDR range for Redis"
}

variable "network_database_subnet_cidr" {
  type        = string
  description = "The CIDR range of the database subnetwork."
}

variable "network_allow_range" {
  default     = "*"
  type        = string
  description = "(Optional) Network range to allow access to TFE"
}

# Load balancer
# -------------
variable "load_balancer_type" {
  default     = "application_gateway"
  type        = string
  description = "Expected value of 'application_gateway' or 'load_balancer'"
  validation {
    condition = (
      var.load_balancer_type == "application_gateway" ||
      var.load_balancer_type == "load_balancer"
    )

    error_message = "The load_balancer_type value must be 'application_gateway' or 'load_balancer'."
  }
}

variable "load_balancer_public" {
  default     = true
  type        = bool
  description = "Load balancer will use public IP if true"
}

# Tagging
# -------
variable "tags" {
  default     = {}
  type        = map(string)
  description = "Map of tags for resource"
}
