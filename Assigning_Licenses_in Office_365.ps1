#Assigning Licenses in Office 365

#This first command will import the Azure Active Directory module into your PowerShell session.
Import-Module MSOnline

#Capture administrative credential for future connections.
$credential = get-credential

#Establishes Online Services connection to Azure Active Directory  
Connect-MsolService -Credential $credential

#Before you can assign a license to a user, you must set the Usage Location for each user – represented by the two-character ISO code for that region. The Usage Location specifies the country in which the service is to be used, and determines which licensed features are available for that region for example, US is for the United States of America.
Set-MsolUser -UserPrincipalName user@contoso.com -UsageLocation US

#To view the list of available licenses, their SKU codes, and the quantity remaining for assignment, run the following command.
Get-MsolAccountSku

#You can now use the Set-MsolUserLicense cmdlet with the -AddLicenses parameter to assign the license, using the appropriate AccountSkuId returned from the previous step. You must replace user@contoso.com with the name of the actual user and replace contso with the name of your Office 365 tenant.
Set-MsolUserLicense -UserPrincipalName user@contoso.com -AddLicenses contoso:ENTERPRISEPACK

