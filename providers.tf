terraform {
  #############################################################
  ## AFTER RUNNING TERRAFORM APPLY (WITH LOCAL BACKEND)
  ## YOU WILL UNCOMMENT THIS CODE THEN RERUN TERRAFORM INIT
  ## TO SWITCH FROM LOCAL BACKEND TO REMOTE AWS BACKEND
  #############################################################
#   backend "s3" {
#     bucket = "xxxxxxx" # REPLACE WITH YOUR BUCKET NAME
#     key = "xxxxx" # REPLACE ONLY THE FIRST TIME
#     region  = "us-east-1" # REPLACE ONLY THE FIRST TIME
#     use_lockfile = true
#     encrypt = true
#     profile = "xxxxx" # REPLACE WITH YOUR AWS PROFILE
#   }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.42"
    }
  }
}


provider "aws" {
  region  = "us-east-1" # REPLACE ONLY THE FIRST TIME
  profile = "xxxxx" # REPLACE ONLY THE FIRST TIME
}