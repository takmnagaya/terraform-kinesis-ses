resource "aws_ses_configuration_set" "monitor" {
  name = local.kinesis_name
}

resource "aws_ses_event_destination" "monitor" {
  configuration_set_name = aws_ses_configuration_set.monitor.name
  name                   = "event-kinesis"
  enabled                = true
  matching_types = [
    "send",
    "reject",
    "bounce",
    "complaint",
    "delivery",
    "open",
    "click",
    "renderingFailure",
  ]
  kinesis_destination {
    role_arn   = data.aws_iam_role.ses-event.arn
    stream_arn = aws_kinesis_firehose_delivery_stream.monitor.arn
  }
}
