variable "linux_image" {
  description = "linux image Amazon"
  type        = string
  default     = "ami-0e242b0ebd8e91b4c"
}

variable "istance_type" {
  description = "t2-micro"
  type        = string
  default     = "t2.micro"
}

variable "security_groups" {
  description = "wizard-1"
  type        = string
  default     = "sg-0012776fa7fe41a93"
}

variable "security_group_http" {
  description = "only allow HTTP"
  type        = string
  default     = "sg-093056215a1d87bab"
}

variable "subnet" {
  description = "my subnets"
  type        = list(string)
  default     = ["subnet-049beeb42dadbf662", "subnet-0c195b6cb0cbcfc58", "subnet-0405b64aa0eea4e71"]
}
variable "defaultvpc" {
  description = "my default vpc"
  type        = string
  default     = "vpc-0baab4ac02004afff"
}

