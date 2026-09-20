locals {
  common_tags = {
    Environment = "prod"
    ManagedBy   = "Terraform"
    Project     = var.project_name
  }
}

module "vpc" {
  source = "../../modules/vpc"

  name                 = "${var.project_name}-prod"
  vpc_cidr             = var.vpc_cidr
  availability_zones   = var.availability_zones
  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
  enable_nat_gateway   = true
  tags                 = local.common_tags
}

module "iam" {
  source = "../../modules/iam"

  cluster_name = var.cluster_name
  tags         = local.common_tags
}

module "eks" {
  source = "../../modules/eks"

  cluster_name     = var.cluster_name
  cluster_version  = var.cluster_version
  subnet_ids       = module.vpc.private_subnet_ids
  cluster_role_arn = module.iam.cluster_role_arn
  node_role_arn    = module.iam.node_role_arn
  instance_types   = var.node_instance_types
  desired_size     = 3
  min_size         = 2
  max_size         = 5
  tags             = local.common_tags
}
