resource "aws_key_pair" "demo_key" {
  key_name   = "MyKeyPair"
  public_key = "${file(var.public_key)}"
}

resource "aws_instance" "ansible_test" {
  count = "${var.instance_count}"
  ami           = "${var.ami}"
  subnet_id     = "${element(var.subnet_ids, count.index)}"
  instance_type = "${var.instance}"
  key_name      = "${aws_key_pair.demo_key.key_name}"

  vpc_security_group_ids = [
    "sg-4bf0af3f"   
  ]


  ebs_block_device {
    device_name           = "/dev/sdg"
    volume_size           = 600
    volume_type           = "gp2"
    #iops                  = 2000
    encrypted             = false
    delete_on_termination = true
  }

  connection {
    private_key = "${file(var.private_key)}"
    host = "${self.private_ip}"
    user        = "${var.ansible_user}"
  }

  #user_data = "${file("../templates/install_jenkins.sh")}"

  # Ansible requires Python to be installed on the remote machine as well as the local machine.
  provisioner "remote-exec" {
    inline = ["sudo apt-get -qq update -y"]
  }

tags = {
    Name = "ansible_test"
     Batch = "7AM"
     Location = "Singapore"
  }
}
