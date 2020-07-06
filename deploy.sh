#!/bin/bash
# 

#Make sure azcli is installed
if [ ! -e /usr/bin/az ]
then
  echo "You don't have Az CLI installed"
fi

#Check azcli version
az --version

#The Deployer!
DEP="/usr/bin/az deployment"

#Line em up
$DEP sub create --location $1 --template-file template.json --parameters parameters.json 

#Knock em down
for i in hub peering core workload 
do 
    $DEP group create --name "$i" --resource-group "rg-$i" --template-file $i/template.json --parameters $i/parameters.json 
done 






