resource "aws_iam_role" "kinesis" {
  name               = "ses-firehose-to-s3"
  assume_role_policy = data.aws_iam_policy_document.kinesis_assume_role.json
}

resource "aws_iam_role_policy" "kinesis" {
  policy = data.aws_iam_policy_document.kinesis.json
  role   = aws_iam_role.kinesis.id
}

resource "aws_iam_role" "event" {
  name               = "ses-firehose-to-s3-event"
  assume_role_policy = data.aws_iam_policy_document.kinesis_event_assume_role.json
}

resource "aws_iam_role_policy" "event" {
  policy = data.aws_iam_policy_document.event.json
  role   = aws_iam_role.event.id
}
