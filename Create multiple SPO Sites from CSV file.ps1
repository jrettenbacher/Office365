# Copyright (c) 2015 Microsoft Corporation. All rights reserved. 

# MIT License

# Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the ""Software""), to deal in the Software without restriction, including without limitation the rights # to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
# THE SOFTWARE IS PROVIDED *AS IS*, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR # COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.


#Create multiple SPO Sites from CSV file.

#To begin, you will need to load the SharePoint Online module to be able to run commands in PowerShell. You must also replace the url "https://contoso-admin.sharepoint.com" and use your SharePoint administrative site. 
Import-Module Microsoft.Online.Sharepoint.PowerShell 
$credential = Get-credential 
Connect-SPOService -url https://contoso-admin.sharepoint.com -Credential $credential 

#Create multiple SPO Sites from CSV file.  
#Create CSV file with following content (first line is header row) 
#  Name,URL,Owner,StorageQuota,ResourceQuota,Template 
#  Contoso Team Site,https://contoso.sharepoint.com/sites/TeamSite,user1@contoso.com,1024,300,STS#0 
#  Contoso Blog,https://contoso.sharepoint.com/sites/Blog,user2@contoso.com,512,100,BLOG#0 
# 
#The following command will import the content of the CSV, and create a site collection per row. 
Import-Csv .\NewSPOSites.csv| % {New-SPOSite -Owner $_.Owner -StorageQuota $_.StorageQuota -Url $_.Url -NoWait -ResourceQuota $_.ResourceQuota -Template $_.Template -Title $_.Name} 
