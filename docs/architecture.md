# Architecture

```mermaid
flowchart TD
    DEV[Developer / CI] --> TF[Terraform]
    TF --> STATE[S3 Remote State]
    TF --> LOCK[DynamoDB State Lock]
    TF --> VPC[AWS VPC]
    VPC --> PUB[Public Subnets]
    VPC --> PRIV[Private Subnets]
    PRIV --> EKS[Amazon EKS]
    EKS --> NG[Managed Node Group]
    TF --> IAM[IAM Roles]
    IAM --> EKS
    IAM --> NG
```

## Design choices

- EKS worker nodes run in private subnets.
- Public subnets are available for internet-facing load balancers and NAT egress.
- Terraform state is stored outside source control in an encrypted, versioned S3 bucket.
- DynamoDB locking is included to demonstrate a common enterprise team workflow.
- Development and production compose the same reusable modules with different inputs.
- NAT Gateway is enabled for realism but incurs AWS charges; disable it for low-cost experimentation when private egress is not needed.
