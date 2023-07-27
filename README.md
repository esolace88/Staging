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
   
3. Create SSH Keys.

          ssh-keygen -m PEM -t rsa -b 4096
   

