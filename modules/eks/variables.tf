variable "cluster_name" {
  description = "EKS cluster name."
  type        = string
}

variable "cluster_version" {
  description = "Optional EKS Kubernetes version. Leave null to let AWS choose a supported default."
  type        = string
  default     = null
}

variable "subnet_ids" {
  description = "Private subnet IDs for the EKS cluster and node group."
  type        = list(string)
}

variable "cluster_role_arn" {
  description = "IAM role ARN for the EKS control plane."
  type        = string
}

variable "node_role_arn" {
  description = "IAM role ARN for the managed node group."
  type        = string
}

variable "instance_types" {
  description = "EC2 instance types used by the managed node group."
  type        = list(string)
  default     = ["t3.medium"]
}

variable "desired_size" {
  type    = number
  default = 2
}

variable "min_size" {
  type    = number
  default = 1
}

variable "max_size" {
  type    = number
  default = 3
}

variable "tags" {
  description = "Common tags applied to resources."
  type        = map(string)
  default     = {}
}
