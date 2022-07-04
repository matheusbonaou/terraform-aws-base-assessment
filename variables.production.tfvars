# Terraform variables
environment = "production"

# AWS Credential variables
aws_region = "sa-east-1"
aws_access_key = "AWS-ACCESS-KEY"
aws_secret_key = "AWS-SECRET-KEY"

# AWS organizations variables
aws_org_env_email = "aws-production@matheusbona.com.br"

# AWS Network variables
aws_vpc_cidr = "10.97.0.0/20"

## public subnets variables
aws_subnet_public_a_cidr = "10.97.1.0/24"
aws_subnet_public_b_cidr = "10.97.2.0/24"

## private subnets variables
aws_subnet_private_a_cidr = "10.97.3.0/24"
aws_subnet_private_b_cidr = "10.97.4.0/24"

# AWS RDS variables
aws_rds_instance_db_engine = "mysql"
aws_rds_instance_db_engine_version = "5.7"
aws_rds_instance_class = "db.m5.large"
aws_rds_instance_port = 3306
aws_rds_instance_db_name = "app"
aws_rds_instance_db_username = "appuser"
aws_rds_instance_db_password = "aws-rds-instance"
aws_rds_instance_allocated_storage = "50"
aws_rds_instance_backup_retention_period = "7"
aws_rds_instance_backup_window = "07:00-09:00"
aws_rds_instance_multi_az = false
aws_rds_instance_storage_type = "gp2"
aws_rds_instance_publicly_accessible = false
aws_rds_instance_maintenance_window = "sun:05:00-sun:08:00"