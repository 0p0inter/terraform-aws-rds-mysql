resource "aws_db_instance" "default" {
  identifier           = var.database_identifier
  allocated_storage    = var.allocated_storage
  engine               = "mysql"
  engine_version       = var.engine_version
  instance_class       = var.rds_instance_class
  db_name              = var.db_name
  username             = var.username
  password             = var.password
  parameter_group_name = var.rds_instance_parameter_group_name
  skip_final_snapshot  = true
  db_subnet_group_name = "${aws_db_subnet_group.default.name}"
  vpc_security_group_ids = var.vpc_security_group_ids
  depends_on = [
    aws_db_subnet_group.default
  ]
}

resource "aws_db_subnet_group" "default" {
  name       = var.db_subnet_group_name
  subnet_ids = var.subnet_ids
  tags = {
    Name = "Sample app database subnet group"
  }
}