# Terraform Local Env - BEGIN
variable "Environment"{
  type = string
  description = "Environment name (development || production)"
  default = "development"
}
# Terraform Local Env - END

# AWS Credential Variables - BEGIN
variable "aws_region" {
  description = "AWS Region (e.g. us-east-1 || sa-east-1)"
  type = string
  default = "us-east-1"
}

variable "aws_access_key" {
  description = "AWS Access Key"
  type = string
}

variable "aws_secret_key" {
  description = "AWS Secret Key"
  type = string
}
# AWS Credential Variables - END

# AWS Organizations - BEGIN

variable "aws_org_env_email" {
  description = "AWS Environment E-mail Address"
  type = string
  default = "aws-accounts@matheusbona.com.br"
}

# AWS Organizations - END

# AWS Network Variables - BEGIN
variable "aws_vpc_cidr" {
  description = "VPC CIDR Block"
  type = string
  default = "172.16.0.0/20"
}

variable "aws_subnet_public_a_cidr" {
  description = "AWS Public Subnet A CIDR Block"
  type = string
  default = "172.16.1.0/24"
}

variable "aws_subnet_public_b_cidr" {
  description = "AWS Public Subnet B CIDR Block"
  type = string
  default = "172.16.2.0/24"
}

variable "aws_subnet_private_a_cidr" {
  description = "AWS Private Subnet A CIDR Block"
  type = string
  default = "172.16.3.0/24"
}

variable "aws_subnet_private_b_cidr" {
  description = "AWS Private Subnet B CIDR Block"
  type = string
  default = "172.16.4.0/24"
}
# AWS Network Variables - END

# AWS RDS Variables - BEGIN
variable "aws_rds_instance_db_engine" {
  description = "Engine of the RDS Instance (mysql || mariadb || postgresql)"
  type = string
  default = "mysql"
}

variable "aws_rds_instance_db_engine_version" {
  description = "Engine Version of the RDS Instance"
  type = string
  default = "5.7"
}

variable "aws_rds_instance_class" {
  description = "Instance class of the RDS Instance"
  type = string
  default = "db.t3.micro"
}

variable "aws_rds_instance_port" {
  description = "Port of the RDS Instance"
  type = string
}

variable "aws_rds_instance_db_name" {
  description = "DB Name of the RDS Instance"
  type = string
}

variable "aws_rds_instance_db_username" {
  description = "DB Username of the RDS Instance"
  type = string
}

variable "aws_rds_instance_db_password" {
  description = "DB Password of the RDS Instance"
  type = string
}

variable "aws_rds_instance_allocated_storage" {
  description = "Allocated storage of the RDS Instance"
  type = string
  default = "20"
}

variable "aws_rds_instance_backup_retention_period" {
  description = "Backup retention period of the RDS Instance"
  type = string
  default = "7"
}

variable "aws_rds_instance_backup_window" {
  description = "Backup window of the RDS Instance"
  type = string
  default = "07:00-09:00"
}

variable "aws_rds_instance_multi_az" {
  description = "Multi-az of the RDS Instance"
  type = bool
  default = false
}

variable "aws_rds_instance_storage_type" {
  description = "Storage type of the RDS Instance"
  type = string
  default = "gp2"
}

variable "" {
  description = "RDS Instance Availability Zone"
  type = string
  default = "us-east-1a"
}

variable "aws_rds_instance_publicly_accessible" {
  description = "RDS Publicly Acessible"
  type = string
  default = "false"
}

variable "aws_rds_instance_maintenance_window" {
  description = "Maintenance Window of the RDS Instance"
  type = string
  default = "sun:05:00-sun:08:00"
}
# AWS RDS Variables - END