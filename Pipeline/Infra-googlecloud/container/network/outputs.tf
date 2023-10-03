output "kubernetes_cluster_name" {
  value       = google_container_cluster.cluster-k8.name
  description = "Nome do cluster GKE"
  sensitive   = false
}

output "kubernetes_cluster_host" {
  value       = google_container_cluster.cluster-k8.endpoint
  description = "Host do cluster GKE"
  sensitive   = false
}