variable "ami" {
  description = "AMI ID"
}

variable "instance_type" {
  description = "Instance type"
}

variable "key_name" {
  description = "Instance key name"
}

variable "user_data" {
  description = "User data script file"
  default = ""
}

variable "subnet_id" {
  description = "Subnet ID"
}

variable "security_groups" {
  description = "Security groups list"
}

variable "tags" {
  description = "Resource tags"
}
