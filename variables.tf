variable "instance_type" {
     description = "Type of EC2 instance to provision"
     default     = "t3.nano"
}

variable "ami_filter"{

  description = "Name filter and owner for AMI"

  type = object({
    name  = string
    owner = string
  })

  default = {
    name  = "bitnami-tomcat-*-x86_64-hvm-ebs-nami"
    owner = "979382823631" # Bitnami
  }

}
  


variable "environment" {
  description = "Development Environment"

  type = object ({
    name           = string
    network_prefix = string
  })

   default = {
    name = "dev"
    network_prefix = "10.0""
  }


}


  name = "dev"
  cidr = "10.0.0.0/16"

  azs             = ["us-east-1a", "us-east-1b", "us-east-1c"]
  
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]

  tags = {
    Terraform = "true"
    Environment = "dev"
  }
}


variable "asg_min_size"{
  description = "Minimum number of instances in the ASG"
  default     = 1
}

variable "asg_max_size"{
  description = "Maximum number of instances in the ASG"
  default     = 2
}

  # insert the 1 required variable here

  vpc_zone_identifier = module.blog_vpc.public_subnets
  target_group_arns   = module.blog_alb.target_group_arns
  

  image_id      = data_aws_ami.app_ami.id
  instance_type = var.instance_type

}

