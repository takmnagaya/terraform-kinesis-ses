resource "aws_s3_bucket" "ses-log" {
  bucket = local.s3_bucket_name
  acl    = "private"
}
