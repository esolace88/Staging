
# For quick access to a project

## Enviroment Details

- VM Size: Standard_D2a_v3
- OS Disk Size: 30gb
- Load balance: Standard
- Network Plugin: kubenet 

## Files

- providers.tf = defines the minimum eviroment & Manually define Resource Group and Locaiton.
- aks.tf = K8s Main Config File. 
- variables.tf = Variable Config File, The following files depend on this doc [aks.tf]. **Don't forget to Manually input Service Principle.**
- output.tf = Defines what text is shown once deployed

## Instructions

### Prerequisites
1. Create Service Principle, **copy the output**
   
          az ad sp create-for-rbac --name <EnterName>
   
2. Create SSH Keys.

          ssh-keygen -m PEM -t rsa -b 4096
   
### Enviroment Setup
1. Run the following cmd to pull the setup file:

         wget https://raw.githubusercontent.com/esolace88/Staging/main/setup.sh

2. Make the file executable, Run:

         chmod +x setup.sh

4. Run the script,

         ./setup.sh

5. You should see a terraformk8s directory listed. The directory contains all files mentioned in above.
6.  Run the following CMD to initiate terraform:

         terraform init
    
7. Change into the "terraformk8s" directory and modify the following files, use the following cmd to replace required fields:

         az group list
  
- **providers.tf**: Remove "#" on both name and location, and enter the respected values of your resource group. 
- **aks.tf**: No action is needed, unless modification is needed to the enviroment.
- **variables.tf**: Replace placeholders for resource group location, service principle ID and Secret

8. Run the following cmd to import the subscription ID to terraform, to get ID use **az group list**:

         terraform import azurerm_resource_group.k8s <paste Subscription ID, no commas>

### Deployment 

1. Run the following to check the configuration files for formatting compliance.

         terraform fmt
   
2. Run the following to validate the code within the config files.

         terraform validate
   
3. Run the following to create an execution plan.

           terraform plan -out aks.tfplan
   
4. Run the following to deploy the plan.

            terraform apply aks.tfplan

5. Once the deployment completes it will display the output.tf information.
6. Run the following cmd to move your kube_config to a different file:

         echo "$(terraform output kube_config)" > ./azurek8s
   
7. Modify the Newly created file, **remove <<EOT and EOT**
8. Run the following cmd to create your k8s enviroment:

         export KUBECONFIG=./azurek8s
   
9. Test & Verify nodes

         kubectl get nodes


