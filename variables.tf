variable "database_identifier" {
  type = string
  default = "my-test-database"
}

variable "allocated_storage" {
    type = number
    description = "Allocated storage capacity for the RDS instance in Gbs"
    default = 10  
}

variable "engine_version" {
  type = string
  description = "MySQL version number"
  default = "5.7"
}

variable "rds_instance_class" {
  type = string
  description = "RDS instance class"
  default = "db.t3.micro"
}

variable "rds_instance_parameter_group_name" {
  type = string
  description = "Parameter group name of the RDS instance"
  default = "default.mysql5.7"
}

variable "db_name" {
  type = string
  description = "Name of the database to be created"
  default = "sampleappdb"
}

variable "username" {
  type = string
  description = "Username for the RDS instance"
  sensitive = true
}

variable "password" {
  type = string
  description = "Password for the RDS instance"
  sensitive = true
}

variable "vpc_security_group_ids" {
    type = list
    description = "Security group IDs of the VPC"
    default = []
}

variable "db_subnet_group_name" {
    type = string
    description = "Subnet group name of the RDS instance"
    default = "sample-db-subnet-group"
}

variable "subnet_ids" {
    type = list
    description = "Subnet Ids associated with the desired subnet group"
    default = []
}