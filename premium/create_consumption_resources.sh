#!/bin/bash

# Function app and storage account names must be unique.
resourceGroup=$1
storageName=$2
functionAppName=$3
# region=eastus
region=$4

# Create a resource resourceGroupName
az group create \
  --name $resourceGroup \
  --location $region

# Create an azure storage account
az storage account create \
  --name $storageName \
  --location $region \
  --resource-group $resourceGroup \
  --sku Standard_LRS

# Create a Function App
az functionapp create \
--resource-group $resourceGroup \
--storage-account $storageName \
--name $functionAppName \
--consumption-plan-location $region \
--runtime custom \
--os-type Linux \
--functions-version 3 \
--disable-app-insights false

# az functionapp delete \
# --name $functionAppName \
# --resource-group $resourceGroup