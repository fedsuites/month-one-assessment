#!/bin/bash
yum update -y

# Enable and install PostgreSQL 14
amazon-linux-extras enable postgresql14
yum install -y postgresql-server postgresql-contrib

# Initialize and start PostgreSQL
postgresql-setup initdb
systemctl start postgresql
systemctl enable postgresql

# Allow password authentication
sed -i 's/ident/md5/g' /var/lib/pgsql/data/pg_hba.conf
sed -i 's/peer/md5/g' /var/lib/pgsql/data/pg_hba.conf

systemctl restart postgresql

# Create database and set password
sudo -u postgres psql -c "ALTER USER postgres WITH PASSWORD 'TechCorp2024!';"
sudo -u postgres createdb techcorpdb

# Allow password-based SSH from bastion
sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/' /etc/ssh/sshd_config
systemctl restart sshd

# Set password for ec2-user
echo "ec2-user:TechCorp2024!" | chpasswd