resource "kubernetes_namespace" "nginx_ingress" {
  metadata {
    name = var.nginx_ingress.namespace
  }
}

resource "helm_release" "nginx_ingress" {
  chart      = var.nginx_ingress.chart_name
  name       = var.nginx_ingress.chart_name
  namespace  = kubernetes_namespace.nginx_ingress.id
  repository = var.nginx_ingress.chart_repository
  values = [
    templatefile(
      "../modules/deploy/nginx-helm-chart-values-template.yaml",
      {
        ingressClassName = var.nginx_ingress.ingress_class_name,
        replicas         = var.nginx_ingress.replicas
      }
    )
  ]
  version = var.nginx_ingress.chart_version
}
