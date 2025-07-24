# SQS-Lambda-nodejs
A Credit card processing app using SQS and Lambda. This app takes requests from users and uses SQS to queue those credit card requests. It then uses lambda to process those transactions from the queue.
## Tools used
### SQS
### SNS
### Lambda
### IAM
### Cloudwatch
## Create the terraform file
- Create the SQS and assign a role to it. The role needs to give it all SQS permissions
- Create an SNS to receive output that isn't processed
- Create the lambda on the console and connect the input to be SQS and SNS to received the unproccessed output.
## Message watch
- Check on cloudwatch to confirm if the message was received by lambda.
- Check if there were any errors or if there was 100% accuracy.