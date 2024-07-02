provider "aws" {
  region = "us-east-1"
}
module "network" {
  source             = "./modules/network"
  vpc_cidr           = var.vpc_cidr
  public_subnet1_cidr = var.public_subnet1_cidr
  public_subnet1_az   = var.public_subnet1_az
  public_subnet2_cidr = var.public_subnet2_cidr
  public_subnet2_az   = var.public_subnet2_az
  public_subnet3_cidr = var.public_subnet3_cidr
  public_subnet3_az   = var.public_subnet3_az
  vpc_name            = var.vpc_name
}
module "ec2_instance" {
  source = "./modules/ec2"

  instance_name  = var.instance_name
  ami_id         = var.ami
  instance_type  = var.instance_type
  key_name       = var.key_name
  subnet_ids     = [module.network.subnet1_id, module.network.subnet2_id,module.network.subnet3_id]
  instance_count = 3
  sg_id          = module.sg.sg_id

}
module "sg" {
  source = "./modules/sg"
  vpc_id = module.network.vpc_id
  inbound_from_port  = ["0", "6443", "22", "30000"]
  inbound_to_port    = ["65000", "6443", "22", "32768"]
  inbound_protocol   = ["TCP", "TCP", "TCP", "TCP"]
  inbound_cidr       = ["10.0.0.0/16","0.0.0.0/0", "0.0.0.0/0", "0.0.0.0/0"]
  outbound_from_port = ["0"]
  outbound_to_port   = ["0"]
  outbound_protocol  = ["-1"]
  outbound_cidr      = ["0.0.0.0/0"]
}

# Download and save private key 
resource "local_file" "private_key" {
  content    = tls_private_key.myprivatekey.private_key_pem
  filename   = "../private_key.pem"
  depends_on = [module.ec2_instance]
}

resource "null_resource" "set_permissions" {
  provisioner "local-exec" {
    command = "chmod 400 ../private_key.pem"
  }

  depends_on = [local_file.private_key]
}