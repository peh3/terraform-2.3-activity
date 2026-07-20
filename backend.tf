terraform {
  backend "s3" {
    bucket = "sctp-tfstate-ce13"
    key    = "tk/act2.3.tfstate "
    #use_lockfile = true
    region = "us-east-1"
  }
}