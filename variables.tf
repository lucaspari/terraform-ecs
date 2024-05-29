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

