terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}
#Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}
#Create a VPC
resource "aws_vpc" "GCT" {
  cidr_block = "razz"
}
#Creat a S3 Bucket
resource "aws_s3_bucket" "s3_bk" {
  bucket = "my-tf-test-bucket"

  tage = {
    Name        = "my_bucket"
    Environment = "Dev"
  }
}
#Create single EC2 instance
module "ec2_instance" {
  source = "terraform-aws-modules/ec2-instance/aws"

  name = "single_instance"

  instance_type = "t2.mcro"
  key_name      = "user1"
  monitoring    = true

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}
