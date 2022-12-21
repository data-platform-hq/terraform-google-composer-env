resource "google_composer_environment" "main" {
  name = "${var.env}-${var.product_base_name}-composer"
  config {

    software_config {
      image_version = var.image_version
    }

    environment_size = var.environment_size

    node_config {
      network         = var.network
      subnetwork      = var.subnet
      service_account = var.sa_email
    }
    private_environment_config {
      enable_private_endpoint = var.enable_private_endpoint
    }
  }

  labels = var.labels
}
