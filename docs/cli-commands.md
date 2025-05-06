## Step 0: Set Up Local Project and Git Repository

```bash
# Create the main project folder
mkdir aws-cli-intro-s3
cd aws-cli-intro-s3

# Create folder structure
mkdir scripts docs screenshots

# Create initial files
touch README.md .gitignore
touch scripts/create-bucket.sh
touch scripts/upload-file.sh
touch scripts/list-buckets.sh
touch docs/cli-commands.md

# Ignore Mac system files
echo ".DS_Store" >> .gitignore

# Initialize a local Git repository
git init

# (Optional) Set Git identity for this project
git config user.name "Chet Flowers"
git config user.email "chet.flowers@icloud.com"

# Stage and commit initial files
git add .
git commit -m "Initial folder structure for AWS CLI S3 project"
```

This sets up the base for version-controlled AWS CLI automation and documentation.

## Step 1: Configure AWS CLI and Verify Identity

```bash
# Configure the AWS CLI with your IAM user credentials
aws configure
```

You'll be prompted to enter:

- AWS Access Key ID
- AWS Secret Access Key
- Default region name (e.g., us-east-1)
- Default output format (e.g., json)

```bash
# Confirm CLI access by checking your AWS identity
aws sts get-caller-identity
```

Expected output (example):

```json
{
    "UserId": "AIDAEXAMPLEID123",
    "Account": "123456789012",
    "Arn": "arn:aws:iam::123456789012:user/cli-user"
}
```
This confirms you're successfully authenticated with your IAM user.
```

---

## Step 2: Create an S3 Bucket Using AWS CLI

```bash
# Generate a unique bucket name with your name and a timestamp
export BUCKET_NAME=chet-cli-s3-demo-$(date +%s)

# (Optional) Print the name to confirm it looks right
echo $BUCKET_NAME

# Create the bucket in the us-east-1 region
aws s3 mb s3://$BUCKET_NAME --region us-east-1

# List all buckets to verify creation
aws s3 ls
```

Expected output after creation:

```
make_bucket: s3://chet-cli-s3-demo-<timestamp>
```

---

## Step 3: Upload a File to S3 and Verify

```bash
# Create a sample file
echo "This is my first AWS CLI upload project file." > testfile.txt

# Optional: View file content
cat testfile.txt

# Upload the file to S3
aws s3 cp testfile.txt s3://$BUCKET_NAME/

# Verify the file exists in the bucket
aws s3 ls s3://$BUCKET_NAME/
```

Expected output:

```
2025-05-06 00:35:22       45 testfile.txt
```
