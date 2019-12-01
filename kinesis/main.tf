provider "aws" {
  region = "us-east-1"
}

locals {
  s3_bucket_name = "ses-log-xxxx"
  kinesis_name   = "amazon-ses-monitor"
}
