# This is quick access repo for project development

## Files

- providers.tf = defines the minimum eviroment & Manually define Resource Group and Locaiton
- aks.tf = K8s Main Config File
- variables.tf = Variable Config File, The following files depend on this doc [aks.tf]. Don't forget to Manually input Service Principle
- output.tf = Defines what text is shown once deployed

## Instructions

### Pre-Requirements
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

         ./setup.sh.

5. You should see a terraformk8s directory listed. The directory contains all files mentioned in above. 

