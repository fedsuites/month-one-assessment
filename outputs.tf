output "vpc_id" {
  description = "The ID of the VPC"
  value       = aws_vpc.main.id
}

output "load_balancer_dns" {
  description = "DNS name of the Application Load Balancer"
  value       = aws_lb.main.dns_name
}

output "bastion_public_ip" {
  description = "Public IP address of the Bastion host"
  value       = aws_eip.bastion.public_ip
}