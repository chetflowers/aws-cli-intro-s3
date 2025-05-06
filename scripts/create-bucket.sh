#!/bin/bash

# Generate a unique bucket name using timestamp
BUCKET_NAME="chet-cli-s3-demo-$(date +%s)"

# Create the bucket in us-east-1
aws s3 mb s3://$BUCKET_NAME --region us-east-1

# Confirm the bucket was created
echo "Created bucket: $BUCKET_NAME"
aws s3 ls | grep "$BUCKET_NAME"
