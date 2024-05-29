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
resource "aws_iam_role" "ecs_task_execution_role" {
  name = "ecsTaskExecutionRole"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Principal = {
          Service = "ecs-tasks.amazonaws.com"
        }
        Effect = "Allow"
        Sid    = ""
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "ecs_task_execution_policy" {
  role       = aws_iam_role.ecs_task_execution_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
}

resource "aws_ecs_task_definition" "demo_task_definition" {
  family                   = "springboot-task"
  requires_compatibilities = ["FARGATE"]
  runtime_platform {
    operating_system_family = "LINUX"
    cpu_architecture        = "ARM64"
  }
  network_mode       = "awsvpc"
  cpu                = 1024
  memory             = 2048
  execution_role_arn = aws_iam_role.ecs_task_execution_role.arn
  container_definitions = jsonencode([
    {
      name  = "springboot-service"
      image = "docker.io/dumbleedore/helloworldexample:latest"
      portMappings = [
        {
          containerPort = 8080
          hostPort      = 8080
        }
      ]
    },
  ])
}
