resource "kind_cluster" "default" {
  name           = var.cluster_name
  node_image     = "kindest/node:v${var.cluster_version}"
  wait_for_ready = true
  kind_config {
    api_version = "kind.x-k8s.io/v1alpha4"
    kind        = "Cluster"
    node {
      role = "control-plane"
    }
    node {
      role = "worker"
      extra_port_mappings {
        container_port = 80
        host_port      = 8086
      }
    }
  }
}
