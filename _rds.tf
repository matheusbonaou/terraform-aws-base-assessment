resource "aws_db_subnet_group" "rds-default-subnet-group" {
  name       = "rds_default_subnet_group_${var.environment}"
  subnet_ids = [aws_subnet.subnet-private-a.id, aws_subnet.subnet-private-b.id]

  tags = {
    Name = "rds_default_subnet_group_${var.environment}"
  }
}

resource "aws_db_parameter_group" "rds-parameter-group" {
  name   = "rds-${var.aws_rds_instance_db_engine}-${var.aws_rds_instance_db_engine_version}-parameter-group-${var.environment}"
  family = "${var.aws_rds_instance_db_engine}${var.aws_rds_instance_db_engine_version}"

  parameter {
    name  = "character_set_server"
    value = "utf8"
  }

  parameter {
    name  = "character_set_client"
    value = "utf8"
  }
}

resource "aws_db_security_group" "rds-sg-default" {
  name = "rds_sg_default_${var.environment}"

  ingress {
    cidr = var.aws_vpc_cidr
  }
}

resource "aws_db_instance" "rds_db_mysql" {
  db_subnet_group_name      = "${aws_db_subnet_group.rds-default-subnet-group.name}"
  parameter_group_name      = "${aws_db_parameter_group.rds-parameter-group.name}"
  allocated_storage         = var.aws_rds_instance_allocated_storage
  engine                    = var.aws_rds_instance_db_engine
  engine_version            = var.aws_rds_instance_db_engine_version
  instance_class            = var.aws_rds_instance_class
  port                      = var.aws_rds_instance_port
  db_name                   = var.aws_rds_instance_db_name
  username                  = var.aws_rds_instance_db_username
  password                  = var.aws_rds_instance_db_password
  backup_retention_period   = var.aws_rds_instance_backup_retention_period
  backup_window             = var.aws_rds_instance_backup_window
  multi_az                  = var.aws_rds_instance_multi_az
  storage_type              = var.aws_rds_instance_storage_type
  publicly_accessible       = var.aws_rds_instance_publicly_accessible
  maintenance_window        = var.aws_rds_instance_maintenance_window
  skip_final_snapshot       = false
  final_snapshot_identifier = "rds_db_mysql_${var.environment}_final"
}