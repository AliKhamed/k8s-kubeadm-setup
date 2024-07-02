# How To Setup Kubernetes Cluster Using Kubeadm

This guide provides step-by-step instructions to set up a Kubernetes cluster using Kubeadm. The setup includes one master node and two worker nodes. Additionally, we'll install a Kubernetes metrics server and deploy a sample Nginx application.

## Prerequisites
- A working workstation with kubectl installed.
- Terraform installed on your local machine.
- SSH access to your nodes.

## Steps
1. **Clone the Repository**
2. **Terraform Setup**
3. **Nodes Setup Using Scripts**
4. **Join Worker Nodes to Kubernetes Master Node**
5. **Setup Kubernetes Metrics Server**
6. **Deploy a Sample Nginx Application**
7. **Add Kubeadm Config to Workstation**


### Clone the Repository:
Clone this repository to your local machine:

```
git clone https://github.com/AliKhamed/k8s-kubeadm-setup.git

```

### Terraform Setup:
Initialize and apply the Terraform configuration to provision the necessary infrastructure:

```
cd k8s-kubeadm-setup/Terraform
terraform init
terraform apply

```
![Terraform Apply](https://github.com/AliKhamed/k8s-kubeadm-setup/blob/main/screenshots/terrformApply.png)