# Provision web server by Terraform and Ansible

 This repository includes the Terraform and Ansible files to provision following components,

- An EC2 instance exposed port 80 and 22
- Install nginx package by yum package manager
- Any neccessary resources on AWS
  
Version tested
Terraform v1.5.7
Ansible 2.17.5
## Usage
Clone this repository and install Terraform and Ansible to your executing machine, and finish the setup of `aws configure` before use.

Please note that you have to execute Terraform script frist, then Ansible playbook, as there will be an inventory file auto-generated from your Terraform execution.

## Terraform
1. cd to folder `web-server-by-terraform-and-ansible/terraform`
2. Create a new file named `terraform.tfvars` with following content,
```bash
ec2_keypair_public_key="<Public key of your SSH key pair>"
```

>  Replace <Public key of your SSH key pair> with the public key of your own SSH key pair.
>  It will be used provision the EC2 instance and allow Ansible to authenticate

3. (optional) Update the default value `~/.ssh/id_rsa` to your private key file path in ansible_ssh_private_key_file from `../ansible/inventory.template`
4. Initialize terraform dependencies by
```bash
terraform init
```
5. Get the list of resources being created by
```bash
terraform plan
```
6. Create the resources on AWS by
```bash
terraform apply
```
After successful execution, you should see a newly created file named inventory located in your `../ansible` directory. Please do not delete it as it will be the inventory file for the Ansible playbook.

## Ansible
- `cd` to folder `web-server-by-terraform-and-ansible/ansible`
- Install `nginx` package and start the service on newly created EC2 instance by
```bash
ansible-playbook -i inventory install_nginx.yaml
```
![Screenshot 2024-10-15 at 20 44 34](https://github.com/user-attachments/assets/6bd0398c-53fc-45d0-9504-8a54749ce8c5)

![Screenshot 2024-10-15 at 20 44 55](https://github.com/user-attachments/assets/014a7c0f-3342-4238-9c4a-f973c608ccd9)
