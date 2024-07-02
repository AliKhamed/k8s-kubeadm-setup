resource "aws_instance" "ec2" {
  count = var.instance_count

  ami                    = var.ami_id
  instance_type          = var.instance_type
  key_name               = var.key_name
  associate_public_ip_address = true
  vpc_security_group_ids = [var.sg_id]

  user_data = <<-EOF
    #cloud-config
    hostname: ${count.index == 0 ? "controlplane" : "node0${count.index}"}
  EOF

tags = {
    Name = count.index == 0 ? "controlplane" : "node0${count.index}"
  }

  subnet_id = element(var.subnet_ids, count.index % length(var.subnet_ids))
}
