variable "nginx_ingress" {
  default = {
    namespace          = "s3-app"
    replicas           = 1
    ingress_class_name = "camunda-nginx"
    chart_repository   = "https://kubernetes.github.io/ingress-nginx"
    chart_name         = "ingress-nginx"
    chart_version      = "4.10.3"
  }
  description = "Configuration of the NGINX ingress"
  type = object({
    chart_name         = string
    chart_repository   = string
    chart_version      = string
    ingress_class_name = string
    namespace          = string
    replicas           = number
  })
}

variable "s3_app" {
  default = {
    namespace          = "s3-app"
    image              = "registry.camunda.cloud/library/infrastructure-experience-interview-s3-app:1.0.5"
    replicas           = 1
    ingress_class_name = "camunda-nginx"
    ingress_path       = "/s3-app"
    labels = {
      app = "s3-app"
    }
    env_vars = [
      {
        name  = "S3_BUCKET"
        value = "test-bucket"
      },
      {
        name  = "S3_OBJECT"
        value = "test-file"
      },
      {
        name  = "AWS_ACCESS_KEY_ID"
        value = "mock_access_key"
      },
      {
        name  = "AWS_SECRET_ACCESS_KEY"
        value = "mock_secret_key"
      },
      {
        name  = "AWS_DEFAULT_REGION"
        value = "us-east-1"
      },
      {
        name  = "S3_OBJECT_CONTENT_CHECKSUM"
        value = "25912deacc5d55528e223ec7b99705cc"
      },
      {
        name  = "PORT"
        value = "8888"
      }
    ]
  }
  description = "Configuration of the S3 application"
  type = object({
    env_vars           = set(map(string))
    image              = string
    ingress_class_name = string
    ingress_path       = string
    labels             = map(string)
    namespace          = string
    replicas           = number
  })
}
