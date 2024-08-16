<!-- BEGIN_TF_DOCS -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_helm"></a> [helm](#provider\_helm) | n/a |
| <a name="provider_kubernetes"></a> [kubernetes](#provider\_kubernetes) | n/a |

## Resources

| Name | Type |
|------|------|
| [helm_release.nginx_ingress](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |
| [kubernetes_deployment.s3_app](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/deployment) | resource |
| [kubernetes_ingress_v1.s3_app](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/ingress_v1) | resource |
| [kubernetes_namespace.nginx_ingress](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/namespace) | resource |
| [kubernetes_namespace.s3_app](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/namespace) | resource |
| [kubernetes_service.s3_app](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/service) | resource |

## Inputs

| Name | Description | Type | Default |
|------|-------------|------|---------|
| <a name="input_nginx_ingress"></a> [nginx\_ingress](#input\_nginx\_ingress) | Configuration of the NGINX ingress | <pre>object({<br>    chart_name         = string<br>    chart_repository   = string<br>    chart_version      = string<br>    ingress_class_name = string<br>    namespace          = string<br>    replicas           = number<br>  })</pre> | <pre>{<br>  "chart_name": "ingress-nginx",<br>  "chart_repository": "https://kubernetes.github.io/ingress-nginx",<br>  "chart_version": "4.10.3",<br>  "ingress_class_name": "camunda-nginx",<br>  "namespace": "s3-app",<br>  "replicas": 1<br>}</pre> |
| <a name="input_s3_app"></a> [s3\_app](#input\_s3\_app) | Configuration of the S3 application | <pre>object({<br>    env_vars           = set(map(string))<br>    image              = string<br>    ingress_class_name = string<br>    ingress_path       = string<br>    labels             = map(string)<br>    namespace          = string<br>    replicas           = number<br>  })</pre> | <pre>{<br>  "env_vars": [<br>    {<br>      "name": "S3_BUCKET",<br>      "value": "test-bucket"<br>    },<br>    {<br>      "name": "S3_OBJECT",<br>      "value": "test-file"<br>    },<br>    {<br>      "name": "AWS_ACCESS_KEY_ID",<br>      "value": "mock_access_key"<br>    },<br>    {<br>      "name": "AWS_SECRET_ACCESS_KEY",<br>      "value": "mock_secret_key"<br>    },<br>    {<br>      "name": "AWS_DEFAULT_REGION",<br>      "value": "us-east-1"<br>    },<br>    {<br>      "name": "S3_OBJECT_CONTENT_CHECKSUM",<br>      "value": "25912deacc5d55528e223ec7b99705cc"<br>    },<br>    {<br>      "name": "PORT",<br>      "value": "8888"<br>    }<br>  ],<br>  "image": "registry.camunda.cloud/library/infrastructure-experience-interview-s3-app:1.0.5",<br>  "ingress_class_name": "camunda-nginx",<br>  "ingress_path": "/s3-app",<br>  "labels": {<br>    "app": "s3-app"<br>  },<br>  "namespace": "s3-app",<br>  "replicas": 1<br>}</pre> |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_nginx_ingress_app_version"></a> [nginx\_ingress\_app\_version](#output\_nginx\_ingress\_app\_version) | Application version of the created NGINX ingress |
<!-- END_TF_DOCS -->