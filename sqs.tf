resource "aws_sqs_queue" "sqs-queue" {
    name = "laini-moja-safi"
    delay_seconds = 10
    visibility_timeout_seconds = 30
    max_message_size = 2048
    message_retention_seconds = 86400
    receive_wait_time_seconds = 2
    sqs_managed_sse_enabled = true
}

data "aws_iam_policy_document" "sqs-data-policy" {
    statement {
      sid = "sqs-policy-statement"
      effect = "Allow"

      principals {
        type = "AWS"
        identifiers = ["*"]
      }
      actions = [
        "SQS:*"
      ]
      resources = [
        aws_sqs_queue.sqs-queue.arn
      ]
    }
}

resource "aws_sqs_queue_policy" "sqs-policy" {
    queue_url = aws_sqs_queue.sqs-queue.id
    policy = data.aws_iam_policy_document.sqs-data-policy.json
}