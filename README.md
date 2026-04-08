# TechCorp Infrastructure - Terraform Assessment

## Prerequisites
- Terraform v1.14.8+
- AWS CLI configured with appropriate credentials
- An AWS account with necessary permissions
- An EC2 Key Pair created in AWS Console

## Project Structure
terraform-assessment/
├── main.tf
├── variables.tf
├── outputs.tf
├── terraform.tfvars
├── terraform.tfvars.example
├── user_data/
│   ├── web_server_setup.sh
│   └── db_server_setup.sh
└── README.md

## Deployment Steps

### 1. Clone the repository
git clone https://github.com/yourusername/month-one-assessment
cd month-one-assessment

### 2. Configure your variables
cp terraform.tfvars.example terraform.tfvars

Edit terraform.tfvars with your actual values:
- region: AWS region to deploy to
- key_pair_name: Name of your EC2 key pair
- my_ip: Your public IP address in CIDR format (x.x.x.x/32)

### 3. Initialize Terraform
terraform init

### 4. Preview the infrastructure
terraform plan

### 5. Deploy the infrastructure
terraform apply

Type 'yes' when prompted to confirm.

### 6. Access the application
After deployment, Terraform will output:
- VPC ID
- Load Balancer DNS name (paste in browser to see web page)
- Bastion Host public IP (use this to SSH in)

## SSH Access

### Connect to Bastion Host
ssh -i techcorp-key.pem ec2-user@<bastion_public_ip>

### Connect to Web/DB Servers (from Bastion)
ssh ec2-user@<private_ip>
Password: TechCorp2024!

### Connect to PostgreSQL (on DB server)
psql -U postgres -d techcorpdb
Password: TechCorp2024!

## Cleanup
To destroy all created resources and avoid AWS charges:
terraform destroy

Type 'yes' when prompted.

## Important Notes
- NAT Gateways incur hourly costs (~$0.045/hr each)
- Run terraform destroy when not actively using the infrastructure
- Never commit terraform.tfvars to version control
- Keep your .pem file safe and never share it