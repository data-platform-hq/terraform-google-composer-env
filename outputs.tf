output "airflow_url" {
  description = " The URI of the Apache Airflow Web UI hosted within this environment."
  value       = google_composer_environment.main.config.0.airflow_uri
}

output "dags_bucket" {
  description = "The Cloud Storage prefix of the DAGs for this environment"
  value       = google_composer_environment.main.config.0.dag_gcs_prefix
}
