# Copyright (c) 2015 Microsoft Corporation. All rights reserved. 

# MIT License

# Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the ""Software""), to deal in the Software without restriction, including without limitation the rights # to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
# THE SOFTWARE IS PROVIDED *AS IS*, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR # COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.


#Managing a PowerShell session - SharePoint Online.

#As we are working with SharePoint Online, we must first import the related PowerShell module
Import-Module Microsoft.Online.SharePoint.PowerShell

#Capture administrative credential for future connections. Creates a SharePoint online session, and imports it for use. For SharePoint online, This command additionally does the work of Import-PSSession.
$credential = get-credential
Connect-MsolService -Credential $Credential

#This connects you to your SharePoint Online services. Substitute the ‘contoso’ portion of the URL with the name of your SharePoint Online tenant.
Connect-SPOService -url https://contoso-admin.sharepoint.com -Credential $credential

#The commands in this session are now available for you to use as required.
#In this example, we will simply use a command that retrieves information.
Get-SPOSite

#Once finished, it is important to close and remove your session.
Disconnect-SPOService

#Additional session management for PowerShell details.

#Closing a session for SharePoint online is unique to all other PowerShell Sessions. This however, can also be closed using the Get-PSSession | Remove-PSSession mass closure method.