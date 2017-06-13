terraform {
	backend "atlas" {
	name = "barundel/training"
}
}

#
# DO NOT DELETE THESE LINES!
#
# Your AMI ID is:
#
#     ami-a4f9f2c2
#
# Your subnet ID is:
#
#     subnet-7aba681d
#
# Your security group ID is:
#
#     sg-00100979
#
# Your Identity is:
#
#     hdays-michel-snail
#

variable "aws_access_key" {
	default = ""
}
variable "aws_secret_key" {
	default = ""
}
variable "aws_region" {
	default = "eu-west-1"
}
variable "count" {
	default = 2
}

provider "aws" {
  access_key = "${var.aws_access_key}"
  secret_key = "${var.aws_secret_key}"
  region     = "${var.aws_region}"
}

resource "aws_instance" "web" {
	count = "${var.count}"
	ami = "ami-a4f9f2c2"
	instance_type = "t2.micro"
	subnet_id = "subnet-7aba681d"
	vpc_security_group_ids = ["sg-00100979"]

	tags {
	count = "${var.count}"
	Identity = "hdays-michel-snail"
	NotName = "AddingaTag"
	Test = "Test"
	Name = "WebServer ${count.index+1}/${var.count}"
}
}

output "public_dns" {

	value = ["${aws_instance.web.*.public_dns}"]
}

output "public_ip" {
	value = ["${aws_instance.web.*.public_ip}"]
}
