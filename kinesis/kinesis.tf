resource "aws_kinesis_firehose_delivery_stream" "monitor" {
  destination = "s3"
  name        = local.kinesis_name
  s3_configuration {
    bucket_arn = data.aws_s3_bucket.ses-log.arn
    role_arn   = data.aws_iam_role.ses-firehose.arn
    prefix     = "ses/"
  }
}
