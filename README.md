# Spring Boot Application Deployment on AWS Fargate with ALB

This project demonstrates how to deploy a Spring Boot application using AWS Fargate and an Application Load Balancer (ALB) with Terraform.

## Overview

The setup includes:

- An ECS Cluster with container insights enabled
- IAM roles and policies for ECS task execution
- ECS Task Definition for a Spring Boot application container
- Security Groups for ALB and ECS service
- ECS Service with auto-scaling policies
- CloudWatch Logs for monitoring
- Application Load Balancer (ALB) with a target group and listener

## Prerequisites

- Terraform v0.12+
- AWS CLI configured with appropriate credentials
- Docker image of the Spring Boot application pushed to a container registry

## Usage

1. **Clone the repository**:

   ```bash
   git clone https://github.com/your-repo/springboot-aws-fargate-alb.git
   cd springboot-aws-fargate-alb
   ```
2. **Initialize Terraform**:

```bash
terraform init
```
3. **Configure variables based on your VPC and subnet in the variable.tf file**:
4. **Apply Terraform configuration**:

```bash
terraform apply 
```
