resource "aws_s3_bucket" "default" {
  bucket = var.bucket_name
}

resource "aws_s3_object" "default" {
  bucket = aws_s3_bucket.default.bucket
  key    = var.object_name
  source = var.config_filename
}
