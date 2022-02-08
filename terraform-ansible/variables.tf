variable "profile" {
  default = "terraform_iam_user"
}

variable "region" {
  default = "us-east-1"
}

variable "instance" {
  default = "t2.small"
}

variable "instance_count" {
  default = "1"
}

variable "public_key" {
  default = "/home/rethin/.ssh/id_rsa.pub"
}

variable "private_key" {
  default = "/home/rethin/.ssh/id_rsa"
}

variable "ansible_user" {
  default = "ubuntu"
}

variable "subnet_ids" {
  default =  [ "subnet-1ceaae6b", "subnet-3b1b4250", "subnet-1772f03c" ]
}

variable "amis" {
  type = "map"

  default = {
    us-east-1 = "ami-013f17f36f8b1fefb"
    us-east-2 = "ami-013f17f36f8b1fefb"     
  }
}

variable "ami" {
  default = "ami-013f17f36f8b1fefb"
}
