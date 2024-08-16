resource "kubernetes_namespace" "s3_app" {
  metadata {
    name   = var.s3_app.namespace
    labels = var.s3_app.labels
  }
}

resource "kubernetes_ingress_v1" "s3_app" {
  metadata {
    name      = "s3-app"
    namespace = kubernetes_namespace.s3_app.id
    labels    = var.s3_app.labels
  }
  spec {
    ingress_class_name = var.s3_app.ingress_class_name
    rule {
      http {
        path {
          backend {
            service {
              name = kubernetes_service.s3_app.metadata[0].name
              port {
                number = kubernetes_service.s3_app.spec[0].port[0].port
              }
            }
          }
          path = var.s3_app.ingress_path
        }
      }
    }
  }
}

resource "kubernetes_service" "s3_app" {
  metadata {
    name      = "s3-app"
    namespace = kubernetes_namespace.s3_app.id
    labels    = var.s3_app.labels
  }
  spec {
    selector = var.s3_app.labels
    port {
      port        = 80
      target_port = kubernetes_deployment.s3_app.spec[0].template[0].spec[0].container[0].port[0].container_port
    }
  }
}

resource "kubernetes_deployment" "s3_app" {
  metadata {
    name      = "s3-app"
    namespace = kubernetes_namespace.s3_app.id
    labels    = var.s3_app.labels
  }
  spec {
    replicas = var.s3_app.replicas
    selector {
      match_labels = var.s3_app.labels
    }
    template {
      metadata {
        labels = var.s3_app.labels
      }
      spec {
        container {
          image = var.s3_app.image
          name  = var.s3_app.namespace
          dynamic "env" {
            for_each = var.s3_app.env_vars
            content {
              name  = env.value.name
              value = env.value.value
            }
          }
          port {
            container_port = element([for e in var.s3_app.env_vars : e.value if e.name == "PORT"], 0)
          }
          resources {
            limits = {
              cpu    = "500m"
              memory = "500M"
            }
            requests = {
              cpu    = "250m"
              memory = "50M"
            }
          }
        }
      }
    }
  }
}
