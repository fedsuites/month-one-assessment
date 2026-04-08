#!/bin/bash
yum update -y
yum install -y httpd

# Get the instance ID from AWS metadata
INSTANCE_ID=$(curl -s http://169.254.169.254/latest/meta-data/instance-id)

# Create a simple HTML page showing which server you landed on
cat > /var/www/html/index.html <<EOF
<!DOCTYPE html>
<html>
<head><title>TechCorp Web Server</title></head>
<body>
  <h1>Welcome to TechCorp!</h1>
  <p>Served by instance: <strong>${INSTANCE_ID}</strong></p>
</body>
</html>
EOF

systemctl start httpd
systemctl enable httpd

# Allow password-based SSH from bastion
sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/' /etc/ssh/sshd_config
systemctl restart sshd

# Set password for ec2-user
echo "ec2-user:TechCorp2024!" | chpasswd