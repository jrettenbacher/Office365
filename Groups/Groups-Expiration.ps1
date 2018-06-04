Import-Module AzureAD

Connect-AzureAD -AccountId "joerg.rettenbacher@valuze.de"
Connect-EXOPSSession -UserPrincipalName "joerg.rettenbacher@valuze.de"

$LifeCycle = (Get-AzureADMSGroupLifeCyclePolicy).GroupLifeTimeInDays
$Report = @()
$Today = (Get-Date)
$GroupsinPolicy = 0
Write-Host “Finding Groups to check…”
$Groups = Get-UnifiedGroup | Select DisplayName, ExternalDirectoryObjectId, WhenCreated
Write-Host $Groups.Count “found. Now checking expiration status.”
ForEach ($G in $Groups) {
    $Status = $Null
    $Status = (Get-AzureADMSLifecyclePolicyGroup -Id $G.ExternalDirectoryObjectId).ManagedGroupTypes
    If ($Status -ne $Null) {
        $Days = (New-TimeSpan -Start $G.WhenCreated -End $Today).Days
        $LastRenewed = (Get-AzureADMSGroup -Id $G.ExternalDirectoryObjectId).RenewedDateTime
        $NextRenewalDue = $LastRenewed.AddDays($Lifecycle)
        $DaysLeft = (New-TimeSpan -Start $Today -End $NextRenewalDue).Days
        $GroupsInPolicy++
        $ReportLine = [PSCustomObject][Ordered]@{
           Group       = $G.DisplayName
           Created     = $G.WhenCreated
           AgeinDays   = $Days
           LastRenewed = $LastRenewed
           NextRenewal = $NextRenewalDue
           DaysLeft    = $DaysLeft
        }
        $Report += $ReportLine   }
}
Clear-Host
Write-Host "Total Groups in tenant:" $Groups.Count "Total Groups covered by expiration policy:" $GroupsInPolicy
$Report | Select Group, @{n="Last Renewed"; e= {$_.LastRenewed}}, @{n="Next Renewal Due"; e={$_.NextRenewal}}, @{n="Days before Expiration"; e={$_.DaysLeft}}