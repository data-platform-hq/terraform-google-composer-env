locals {
  suffix = length(var.suffix) == 0 ? "" : "-${var.suffix}"
}

resource "google_composer_environment" "this" {
  name = "${var.product_base_name}-${var.env}${local.suffix}-test-composer"
  config {
    dynamic "node_config" {
      for_each = var.node_config != null ? [var.node_config] : []
      content {
        network              = lookup(var.node_config, "network", null)
        subnetwork           = lookup(var.node_config, "subnetwork", null)
        service_account      = lookup(var.node_config, "service_account", null)
        tags                 = lookup(var.node_config, "tags", null)
        ip_allocation_policy = lookup(var.node_config, "ip_allocation_policy", null)
        enable_ip_masq_agent = lookup(var.node_config, "enable_ip_masq_agent", null)
      }
    }

    dynamic "software_config" {
      for_each = var.software_config != null ? [var.software_config] : []
      content {
        airflow_config_overrides = lookup(var.software_config, "airflow_config_overrides", null)
        pypi_packages            = lookup(var.software_config, "pypi_packages", null)
        env_variables            = lookup(var.software_config, "env_variables", null)
        image_version            = lookup(var.software_config, "image_version", null)
      }
    }

    dynamic "private_environment_config" {
      for_each = var.private_environment_config != null ? [var.private_environment_config] : []
      content {
        enable_private_endpoint                = lookup(var.private_environment_config, "enable_private_endpoint", null)
        master_ipv4_cidr_block                 = lookup(var.private_environment_config, "master_ipv4_cidr_block", null)
        cloud_sql_ipv4_cidr_block              = lookup(var.private_environment_config, "cloud_sql_ipv4_cidr_block", null)
        cloud_composer_network_ipv4_cidr_block = lookup(var.private_environment_config, "cloud_composer_network_ipv4_cidr_block", null)
        enable_privately_used_public_ips       = lookup(var.private_environment_config, "enable_privately_used_public_ips", null)
        cloud_composer_connection_subnetwork   = lookup(var.private_environment_config, "cloud_composer_connection_subnetwork", null)
      }
    }

    dynamic "encryption_config" {
      for_each = var.kms_key_name != null ? [var.kms_key_name] : []
      content {
        kms_key_name = var.kms_key_name
      }
    }

    dynamic "maintenance_window" {
      for_each = var.maintenance_window != null ? [var.maintenance_window] : []
      content {
        start_time = lookup(var.maintenance_window, "start_time", null)
        end_time   = lookup(var.maintenance_window, "end_time", null)
        recurrence = lookup(var.maintenance_window, "recurrence", null)
      }
    }

    dynamic "recovery_config" {
      for_each = var.recovery_config != null ? [var.recovery_config] : []
      content {
        scheduled_snapshots_config {
          enabled                    = lookup(var.recovery_config, "enabled", null)
          snapshot_location          = lookup(var.recovery_config, "snapshot_location", null)
          snapshot_creation_schedule = lookup(var.recovery_config, "snapshot_creation_schedule", null)
          time_zone                  = lookup(var.recovery_config, "time_zone", null)
        }
      }
    }

    dynamic "workloads_config" {
      for_each = anytrue([var.scheduler != null, var.web_server != null, ]) ? flatten([var.scheduler, var.web_server]) : []
      content {
        dynamic "scheduler" {
          for_each = var.scheduler != null ? [var.scheduler] : []
          content {
            cpu        = lookup(var.scheduler, "cpu", null)
            memory_gb  = lookup(var.scheduler, "memory_gb", null)
            storage_gb = lookup(var.scheduler, "storage_gb", null)
            count      = lookup(var.scheduler, "count", null)
          }
        }
        dynamic "web_server" {
          for_each = var.web_server != null ? [var.web_server] : []
          content {
            cpu        = lookup(var.web_server, "cpu", null)
            memory_gb  = lookup(var.web_server, "memory_gb", null)
            storage_gb = lookup(var.web_server, "storage_gb", null)
          }
        }
        dynamic "worker" {
          for_each = var.worker != null ? [var.worker] : []
          content {
            cpu        = lookup(var.worker, "cpu", null)
            memory_gb  = lookup(var.worker, "memory_gb", null)
            storage_gb = lookup(var.worker, "storage_gb", null)
            min_count  = lookup(var.worker, "min_count", null)
            max_count  = lookup(var.worker, "max_count", null)
          }
        }
      }
    }

    environment_size = var.environment_size != null ? var.environment_size : null
    resilience_mode  = var.resilience_mode != null ? var.resilience_mode : null

    dynamic "master_authorized_networks_config" {
      for_each = var.master_authorized_networks_config != null ? [var.master_authorized_networks_config] : []
      content {
        enabled = lookup(var.master_authorized_networks_config, "enabled", false)
        dynamic "cidr_blocks" {
          for_each = var.master_authorized_networks_config.cidr_blocks
          content {
            display_name = lookup(cidr_blocks.value, "display_name", null)
            cidr_block   = lookup(cidr_blocks.value, "cidr_block", null)
          }
        }
      }
    }
  }

  labels = var.labels
}
