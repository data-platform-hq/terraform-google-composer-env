variable "region" {
  description = "The location or cloud resources region for the environment"
  type        = string
}

variable "product_base_name" {
  description = "Cloud resources base name (used to create services)"
  type        = string
}

variable "env" {
  description = "Variable to mark the environment of the resource (used to create services)."
  type        = string
}

variable "network" {
  description = "The Compute Engine network to be used for machine communications"
  type        = string
}

variable "subnet" {
  description = "The Compute Engine subnetwork to be used for machine communications"
  type        = string
}

variable "sa-email" {
  description = "The Google Cloud Platform Service Account to be used by the node VMs"
  type        = string
}

variable "image_version" {
  description = "The version of the software running in the environment"
  type        = string
  default     = "composer-2.0.22-airflow-2.2.5"
}

variable "environment_size" {
  description = "The environment size controls the performance parameters of the managed Cloud Composer infrastructure that includes the Airflow database"
  type        = string
  default     = "ENVIRONMENT_SIZE_SMALL"
}

variable "enable_private_endpoint" {
  description = "If true, access to the public endpoint of the GKE cluster is denied"
  type        = bool
  default     = true
}
