# Infrastructure Deployment: Static Netflix Clone on AWS EC2 via Terraform

This project demonstrates how to provision cloud infrastructure using Terraform to host a static Netflix Clone website on an AWS EC2 instance running Ubuntu and Nginx.

## Tools Used

- **Terraform** — Infrastructure as Code (IaC) tool to automate AWS resource provisioning
- **AWS EC2 (Ubuntu)** — Virtual machine used to host the website
- **AWS VPC, Subnet, Route Table, and Internet Gateway** — Networking components to ensure public accessibility
- **Security Groups** — Used to control access to ports for SSH (22) and HTTP (80)
- **Nginx** — Web server installed on EC2 to serve the static files
- **SCP / SSH** — Tools to securely connect to and transfer files to the EC2 instance

## Project Workflow

### 1. Infrastructure Provisioning (Terraform)

- A custom VPC is created to isolate resources
- A public subnet is defined with automatic public IP mapping
- An internet gateway is attached for outbound internet access
- A route table is created and linked to the subnet
- A security group is configured to allow SSH access from a specific IP and HTTP from all sources
- An EC2 instance is provisioned using an Ubuntu AMI and linked to the public subnet and security group

### 2. Instance Access and Setup

Once Terraform returns the EC2 public IP:
 
---
## Step-by-Step Deployment Instructions

### 1. Connect to EC2 via SSH

Bash
- ssh -i aws-login.pem ubuntu@<EC2_PUBLIC_IP>
- chmod 400 aws-login.pem
- scp -i aws-login.pem -r "Netflix Clone" ubuntu@<EC2_PUBLIC_IP>:/tmp/
- sudo apt update
- sudo apt install nginx -y
- sudo mv "/tmp/Netflix Clone"/* /var/www/html/
- sudo systemctl start nginx
- sudo systemctl restart nginx

## Test Site in Browser
- http://<EC2_PUBLIC_IP>

---
## Notes
- Security group should allow inbound traffic on ports 22 (SSH) and 80 (HTTP)
- Folder names with spaces must be wrapped in quotes when using terminal commands
  
## Terraform File Descriptions
Although not included in this guide, Terraform was used to automate parts of the infrastructure setup. Here's what each file typically handles:
- main.tf: Defines AWS resources such as EC2 instances, VPCs, subnets, security groups, and internet gateways
- variables.tf: Stores reusable values like instance type, region, and CIDR blocks
- terraform.tfvars: Assigns values to declared variables for a specific environment
- outputs.tf: Displays key outputs from the provisioning process, such as EC2 public IP or SSH commands
- provider.tf: Specifies the AWS provider configuration, including access credentials and region settings

![Output](https://github.com/user-attachments/assets/3bcc5f1a-1bd2-4da5-bdee-54fdaf86a242)
