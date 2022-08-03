# Replace the following URL with a public GitHub repo URL
$gitrepo="stry"
$gittoken="isat"
$webappname="svcname$(Get-Random)"
$location="West Europe" 
$rgName="resgroup"
$branch="sourcebrnch"
$azureorgst="org"
$azuretoken="token"
$azurerepo="repon"
$azureprjc="prjc"



set-ExecutionPolicy RemoteSigned -Scope CurrentUser
Set-ExecutionPolicy -ExecutionPolicy unrestricted -Scope CurrentUser
Install-Module -Name Az -AllowClobber -Scope CurrentUser




Connect-AzAccount

az appservice plan create --name $webappname --resource-group $rgName --sku FREE

az webapp create --name $webappname --resource-group $rgName --plan $webappname

az webapp deployment source config --name $webappname  --resource-group  $rgName  \ --repo-url  $gitrepo --branch $branch  --manual-integration





