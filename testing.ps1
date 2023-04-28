git add .
git commit -m "testing"
git push

#gh auth login
#gh auth login --with-token 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
#gh workflow list

gh workflow run IaC.yaml
#gh run list --workflow=IaC.yaml

return

$var = az deployment group create `
  --resource-group rg-sdilab2 `
  --template-file 'Templates/main.bicep' `
  --parameters 'Environments/development.parameters.json' `
  --query "properties.outputs.swaName.value"

$var.trim('"')