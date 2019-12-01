data "aws_caller_identity" "current" {}
data "aws_iam_policy_document" "kinesis_assume_role" {
  statement {
    effect = "Allow"
    actions = [
      "sts:AssumeRole",
    ]
    principals {
      identifiers = ["firehose.amazonaws.com"]
      type        = "Service"
    }
  }
}

data "aws_iam_policy_document" "kinesis" {
  statement {
    effect = "Allow"
    actions = [
      "s3:GetBucketLocation",
      "s3:ListBucket",
      "s3:ListBucketMultipartUploads",
    ]
    resources = [
      "arn:aws:s3:::${local.s3_bucket_name}",
    ]
  }
  statement {
    effect = "Allow"
    actions = [
      "s3:AbortMultipartUpload",
      "s3:GetObject",
      "s3:PutObject",
    ]
    resources = [
      "arn:aws:s3:::${local.s3_bucket_name}/*",
    ]
  }
  statement {
    effect = "Allow"
    actions = [
      "logs:PutLogEvents",
    ]
    resources = ["*"]
  }
}

data "aws_iam_policy_document" "kinesis_event_assume_role" {
  statement {
    effect = "Allow"
    actions = [
      "sts:AssumeRole",
    ]
    principals {
      identifiers = ["ses.amazonaws.com"]
      type        = "Service"
    }
    condition {
      test     = "StringEquals"
      values   = [data.aws_caller_identity.current.account_id]
      variable = "sts:ExternalId"
    }
  }
}

data "aws_iam_policy_document" "event" {
  statement {
    effect = "Allow"
    actions = [
      "firehose:PutRecord",
      "firehose:PutRecordBatch"
    ]
    resources = [
      "*",
    ]
  }
}
