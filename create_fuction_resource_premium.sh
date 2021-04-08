#!/bin/bash

# Function app and storage account names must be unique.
resourceGroup=$1
storageName=$2
functionAppName=$3
# region=eastus
premiumPlanName=$4
region=$5

# #Create a resource resourceGroupName
# az group create \
#   --name $resourceGroup \
#   --location $region

# #Create an azure storage account
# az storage account create \
#   --name $storageName \
#   --location $region \
#   --resource-group $resourceGroup \
#   --sku Standard_LRS

#Create an azure plan
az functionapp plan create \
  --resource-group $resourceGroup \
  --name $premiumPlanName \
  --location $region \
  --is-linux true \
  --min-instances 1 \
  --max-burst 2 \
  --sku EP1

# Create a Function App
az functionapp create \
--resource-group $resourceGroup \
--storage-account $storageName \
--name $functionAppName \
--plan $premiumPlanName \
--runtime custom \
--functions-version 3 \
--disable-app-insights false

# func azure functionapp publish $functionAppName