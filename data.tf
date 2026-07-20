data "aws_vpc" "selected" {
  filter {
    name   = "tag:Name"
    values = ["ce13-vpc"]
  }
}

data "aws_subnet" "selected_public" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.selected.id]
  }
  filter {
    name   = "tag:Name"
    values = ["ce13-subnet-public1-us-east-1a"]
  }
}

data "aws_ami" "ami" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
  filter {
    name   = "name"
    values = ["al2023-ami-2023*"]
  }
}
