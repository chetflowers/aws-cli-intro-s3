#!/bin/bash

# Make sure a BUCKET_NAME is provided
if [ -z "$1" ]; then
  echo "Usage: ./upload-file.sh <bucket-name>"
  exit 1
fi

BUCKET_NAME=$1

# Create a simple file if it doesn't exist
echo "This is my first AWS CLI upload project file." > testfile.txt

# Upload to S3
aws s3 cp testfile.txt s3://$BUCKET_NAME/

# Confirm upload
aws s3 ls s3://$BUCKET_NAME/
