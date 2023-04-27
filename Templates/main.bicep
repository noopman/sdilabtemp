targetScope = 'resourceGroup'

@description('Location for resources.')
param location string = resourceGroup().location

@description('Name of the static web app.')
param staticwebappname string

@description('Name of the static web app.')
param size object = {
  name: 'Free'
  tier: 'Free'
  family: 'F'
  capacity: 1
}

@description('Location of code.')
param repositoryUrl string = 'https://github.com/Region-Skane-SDI/sdi-lab'

resource sdilab 'Microsoft.Web/staticSites@2022-09-01' = {
  name: staticwebappname
  location: location
  sku: {
    name: size.name
    tier: size.tier
    family: size.family
    capacity: size.capacity
  }
  properties: {
    repositoryUrl: repositoryUrl
    branch: 'main'
    stagingEnvironmentPolicy: 'Enabled'
    allowConfigFileUpdates: true
    provider: 'GitHub'
    enterpriseGradeCdnStatus: 'Disabled'
  }
}

output swaName string = sdilab.name
