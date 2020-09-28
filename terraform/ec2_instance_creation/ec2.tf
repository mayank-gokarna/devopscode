# Setup our aws provider
provider "aws" {
  shared_credentials_file = "~/.aws/creds"
  region      = "${var.vpc_region}"
}

# SSH key pair for accessing ec2 machine
resource "aws_key_pair" "sshKeyPair" {
  key_name   = "${var.aws_key_name}"
  public_key = "${var.public_ssh_key}"
}

# instances
resource "aws_instance" "ec2Instances" {
  count = 1
  ami = "${var.inst_ami}"
  availability_zone = "${lookup(var.availability_zone, var.vpc_region)}"
  instance_type = "${var.inst_type}"
  key_name = "${aws_key_pair.sshKeyPair.key_name}"
  subnet_id = "${var.vpc_public_sn_id}"
  associate_public_ip_address = true
  source_dest_check = false

  security_groups = [
    "${var.vpc_public_sg_id}"]

  tags = {
    Name = "ec2Instances${count.index}"
  }
}

output "ec2_ins_0_ip" {
  value = "${aws_instance.ec2Instances.0.public_ip}"
}
