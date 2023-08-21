# Google Composer Environments Terraform module
Terraform module for creation Google Composer Environments

## Usage

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name                                                                      | Version   |
|---------------------------------------------------------------------------|-----------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0  |
| <a name="requirement_google"></a> [google](#requirement\_google)          | >= 4.69.1 |

## Providers

| Name                                                             | Version   |
|------------------------------------------------------------------|-----------|
| <a name="requirement_google"></a> [google](#requirement\_google) | >= 4.69.1 |

## Modules

No modules.

## Resources

| Name                                                                                                                                    | Type     |
|-----------------------------------------------------------------------------------------------------------------------------------------|----------|
| [google_composer_environment.this](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/composer_environment) | resource |

## Inputs

| Name                                                                                                                                        | Description                                                                                                                                                                                                                                                                        | Type          | Default                           | Required |
|---------------------------------------------------------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|---------------|-----------------------------------|:--------:|
| <a name="input_product_base_name"></a> [product\_base\_name](#input\_product\_base\_name)                                                   | Cloud resources base name (used to create services)                                                                                                                                                                                                                                | `string`      | n/a                               |   yes    |
| <a name="input_project"></a> [project](#input\_project)                                                                                     | ID of the project in which the resources should be created                                                                                                                                                                                                                         | `string`      | null                              |   yes    |
| <a name="input_region"></a> [region](#input\_region)                                                                                        | The location or cloud resources region for the environment                                                                                                                                                                                                                         | `string`      | null                              |   yes    |
| <a name="input_env"></a> [env](#input\_env)                                                                                                 | Variable to mark the environment of the resource (used to create services)                                                                                                                                                                                                         | `string`      | n/a                               |   yes    |
| <a name="input_suffix"></a> [suffix](#input\_suffix)                                                                                        | Suffix for resource names                                                                                                                                                                                                                                                          | `string`      | ""                                |    no    |
| <a name="input_node_config"></a> [node\_config](#input\_node\_config)                                                                       | An optional object containing Google Cloud Composer node configuration settings. You can set network, subnetwork, service_account, tags, ip_allocation_policy, and enable_ip_masq_agent parameters. All parameters are optional and can be individually skipped                    | `object`      | {}                                |    no    |
| <a name="input_software_config"></a> [software\_config](#input\_software\_config)                                                           | An optional object containing Google Cloud Composer software configuration settings. You can set airflow_config_overrides, pypi_packages, env_variables, image_version, and cloud_data_lineage_integration parameters. All parameters are optional and can be individually skipped | `object`      | null                              |    no    |
| <a name="input_private_environment_config"></a> [private\_environment\_config](#input\_private\_environment\_config)                        | This variable allow to configure your Google Cloud project networking for Private IP environments                                                                                                                                                                                  | `object`      | {enable_private_endpoint = false} |   yes    |
| <a name="input_kms_key_name"></a> [kms\_key\_name](#input\_kms\_key\_name)                                                                  | Customer-managed Encryption Key available through Google's Key Management Service.<br> It must be the fully qualified resource name, i.e. projects/project-id/locations/location/keyRings/keyring/cryptoKeys/key. Cannot be updated                                                | `string`      | null                              |    no    |
| <a name="input_maintenance_window"></a> [maintenance\_window](#input\_maintenance\_window)                                                  | The configuration settings for Cloud Composer maintenance windows                                                                                                                                                                                                                  | `object`      | null                              |    no    |
| <a name="input_recovery_config"></a> [recovery\_config](#input\_recovery\_config)                                                           | The configuration settings for recovery                                                                                                                                                                                                                                            | `object`      | null                              |    no    |
| <a name="input_scheduler"></a> [scheduler](#input\_scheduler)                                                                               | Configuration for resources used by Airflow schedulers                                                                                                                                                                                                                             | `object`      | null                              |    no    |
| <a name="input_web_server"></a> [web\_server](#input\_web\_server)                                                                          | Configuration for resources used by Airflow web server                                                                                                                                                                                                                             | `object`      | null                              |    no    |
| <a name="input_worker"></a> [worker](#input\_worker)                                                                                        | Configuration for resources used by Airflow workers                                                                                                                                                                                                                                | `object`      | null                              |    no    |
| <a name="input_environment_size"></a> [environment\_size](#input\_environment\_size)                                                        | The environment size controls the performance parameters of the managed Cloud Composer infrastructure that includes the Airflow database. Possible values are ENVIRONMENT_SIZE_SMALL, ENVIRONMENT_SIZE_MEDIUM, and ENVIRONMENT_SIZE_LARGE                                          | `string`      | null                              |    no    |
| <a name="input_resilience_mode"></a> [resilience\_mode](#input\_resilience\_mode)                                                           | The resilience mode states whether high resilience is enabled for the environment or not. Value for resilience mode is HIGH_RESILIENCE. If unspecified, defaults to standard resilience                                                                                            | `string`      | null                              |    no    |
| <a name="input_master_authorized_networks_config"></a> [master\_authorized\_networks\_config](#input\_master\_authorized\_networks\_config) | Configuration options for the master authorized networks feature. Enabled master authorized networks will disallow all external traffic to access Kubernetes master through HTTPS except traffic from the given CIDR blocks, Google Compute Engine Public IPs and Google Prod IPs  | `object`      | null                              |    no    |
| <a name="input_labels"></a> [labels](#input\_labels)                                                                                        | The labels associated with this dataset. You can use these to organize and group your datasets                                                                                                                                                                                     | `map(string)` | {}                                |    no    |

## Outputs

| Name                                                                    | Description                                                         |
|-------------------------------------------------------------------------|---------------------------------------------------------------------|
| <a name="output_airflow_url"></a> [airflow\_url](#output\_airflow\_url) | The URI of the Apache Airflow Web UI hosted within the environment. |
| <a name="output_dags_bucket"></a> [dags\_bucket](#output\_dags\_bucket) | The Cloud Storage prefix of the DAGs for the environment.           |

<!-- END_TF_DOCS -->

## License

Apache 2 Licensed. For more information please see [LICENSE](https://github.com/data-platform-hq/terraform-google-composer-env/blob/main/LICENSE)
