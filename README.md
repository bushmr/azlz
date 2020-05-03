# Azure-Building-Blocks
Azure templates, scripts, snippets for building out Azure services
### These templates will build the architecture depicted below
![](/images/CSF%20Azure%20Reference%20Architecture%202.png)
### Please note:
You will need to create RGs for deployment and use the group deploy function either in azcli or in powershell
(az group deployment | New-AzResourceGroupDeployment).  All parameter files will need to be edited prior to your deployment

## The order of operations is important here. Please follow
1. Create resource groups manually or use the template and parameter file in the root to create (subscription deployment)
1. Once resource groups are created proceed as follows to build the vNets:
    1.   Deploy hubvnet template first
    1.   Then deploy spokes (core or workload doesn't matter which)
    1.   Then deploy the peering. Hub first then spokes
1. Now you can deploy the bastion template in the hub RG
1. Now deploy the jumpbox in the hub RG
   
