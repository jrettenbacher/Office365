## Demo Search Unified Log

# Get Credentials
$credential = Get-Credential gilles@smartview2.onmicrosoft.com

# Open Exchange Session
$Session = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri https://outlook.office365.com/powershell-liveid/ -Credential $credential -Authentication Basic -AllowRed
Import-PSSession $session -AllowClobber

## Search Unified Audit Log 
Search-UnifiedAuditLog -StartDate 5/3/2018 -EndDate 5/30/2018 -ResultSize 10 | Get-Member
Search-UnifiedAuditLog -StartDate 5/3/2018 -EndDate 5/30/2018 -ResultSize 1000  | Select-Object Operations, RecordType, UserIds, CreationDate   ##(Get-Date).AddDay(-30)
Search-UnifiedAuditLog -StartDate 5/3/2018 -EndDate 5/30/2018 -RecordType SharePoint  -ResultSize 10

###### https://github.com/DevScope/powerbi-powershell-modules/tree/master/Modules/PowerBIPS
Install-Module powerbips
Import-Module "C:\projects\powerbi-powershell-modules-master\Modules\PowerBIPS\PowerBIPS.psm1" –Force
 
Add-Type -Path "C:\projects\powerbi-powershell-modules-master\Modules\PowerBIPS\Microsoft.IdentityModel.Clients.ActiveDirectory.dll"

#Get OAuth authentication token you will need an clientID application created from AZURE with correct permissions
$authToken = Get-PBIAuthToken -clientId "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx" -Credential $credential

#Setting the schema Dataset
$dataSetSchema = @{
    name = "ECSMainz"    
    ; tables = @(
        @{  name = "UnifiedAuditLogResults"
            ; columns = @( 
                @{ name = "CreationDate"; dataType = "DateTime"   }
                , @{ name = "Operations"; dataType = "String"  }
                , @{ name = "RecordType"; dataType = "String"  }  
                , @{ name = "Direction"; dataType = "String"  }                
                , @{ name = "UserIds"; dataType = "String"  }
                ) 
        })
}  

#Create DataSet in PowerBI   
$createdDataSet = New-PBIDataSet -authToken $authToken -dataSet $dataSetSchema -Verbose 

#Get detailed informations concerning mail trafic
$myDatas = Search-UnifiedAuditLog -StartDate 5/3/2018 -EndDate 5/30/2018 -ResultSize 1000  | Select-Object Operations, RecordType, UserIds, CreationDate   ##(Get-Date).AddDay(-30)


#Inserting data 10 by 10
$myDatas | Add-PBITableRows  -authToken $authToken -dataSetName "ECSMainz" -tableName "UnifiedAuditLogResults" -batchSize 10 -Verbose






#####
Set-ExecutionPolicy Unrestricted

Connect-MsolService -Credential $credential

Get-Mailbox | Select-Object DisplayName, MaxSendSize, MaxReceiveSize

Get-Mailbox | Get-MailboxStatistics | Select-Object DisplayName, TotalItemSize, ItemCount, DeletedItemCount

