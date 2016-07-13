# Copyright (c) 2015 Microsoft Corporation. All rights reserved. 

# MIT License

# Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the ""Software""), to deal in the Software without restriction, including without limitation the rights # to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
# THE SOFTWARE IS PROVIDED *AS IS*, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR # COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.


#Create a single new site collection, with a defined site owner, and site properties. Command will not wait for site creation to complete. 

#To begin, you will need to load the SharePoint Online module to be able to run commands in PowerShell. You must also replace the url "https://contoso-admin.sharepoint.com" and use your SharePoint administrative site. 
Import-Module Microsoft.Online.Sharepoint.PowerShell 
$credential = Get-credential 
Connect-SPOService -url https://adidasgroup-admin.sharepoint.com -Credential $credential 

#Create a single new site collection, with a defined site owner, and site properties. Command will not wait for site creation to complete. 
New-SPOSite -Url https://adidasgroup.sharepoint.com/sites/MigTest10GBtws -Owner o365_rettejoe1@emea.adsint.biz -StorageQuota 15 -Title "MigTest10GBtws" -CompatibilityLevel 15 -LocaleID 1033 -ResourceQuota 300 -Template "STS#0" -NoWait 