output "cluster_endpoint" {
  description = "Endpoint of the created cluster"
  value       = kind_cluster.default.endpoint
}
