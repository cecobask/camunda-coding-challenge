output "nginx_ingress_app_version" {
  description = "Application version of the created NGINX ingress"
  value       = helm_release.nginx_ingress.metadata[0].app_version
}
