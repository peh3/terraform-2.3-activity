output "public_ip" {
  description = "public ip address"
  value       = aws_instance.public.public_ip
}

output "private_ip" {
  description = "private ip address"
  value       = aws_instance.public.private_ip
}

output "instance_id" {
  description = "ec2 instance id"
  value       = aws_instance.public.id
}