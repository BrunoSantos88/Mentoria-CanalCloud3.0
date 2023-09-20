resource "google_artifact_registry_repository" "my-repo" {
  location      = "us-central1"
  repository_id = "frontend"
  description   = "Aplicaçao Frontend"
  format        = "DOCKER"
}