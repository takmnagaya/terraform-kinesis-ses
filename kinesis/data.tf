data "aws_iam_role" "ses-firehose" {
  name = "ses-firehose-to-s3"
}

data "aws_iam_role" "ses-event" {
  name = "ses-firehose-to-s3-event"
}

data "aws_s3_bucket" "ses-log" {
  bucket = local.s3_bucket_name
}
