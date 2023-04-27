targetScope = 'subscription'

@description('The resource group.')
param resourceGroupName string = 'rg-sdilab'

@description('Location for resources.')
param location string = 'West Europe'

resource sdilabrg 'Microsoft.Resources/resourceGroups@2022-09-01' = {
  name: resourceGroupName
  location: location
}
