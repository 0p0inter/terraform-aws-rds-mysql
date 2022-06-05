# Terraform AWS RDS MySQL Module

Sample Terraform module to provision a basic MySQL RDS instance in AWS.

## Usage
```
resource  "random_password"  "password" {
	length  		 = 16
	special  		 = true
	override_special = "!#$%&*()-_=+[]{}<>:?"
}

resource  "random_string"  "random" {
	length  	= 10
	number  	= false
	special  	= false
}

module  "aws-rds" {
	source  						  = "github.com/0p0inter/terraform-aws-rds-mysql"
	database_identifier 			  = "my-sample-app-database"
	allocated_storage 				  = 10
	engine_version 					  = "5.7"
	rds_instance_class 				  = "db.t3.micro"
	db_name 						  = "sampleappdb"
	username 						  = "${random_string.random.result}"
	password 						  = "${random_password.password.result}"
	rds_instance_parameter_group_name = "default.mysql5.7"
	vpc_security_group_ids 			  = ["sg-94b3a1f6"]
	subnet_ids 						  = ["..."]
}
```

<!-- BEGIN_TF_DOCS -->

## Requirements

  

| Name | Version |

|------|---------|

| <a  name="requirement_aws"></a> [aws](#requirement\_aws) | >= 2.7.0 |

  

## Providers

  

| Name | Version |

|------|---------|

| <a  name="provider_aws"></a> [aws](#provider\_aws) | >= 2.7.0 |

  

## Modules

  

No modules.

  

## Resources

  

| Name | Type |

|------|------|

| [aws_db_instance.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/db_instance) | resource |

| [aws_db_subnet_group.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/db_subnet_group) | resource |

  

## Inputs

  

| Name | Description | Type | Default | Required |

|------|-------------|------|---------|:--------:|

| <a  name="input_allocated_storage"></a> [allocated\_storage](#input\_allocated\_storage) | Allocated storage capacity for the RDS instance in Gbs | `number` | `10` | no |

| <a  name="input_database_identifier"></a> [database\_identifier](#input\_database\_identifier) | n/a | `string` | `"my-test-database"` | no |

| <a  name="input_db_name"></a> [db\_name](#input\_db\_name) | Name of the database to be created | `string` | `"sampleappdb"` | no |

| <a  name="input_db_subnet_group_name"></a> [db\_subnet\_group\_name](#input\_db\_subnet\_group\_name) | Subnet group name of the RDS instance | `string` | `"sample-db-subnet-group"` | no |

| <a  name="input_engine_version"></a> [engine\_version](#input\_engine\_version) | MySQL version number | `string` | `"5.7"` | no |

| <a  name="input_password"></a> [password](#input\_password) | Password for the RDS instance | `string` | n/a | yes |

| <a  name="input_rds_instance_class"></a> [rds\_instance\_class](#input\_rds\_instance\_class) | RDS instance class | `string` | `"db.t3.micro"` | no |

| <a  name="input_rds_instance_parameter_group_name"></a> [rds\_instance\_parameter\_group\_name](#input\_rds\_instance\_parameter\_group\_name) | Parameter group name of the RDS instance | `string` | `"default.mysql5.7"` | no |

| <a  name="input_subnet_ids"></a> [subnet\_ids](#input\_subnet\_ids) | Subnet Ids associated with the desired subnet group | `list` | `[]` | no |

| <a  name="input_username"></a> [username](#input\_username) | Username for the RDS instance | `string` | n/a | yes |

| <a  name="input_vpc_security_group_ids"></a> [vpc\_security\_group\_ids](#input\_vpc\_security\_group\_ids) | Security group IDs of the VPC | `list` | `[]` | no |

  

## Outputs

  

No outputs.

<!-- END_TF_DOCS -->