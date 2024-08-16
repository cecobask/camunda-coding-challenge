variable "cluster_name" {
  default     = "test-cluster"
  description = "Name of the cluster to be created"
  type        = string
}

variable "cluster_version" {
  default     = "1.30.0"
  description = "Version of Kubernetes to use in cluster nodes"
  type        = string
}

variable "bucket_name" {
  default     = "test-bucket"
  description = "Name of the S3 bucket"
  type        = string
}

variable "object_name" {
  default     = "test-file"
  description = "Name of the S3 object"
  type        = string
}

variable "config_filename" {
  default     = "bucket-file.json"
  description = "Path of the file to be uploaded to S3"
  type        = string
}
