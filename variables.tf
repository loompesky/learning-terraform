variable "instance_type" {
  description = "Type of EC2 instance to provision"
  default     = "t3.nano"
}

variable "ami_filter" {
  description = "Name filter and owner for AMI"

  type = object({
    name  = string
    owner = string
  })

  default = {
    name  = "bitnami-tomcat-*-x84_64-hvm-ebs-nami"
    owner = "979382823631" # Bitnami
  }
}

  variable "environment" {
    description = "Developement Environment"

    type = object({
      name = string
      network_prefix = string
    })

  }
  default = {
    name           = "dev"
    network_prefix = "10.0" 
  }


  azs             = ["us-west-2a","us-west-2b","us-west-2c"]
  public_subnets  = ["${var.environment.network_prefix}.101.0/24", "${var.environment.network_prefix}.102.0/24", "${var.environment.network_prefix}.103.0/24"]


  tags = {
    Terraform = "true"
    Environment = var.environment.name
  }
}


variable "asg_min_size" {
  description = "Minimum number of instances in the ASG"
  default = 1
}

variable "asg_max_size" {
  description = "Maximum number of instances in the ASG"
  default = 2
}
