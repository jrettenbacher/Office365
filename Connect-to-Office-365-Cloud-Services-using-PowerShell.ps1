# Copyright (c) 2015 Microsoft Corporation. All rights reserved. 

# MIT License

# Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the ""Software""), to deal in the Software without restriction, including without limitation the rights # to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
# THE SOFTWARE IS PROVIDED *AS IS*, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR # COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.


#How to connect to Office 365 Cloud Services using PowerShell

#Capture administrative credential for future connections.
$credential = get-credential

#Imports the installed Azure Active Directory module.
Import-Module MSOnline

#Establishes Online Services connection to Office 365 Management Layer.
Connect-MsolService -Credential $credential

#Imports the installed Skype for Business Online services module.
#Import-Module LyncOnlineConnector

#Create a Skype for Business Powershell session using defined credential.
#$lyncSession = New-CsOnlineSession -Credential $credential

#Imports Skype for Business session commands into your local Windows PowerShell session.
#Import-PSSession $lyncSession

#Imports SharePoint Online session commands into your local Windows PowerShell session.
Import-Module Microsoft.Online.Sharepoint.PowerShell

#This connects you to your SharePoint Online services. Substitute the ‘contoso’ portion of the URL with the name of your SharePoint Online tenant.
Connect-SPOService -url https://adidasgroup-admin.sharepoint.com -Credential $credential

#Creates an Exchange Online session using defined credential.
$ExchangeSession = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri "https://outlook.office365.com/powershell-liveid/" -Credential $credential -Authentication "Basic" -AllowRedirection

#This imports the Office 365 session into your active Shell.
Import-PSSession $ExchangeSession