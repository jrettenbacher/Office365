# Copyright (c) 2015 Microsoft Corporation. All rights reserved. 

# MIT License

# Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the ""Software""), to deal in the Software without restriction, including without limitation the rights # to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
# THE SOFTWARE IS PROVIDED *AS IS*, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR # COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.


#Deleting a SharePoint Site Collection and its Subsites.

#To begin, you will need to load the SharePoint Online module to be able to run commands in PowerShell. You must also replace the url "https://contoso-admin.sharepoint.com" and use your SharePoint administrative site.
#Import-Module Microsoft.Online.Sharepoint.PowerShell
#$credential = Get-credential
#Connect-SPOService -url https://contoso-admin.sharepoint.com -Credential $credential

#This command will delete the SharePoint site collection. You must replace the url "https://contoso.sharepoint.com/sites/SiteCollectionName" with your Sharepoint Online URL and use the Site Collection Name that is to be deleted for this script to work properly.
Remove-SPOSite -Identity https://adidasgroup.sharepoint.com/sites/externalsharing -NoWait