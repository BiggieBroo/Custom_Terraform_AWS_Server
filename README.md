# Introduction
It is a module based Terraform which helps to provision a server on AWS. In the following repository you can find that a configuration helps to create VPC, Subnet, Route Table, Internet Gateway, Security Group, Instance Type and EC2 instance.

# Pre-requisites
1. Should install Terraform
2. Have an account on AWS
3. Pre-define which region, access key and secret key

# Configuration
1. After pulling the repository on the machine, it requires to set up credentials for region, acess key and secret in the root folder's main.tf. The path is ~/.aws.credentials.
2. Then requires to create in a root folder a terraform.tfvars file which identifies the values for the variables.
3. As soon as the first 2 steps are done, a user can run terraform init. The following result should come up:
![Screenshot from 2024-03-25 04-21-38](https://github.com/BiggieBroo/Terraform_AWS_Server/assets/140602458/6c8113e2-7c16-4552-940a-cd7726badb52)
4. Then should run terraform plan which results to see which resources are to be configured on the behalf of AWS:
![image](https://github.com/BiggieBroo/Terraform_AWS_Server/assets/140602458/c7b401dd-cc90-4327-9a21-e9493fe8f872)
5. If everything is satisfiable then can be typed terraform apply -auto-approve:
![Screenshot from 2024-03-25 04-30-31](https://github.com/BiggieBroo/Terraform_AWS_Server/assets/140602458/cf398b55-ac38-4445-9419-8f0c9f112c2e)
6. When the resources are not needed anymore can just use terraform destroy.
