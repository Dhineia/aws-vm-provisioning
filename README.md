# Netflix Clone Static Site Deployment

This guide documents the process of deploying a static Netflix Clone website on an Ubuntu EC2 instance using Nginx. The setup was managed using manual provisioning and basic Linux administration commands.

---

## Tools Used

- **AWS EC2 (Ubuntu)** — Cloud instance hosting the static website
- **Nginx** — Lightweight web server used to serve the static files
- **SSH (Secure Shell)** — For remote access to the EC2 instance
- **SCP (Secure Copy)** — To upload local project files to the remote server
- **Ubuntu CLI** — To install packages, move files, and configure services
- **Web Browser** — To verify site accessibility
- **AWS Console** — To inspect networking, IP address, and security group settings

- `index.html`: Main HTML file loaded by Nginx
- `style.css`: Styling sheet referenced by the HTML
- `images/`: Asset folder containing site visuals
  
---

## Step-by-Step Deployment Instructions

## 1. Connect to EC2 via SSH
Bash
- ssh -i aws-login.pem ubuntu@<EC2_PUBLIC_IP>
- chmod 400 aws-login.pem
- scp -i aws-login.pem -r "Netflix Clone" ubuntu@<EC2_PUBLIC_IP>:/tmp/
- sudo apt update
- sudo apt install nginx -y
- sudo mv "/tmp/Netflix Clone"/* /var/www/html/
- sudo systemctl start nginx
- sudo systemctl restart nginx

---
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

---
![ec2](https://github.com/user-attachments/assets/91acb507-9f10-46a4-9232-fa8f2aacd2af)

![terra](https://github.com/user-attachments/assets/5ce8f813-ba5f-4839-b1be-fbb0560d0f1f)



