variable "base_avaliable_zone" {
  type        = string
  default     = "eu-central-1"
  description = "Avaliable Zone variable"
}

variable "instance_type" {
  type        = string
  default     = "t2.micro"
  description = "default instnace type for testing"
}

variable "key_name" {
  type        = string
  description = "secure key name"
  default     = "nat"
}

variable "asg_name" {
  type        = string
  default     = "main_asg"
  description = "This is a asg name"
}
