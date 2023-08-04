variable "product_base_name" {
  description = "Cloud resources base name (used to create services)."
  type        = string
}

variable "project" {
  description = "ID of the project in which the resources should be created."
  type        = string
  default     = null
}

variable "region" {
  description = "The location or cloud resources region for the environment."
  type        = string
  default     = null
}

variable "env" {
  description = "Variable to mark the environment of the resource (used to create services)."
  type        = string
}

variable "suffix" {
  description = "Suffix for resource names"
  type        = string
  default     = ""
}

variable "node_config" {
  description = <<-EOT
  An optional object containing Google Cloud Composer node configuration settings. You can set network, subnetwork, service_account, tags, ip_allocation_policy, and enable_ip_masq_agent parameters. All parameters are optional and can be individually skipped.
  EOT
  type = object({
    network         = optional(string)
    subnetwork      = optional(string)
    service_account = optional(string)
    tags            = optional(list(string))
    ip_allocation_policy = optional(list(object({
      cluster_secondary_range_name  = optional(string)
      services_secondary_range_name = optional(string)
      cluster_ipv4_cidr_block       = optional(string)
      services_ipv4_cidr_block      = optional(string)
      use_ip_aliases                = bool
    })))
    enable_ip_masq_agent = optional(bool)
  })
  default = {}
}

variable "software_config" {
  description = <<-EOT
  An optional object containing Google Cloud Composer software configuration settings. You can set airflow_config_overrides, pypi_packages, env_variables, image_version, and cloud_data_lineage_integration parameters. All parameters are optional and can be individually skipped.
  EOT
  type = object({
    airflow_config_overrides = optional(map(string))
    pypi_packages            = optional(map(string))
    env_variables            = optional(map(string))
    image_version            = string
  })
  default = null
}

variable "private_environment_config" {
  description = "This variable allow to configure your Google Cloud project networking for Private IP environments"
  type = object({
    enable_private_endpoint                = bool
    master_ipv4_cidr_block                 = optional(string)
    cloud_sql_ipv4_cidr_block              = optional(string)
    cloud_composer_network_ipv4_cidr_block = optional(string)
    enable_privately_used_public_ips       = optional(bool)
    cloud_composer_connection_subnetwork   = optional(string)
  })
  default = {
    enable_private_endpoint = false
  }
}

variable "kms_key_name" {
  description = <<-EOT
Customer-managed Encryption Key available through Google's Key Management Service.
It must be the fully qualified resource name, i.e. projects/project-id/locations/location/keyRings/keyring/cryptoKeys/key.
Cannot be updated
  EOT
  type        = string
  default     = null
}

variable "maintenance_window" {
  description = "value"
  type = object({
    start_time = string
    end_time   = string
    recurrence = string
  })
  default = null
}

variable "recovery_config" {
  description = "value"
  type = object({
    enabled                    = optional(bool)
    snapshot_location          = optional(string)
    snapshot_creation_schedule = optional(string)
    time_zone                  = optional(string)
  })
  default = null
}

variable "scheduler" {
  description = "value"
  type = object({
    cpu        = optional(number)
    memory_gb  = optional(number)
    storage_gb = optional(number)
    count      = optional(number)
  })
  default = null
}

variable "web_server" {
  description = "value"
  type = object({
    cpu        = optional(number)
    memory_gb  = optional(number)
    storage_gb = optional(number)
  })
  default = null
}

variable "worker" {
  description = "value"
  type = object({
    cpu        = optional(number)
    memory_gb  = optional(number)
    storage_gb = optional(number)
    min_count  = optional(number)
    max_count  = optional(number)
  })
  default = null
}

variable "environment_size" {
  description = <<-EOT
  The environment size controls the performance parameters of the managed Cloud Composer infrastructure that includes the Airflow database.
  Possible values are ENVIRONMENT_SIZE_SMALL, ENVIRONMENT_SIZE_MEDIUM, and ENVIRONMENT_SIZE_LARGE
  EOT
  type        = string
  default     = null
}

variable "resilience_mode" {
  description = <<-EOT
  The resilience mode states whether high resilience is enabled for the environment or not.
  Value for resilience mode is HIGH_RESILIENCE.
  If unspecified, defaults to standard resilience
  EOT
  type        = string
  default     = null
}

variable "master_authorized_networks_config" {
  description = <<-EOT
  Configuration options for the master authorized networks feature.
  Enabled master authorized networks will disallow all external traffic to access Kubernetes master through HTTPS except traffic from the given CIDR blocks, Google Compute Engine Public IPs and Google Prod IPs.
  EOT
  type = object({
    enabled = bool
    cidr_blocks = list(object({
      display_name = optional(string)
      cidr_block   = string
    }))
  })
  default = null
}

variable "labels" {
  description = "The labels associated with this dataset. You can use these to organize and group your datasets."
  type        = map(string)
  default     = {}
}
