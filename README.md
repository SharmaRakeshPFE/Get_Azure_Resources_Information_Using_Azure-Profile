# Get_Azure_Resources_Information_Using_Azure-Profile without login prompt
#Description - Get the list of resourced under a selected resource group or all resource group without login prompt
#Author - Rakesh Sharma

##Step 1
##Create a profile by following steps
<#
1. Login to your Azure account with the command: Login-AzureRmAccount 
2. Save the context in a JSON file using the command: Save-AzureRmContext -Path "C:\PowerShell_Automation\rsprofile.jason" 
3. Log in without prompt using the command: Import-AzureRmContext -Path "C:\PowerShell_Automation\rsprofile.jason"
#>
