variable "name" {
   type = string
   description = "name of app"
   #default     = "tk-tf"
}

variable "instance_type" {
   type = string
   description = "type of EC2 instance"
   #default     = "t2.micro"
}

variable "key_name" {
  type        = string
  description = "Target SSH key pair"
  #default     = "tk-ec2-server"
}