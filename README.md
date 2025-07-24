# Terraform AWS NGINX Server Setup
                          +----------------------+
                          |     AWS Region       |
                          |    ap-south-1 (Mumbai)|
                          +----------------------+
                                     |
                          +----------------------+
                          |        VPC           |
                          |  CIDR: 10.0.0.0/16    |
                          +----------------------+
                                     |
                 +----------------------------------------+
                 |                                        |
        +--------------------+                 +--------------------+
        |  Public Subnet     |                 |  Private Subnet    |
        |  CIDR: 10.0.1.0/24 |                 |  CIDR: 10.0.2.0/24 |
        +--------------------+                 +--------------------+
                 |
         +---------------------+
         |   Route Table       |
         |  0.0.0.0/0 --> IGW  |
         +---------------------+
                 |
         +---------------------+
         | Internet Gateway    |
         +---------------------+
                 |
         +---------------------+
         |    EC2 Instance     |
         | Ubuntu + NGINX      |
         | Public IP:          |
         | http://13.127.179.75/ |
         +---------------------+
                 |
         +---------------------+
         |   Security Group    |
         | Inbound: 80/tcp     |
         | Outbound: All       |
         +---------------------+

This Terraform project provisions a complete AWS infrastructure including a VPC with public and private subnets, an internet gateway, route table, and an EC2 instance with NGINX automatically installed using user data.

## 🔧 Features

- Creates a custom **VPC**
- Sets up:
  - **Public and private subnets**
  - **Internet Gateway** and attaches it to the VPC
  - **Route Table** with access to the internet (`0.0.0.0/0`) attached to the public subnet
- Launches an **EC2 instance** in the public subnet
- Configures **Security Groups**:
  - Inbound:
    - HTTP (port 80) allowed from all (`0.0.0.0/0`)
  - Outbound:
    - All traffic allowed (`protocol = "-1"`, port 0 to 0)
- Associates a **Public IP** to the EC2 instance
- Uses **User Data** to automatically install and start NGINX
- Outputs the **public URL** of the NGINX web server

## 📁 Repository Structure

```bash
Terraform-server-ngnix/
├── main.tf         # Main Terraform configuration
├── variables.tf    # Variable definitions
├── outputs.tf      # Outputs including the public URL
├── provider.tf     # AWS provider configuration
└── README.md       # Project documentation

🚀 How to Use
1. Clone the repository

git clone https://github.com/hirenVaidya/Terraform-server-ngnix.git
cd Terraform-server-ngnix

2. Initialize Terraform

terraform init
3. Validate the configuration (optional)

terraform validate

4. Apply the Terraform plan

terraform apply
    When prompted, type yes to confirm infrastructure provisioning.

5. Access NGINX Web Server

Once provisioning is complete, Terraform will output the public URL of your EC2 instance where NGINX is hosted:

Outputs:

url = "http://13.127.179.75/" on  vs code terminal  
Open the URL in your browser to see the default NGINX welcome page.
To Destroy Resources

To clean up and avoid AWS charges:

terraform destroy
rerequisites

    An AWS account

    AWS access and secret key configured (aws configure) in powershell using setx
    if not understand aws configure) how to use here is https://docs.aws.amazon.com/cli/v1/userguide/cli-configure-envvars.html

    Terraform installed (v1.0+) on vs code 
