terraform {
  source = "git::git@github.com:terraform-aws-modules/terraform-aws-ec2-instance.git?ref=v2.13.0"
}

include {
  path = find_in_parent_folders()
}

dependencies {
  paths = ["../aws-data","../spell-vpc", "../spell-sec2"]
}

dependency "aws-data" {
  config_path = "../aws-data"
}


dependency "spell-vpc" {
  config_path = "../spell-vpc"
}

dependency "spell-sec2" {
  config_path = "../spell-sec2"
}

###########################################################
# View all available inputs for this module:
# https://registry.terraform.io/modules/terraform-aws-modules/ec2-instance/aws/2.13.0?tab=inputs
###########################################################
inputs = {
  # ID of AMI to use for the instance
  # type: string
  ami = dependency.aws-data.outputs.amazon_linux2_aws_ami_id

  # The type of instance to start
  # type: string
  instance_type = "t3.micro"

  # Name to be used on all resources as prefix
  # type: string
  name = "EC2 spell-app-server"
  
  #subnet_id = "subnet-0abafa5126224eab2"
  subnet_id = dependency.spell-vpc.outputs.subnet_id
  
  
}
