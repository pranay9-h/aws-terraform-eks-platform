# Security

## Never commit

- AWS access keys or secret keys
- kubeconfig files
- Terraform state files
- real `.tfvars` files containing secrets
- private keys or certificates
- passwords, API tokens, or GitHub tokens

## AWS authentication

Prefer short-lived credentials through AWS IAM Identity Center, assumed roles, or another approved credential provider. Avoid hard-coded long-lived access keys.

## Terraform state

Remote state may contain sensitive resource attributes. Keep the S3 bucket private, encrypted, versioned, and access-controlled.

## State locking

This repository demonstrates DynamoDB-based locking because it remains common in enterprise Terraform estates. For new deployments, review the current Terraform S3 backend locking options supported by your Terraform version.

## Reporting

Do not publish credentials or exploit details in a public issue.
