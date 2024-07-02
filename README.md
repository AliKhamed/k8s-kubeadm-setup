# How To Setup Kubernetes Cluster Using Kubeadm

![](https://github.com/AliKhamed/k8s-kubeadm-setup/blob/main/screenshots/Diagram.png)


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


### 1. Clone the Repository:
Clone this repository to your local machine:

```
git clone https://github.com/AliKhamed/k8s-kubeadm-setup.git

```

### 2. Terraform Setup:
Initialize and apply the Terraform configuration to provision the necessary infrastructure:

```
cd k8s-kubeadm-setup/Terraform
terraform init
terraform apply

```

![Terraform Apply](https://github.com/AliKhamed/k8s-kubeadm-setup/blob/main/screenshots/terrformApply.png)

- K8S EC2 Running
![](https://github.com/AliKhamed/k8s-kubeadm-setup/blob/main/screenshots/ec2s.png)

- VPC 
![](https://github.com/AliKhamed/k8s-kubeadm-setup/blob/main/screenshots/vpc.png)



### 3. Nodes Setup Using Scripts
Use the provided scripts to set up your master and worker nodes:

#### First Enter on nodes Using SSH

- Master Node
![](https://github.com/AliKhamed/k8s-kubeadm-setup/blob/main/screenshots/master.png)

- Worker Node 1
![](https://github.com/AliKhamed/k8s-kubeadm-setup/blob/main/screenshots/node01.png)

- Worker Node 2
![](https://github.com/AliKhamed/k8s-kubeadm-setup/blob/main/screenshots/node02.png)

#### And git clone the repo in each node

![](https://github.com/AliKhamed/k8s-kubeadm-setup/blob/main/screenshots/git-clone.png)


#### Set up the master node:

```
cd ~/k8s-kubeadm-setup/scripts
./common.sh
./master.sh

```

![](https://github.com/AliKhamed/k8s-kubeadm-setup/blob/main/screenshots/common.png)


![](https://github.com/AliKhamed/k8s-kubeadm-setup/blob/main/screenshots/mastersh.png)

- If you need change the k8s cluster access from private to public you should change PUBLIC_IP_ACCESS=true

![](https://github.com/AliKhamed/k8s-kubeadm-setup/blob/main/screenshots/masterFileTrue.png)

![](https://github.com/AliKhamed/k8s-kubeadm-setup/blob/main/screenshots/mastersh2.png)



#### Set up the worker nodes:

```
cd ~/k8s-kubeadm-setup/scripts
./common.sh

```
- Node01
![](https://github.com/AliKhamed/k8s-kubeadm-setup/blob/main/screenshots/common2.png)

- Node02
![](https://github.com/AliKhamed/k8s-kubeadm-setup/blob/main/screenshots/common3.png)



### 4. Join Worker Nodes to Kubernetes Master Node
After setting up the nodes, join the worker nodes to the master node. On each worker node:


- On Master node run 
```
kubeadm token create --print-join-command

```
![](https://github.com/AliKhamed/k8s-kubeadm-setup/blob/main/screenshots/joinCommand1.png)


And get Output and run it on two worker nodes

- Node01
![](https://github.com/AliKhamed/k8s-kubeadm-setup/blob/main/screenshots/joinCommand2.png)


- Node01
![](https://github.com/AliKhamed/k8s-kubeadm-setup/blob/main/screenshots/joinCommand3.png)



### 5. Setup Kubernetes Metrics Server
Install the Kubernetes metrics server to monitor the cluster's resource usage:

```
cd ~/k8s-kubeadm-setup/manifests
kubectl apply -f metrics-server.yaml 

```

![](https://github.com/AliKhamed/k8s-kubeadm-setup/blob/main/screenshots/metrix.png)


### 6. Deploy a Sample Nginx Application
Deploy a sample Nginx application to verify the cluster setup:

```
cd ~/k8s-kubeadm-setup/manifests
kubectl apply -f sample-app.yaml

```

![](https://github.com/AliKhamed/k8s-kubeadm-setup/blob/main/screenshots/deployNginx.png)


- Copy Worker Node IP And check Your App:
![](https://github.com/AliKhamed/k8s-kubeadm-setup/blob/main/screenshots/workerIP.png)


![](https://github.com/AliKhamed/k8s-kubeadm-setup/blob/main/screenshots/nginxPage.png)


### 7. Add Kubeadm Config to Workstation
To manage the Kubernetes cluster from your workstation, copy the kubeadm configuration file to your local machine:

- In Master Node Run: And Copy All Contents Of file
```
sudo cat /etc/kubernetes/admin.conf 

```
![](https://github.com/AliKhamed/k8s-kubeadm-setup/blob/main/screenshots/kubeconfig1.png)


- On Local Machine: Vim ~/.kube/config file and past Content On it 

![](https://github.com/AliKhamed/k8s-kubeadm-setup/blob/main/screenshots/kubeLocal.png)

![](https://github.com/AliKhamed/k8s-kubeadm-setup/blob/main/screenshots/kubeLocal2.png)

![](https://github.com/AliKhamed/k8s-kubeadm-setup/blob/main/screenshots/kubeLocal3.png)
