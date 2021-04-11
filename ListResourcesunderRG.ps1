#Description - Get the list of resourced under a selected resource group or all resource group without login prompt
#Author - Rakesh Sharma

##Step 1
##Create a profile by following steps
<#
1. Login to your Azure account with the command: Login-AzureRmAccount 
2. Save the context in a JSON file using the command: Save-AzureRmContext -Path "C:\PowerShell_Automation\rsprofile.jason" 
3. Log in without prompt using the command: Import-AzureRmContext -Path "C:\PowerShell_Automation\rsprofile.jason"
#>

$profilePath="C:\PowerShell_Automation\rsprofile.jason"
$profile = Import-AzContext -Path $profilePath
$SubscriptionID = $profile.Context.Subscription.SubscriptionId
Set-AzContext -SubscriptionId $SubscriptionID

function Show-Menu
{
     param (
           [string]$Title = 'Select Resource Type'
     )
     cls
     Write-Host "================ $Title ================"
    
     Write-Host "1: Press '1' for Virtual Machine."
     Write-Host "2: Press '2' Databases."
     Write-Host "Q: Press 'Q' to quit."
}

do
{
     Show-Menu
     $input = Read-Host "Please make a selection"
     switch ($input)
     {
           '1'
           
            {
                cls
                'Getting list of Virtual Machines under all Resource Group #1'

                $RGS=Get-AzResourceGroup | select ResourceGroupName 
                foreach ($RG in $RGS)  
                {
                Get-AzResource -ResourceGroupName $RG.ResourceGroupName -ResourceType Microsoft.Compute/virtualMachines  | select ResourceGroupName,location,Resourcename,ParentResource,Resourcetype 
                }

                
           } 
           
           
           '2' 
           {
                cls
                'Getting list of Databases under all Resource Group #2'

                $RGS=Get-AzResourceGroup | select ResourceGroupName 
                foreach ($RG in $RGS)  
                {
                Get-AzResource -ResourceGroupName $RG.ResourceGroupName -ResourceType Microsoft.Sql/servers/databases  | select ResourceGroupName,location,Resourcename,ParentResource,Resourcetype 
                }

           } 
           
           
           
           'q' {
                return
           }
     }
     pause
}
until ($input -eq 'q')

