Set-Location 'C:\code\RegionSkane\Bicep-workshop\magnus\SDILab.Temp'

$rgname = 'rg-sdilab'
$location = 'West Europe'

New-AzResourceGroup -Name $rgname -Location $location -Verbose -Force

$params = @{
    Name              = 'sdilabDev'
    ResourceGroupName = $rgname
    location          = $location
    TemplateFile      = '.\main.bicep'
    TemplateParameterFile = '.\development.parameters.json'
    repositoryUrl     = 'https://github.com/noopman/sdilabtemp'
    Force             = $true
    Verbose           = $true
}
New-AzResourceGroupDeployment @params

$params = @{
    Name                  = 'sdilabDemo'
    ResourceGroupName     = $rgname
    location              = $location
    TemplateFile          = '.\main.bicep'
    TemplateParameterFile = '.\demo.parameters.json'
    repositoryUrl         = 'https://github.com/noopman/sdilabtemp'
    Force                 = $true
    Verbose               = $true
}
New-AzResourceGroupDeployment @params

exit

Remove-AzResourceGroup -Name $rgname -Verbose -Force