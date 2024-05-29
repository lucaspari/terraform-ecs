// test
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.51.1"
    }
  }
}
provider "aws" {
  profile = "default"
  region  = "sa-east-1"
}
resource "aws_ecs_cluster" "demo_ecs_cluster" {
  name = "demo_ecs_cluster"

  setting {
    name  = "containerInsights"
    value = "enabled"
  }
}


