provider "aws" {
  region = "ap-northeast-1"
  default_tags {
    tags = {
      Env       = "stg"
      Terraform = "true"
      SystemName = "tfc-demo"
    }
  }
}
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.52.0"
    }
  }
}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"

  name = "stg-vpc-test-02"
  cidr = "10.10.0.0/16"

  azs                       = ["ap-northeast-1a", "ap-northeast-1c"]
  private_subnets           = ["10.10.1.0/24", "10.10.2.0/24"]
  public_subnets            = ["10.10.101.0/24", "10.10.102.0/24"]
}

module "ec2" {
  source = "../../modules/ec2"
  subnet_id = module.vpc.private_subnets[0]
  instance_name = "tfc-demo-stg"
}
