# Set variables
variable "env" {
  type        = string
  description = "Set environment name"
  default     = "Dev"
}

variable "vpc_cidr" {
  type        = string
  description = "VPC CIDR"
  default     = "172.0.0.0/16"
}

variable "availability_zone" {
  type        = list(string)
  description = "Availability Zone"
  default     = ["us-east-1a", "us-east-1b", "us-east-1c"]
}

variable "public_subnet_cidr_az_a" {
  type        = list(string)
  description = "Public subnet CIDR within AZ-a"
  default     = ["172.0.102.0/24", "172.0.103.0/24"]
}

variable "public_subnet_interfix" {
  type        = string
  description = "Give interfix to public subnet name"
  default     = "public"
}

variable "private_subnet_cidr_az_a" {
  type        = list(string)
  description = "Private subnet CIDR within AZ-a"
  default     = ["172.0.104.0/24", "172.0.105.0/24"]
}

variable "private_subnet_interfix" {
  type        = string
  description = "Give interfix to private subnet name"
  default     = "private"
}

# variable "additional_tags" {
#   type        = map(string)
#   description = "Variable if additional tags is needed"
#   default     = {}
# }

variable "default_route" {
  type        = string
  description = "Default Route from and to internet"
  default     = "0.0.0.0/0"
}