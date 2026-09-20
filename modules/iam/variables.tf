variable "cluster_name" {
  description = "EKS cluster name used in IAM role naming."
  type        = string
}

variable "tags" {
  description = "Common tags applied to resources."
  type        = map(string)
  default     = {}
}
