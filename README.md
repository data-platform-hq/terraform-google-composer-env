# Google Composer Environments Terraform module
Terraform module for creation Google Composer Environments

## Usage

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name                                                                      | Version   |
| ------------------------------------------------------------------------- | --------- |
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0  |
| <a name="requirement_google"></a> [google](#requirement\_google)          | >= 4.24.0 |

## Providers

| Name                                                             | Version   |
| ---------------------------------------------------------------- | --------- |
| <a name="requirement_google"></a> [google](#requirement\_google) | >= 4.24.0 |

## Modules

No modules.

## Resources

| Name                                                                                                                                    | Type     |
| --------------------------------------------------------------------------------------------------------------------------------------- | -------- |
| [google_composer_environment.main](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/composer_environment) | resource |

## Inputs

| Name                                                                                      | Description                                                                                                                              | Type     | Default                         | Required |
| ----------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------- | -------- | ------------------------------- | :------: |
| <a name="input_region"></a> [region](#input\_region)                                      | The location or cloud resources region for the environment                                                                               | `string` | n/a                             |   yes    |
| <a name="input_product_base_name"></a> [product\_base\_name](#input\_product\_base\_name) | Cloud resources base name (used to create services)                                                                                      | `string` | n/a                             |   yes    |
| <a name="input_env"></a> [env](#input\_env)                                               | Variable to mark the environment of the resource (used to create services)                                                               | `string` | n/a                             |   yes    |
| <a name="input_network"></a> [network](#input\_network)                                   | The Compute Engine network to be used for machine communications                                                                         | `string` | n/a                             |   yes    |
| <a name="input_subnet"></a> [subnet](#input\_subnet)                                      | The Compute Engine subnetwork to be used for machine communications                                                                      | `string` | n/a                             |   yes    |
| <a name="input_sa-email"></a> [sa-email](#input\_sa-email)                                | The Google Cloud Platform Service Account to be used by the node VMs                                                                     | `string` | n/a                             |   yes    |
| <a name="input_image_version"></a> [image\_version](#input\_image\_version)               | The version of the software running in the environment                                                                                   | `string` | "composer-2.0.22-airflow-2.2.5" |    no    |
| <a name="input_environment_size"></a> [environment\_size](#input\_environment\_size)      | The environment size controls the performance parameters of the managed Cloud Composer infrastructure that includes the Airflow database | `string` | "ENVIRONMENT_SIZE_SMALL"        |    no    |
| <a name="input_env"></a> [env](#input\_env)                                               | If true, access to the public endpoint of the GKE cluster is denied                                                                      | `bool`   | true                            |    no    |

## Outputs

| Name                                                                    | Description                                                        |
| ----------------------------------------------------------------------- | ------------------------------------------------------------------ |
| <a name="output_airflow_url"></a> [airflow\_url](#output\_airflow\_url) | The URI of the Apache Airflow Web UI hosted within the environment |
| <a name="output_dags_bucket"></a> [dags\_bucket](#output\_dags\_bucket) | The Cloud Storage prefix of the DAGs for the environment           |
<!-- END_TF_DOCS -->

## License

Apache 2 Licensed. For more information please see [LICENSE](https://github.com/data-platform-hq/terraform-google-composer-env/blob/main/LICENSE)




