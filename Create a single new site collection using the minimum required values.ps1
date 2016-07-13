# Copyright (c) 2015 Microsoft Corporation. All rights reserved. 

# MIT License

# Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the ""Software""), to deal in the Software without restriction, including without limitation the rights # to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
# THE SOFTWARE IS PROVIDED *AS IS*, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR # COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.


#Create a single new site collection using the minimum required values.

#To begin, you will need to load the SharePoint Online module to be able to run commands in PowerShell. You must also replace the url "https://contoso-admin.sharepoint.com" and use your SharePoint administrative site. 
Import-Module Microsoft.Online.Sharepoint.PowerShell 
$credential = Get-credential 
Connect-SPOService -url https://testadidasgroup-admin.sharepoint.com -Credential $credential 

#Create a single new site collection using the minimum required values; URL, owner, and storage quota. 
New-SPOSite -Url https://testadidasgroup.sharepoint.com/sites/workspaces -Owner o365_rettejoe2@test.adsint.biz -StorageQuota 1024