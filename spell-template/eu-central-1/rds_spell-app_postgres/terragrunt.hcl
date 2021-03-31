terraform {
  source = "git::git@github.com:terraform-aws-modules/terraform-aws-rds.git?ref=v2.14.0"
}

include {
  path = find_in_parent_folders()
}

dependencies {
  paths = ["../spell-vpc", "../spell-sec2"]
}

dependency "spell-vpc" {
  config_path = "../spell-vpc"
}

dependency "spell-sec2" {
  config_path = "../spell-sec2"
}

###########################################################
# View all available inputs for this module:
# https://registry.terraform.io/modules/terraform-aws-modules/rds/aws/2.14.0?tab=inputs
###########################################################
inputs = {
  # The allocated storage in gigabytes
  # type: string
  allocated_storage = "5"

  # The days to retain backups for
  # type: number
  backup_retention_period = 0

  # The daily time range (in UTC) during which automated backups are created if they are enabled. Example: '09:46-10:16'. Must not overlap with maintenance_window
  # type: string
  backup_window = ""

  # Name of DB subnet group. DB instance will be created in the VPC associated with the DB subnet group. If unspecified, will be created in the default VPC
  # type: string
  db_subnet_group_name = dependency.spell-vpc.outputs.database_subnet_group

  # The database engine to use
  # type: string
  engine = "postgres"

  # The engine version to use
  # type: string
  engine_version = "12.5"

  # The family of the DB parameter group
  # type: string
  family = "postgres12"

  # The name of the RDS instance, if omitted, Terraform will assign a random, unique identifier
  # type: string
  identifier = "spelldbms"

  # The instance type of the RDS instance
  # type: string
  instance_class = "db.t3.micro"

  # The window to perform maintenance in. Syntax: 'ddd:hh24:mi-ddd:hh24:mi'. Eg: 'Mon:00:00-Mon:03:00'
  # type: string
  maintenance_window = ""

  # Specifies the major version of the engine that this option group should be associated with
  # type: string
  major_engine_version = "12"

  # Specifies if the RDS instance is multi-AZ
  # type: bool
  multi_az = false

  # Password for the master DB user. Note that this may show up in logs, and it will be stored in the state file
  # type: string
  password = "u18HAAQAHnrv"

  # The port on which the DB accepts connections
  # type: string
  port = "5432"

  # Username for the master DB user
  # type: string
  username = "calf"

  # List of VPC security groups to associate
  # type: list(string)
  vpc_security_group_ids = [dependency.spell-sec2.outputs.this_security_group_id]

  
}
