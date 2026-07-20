resource "aws_instance" "public" {
  ami                         = data.aws_ami.ami.id # Convert to data
  instance_type               = var.instance_type # Convert to variable
  subnet_id                   = data.aws_subnet.selected_public.id  #Public Subnet ID, e.g. subnet-xxxxxxxxxxx - use data block
  associate_public_ip_address = true
  key_name                    = "${var.key_name}" #Change to your keyname, e.g. jazeel-key-pair - use variable
  vpc_security_group_ids = [aws_security_group.allow_ssh.id]
 
  tags = {
    Name = "${var.name}-ec2"    #Prefix your own name, e.g. jazeel-ec2
  }
}

resource "aws_security_group" "allow_ssh" {
  name        = "${var.name}-tf-security-group" #Security group name, e.g. jazeel-terraform-security-group - use variable
  description = "Allow SSH inbound"
  vpc_id      = data.aws_vpc.selected.id  #VPC ID (Same VPC as your EC2 subnet above), E.g. vpc-xxxxxxx - use data block
}

resource "aws_vpc_security_group_ingress_rule" "allow_tls_ipv4" {
  security_group_id = aws_security_group.allow_ssh.id
  cidr_ipv4         = "0.0.0.0/0"  
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}