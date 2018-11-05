# Connecting to your tenant 
Connect-PnPOnline -Url https://valuze.sharepoint.com

# Creating the Modern Site
New-PnPTenantSite `
  -Title "VALUZE Business Apps" `
  -Url "https://valuze.sharepoint.com/sites/VALUZEBizApps" `
  -Description "VALUZE Business Apps" `
  -Owner "joerg.rettenbacher@valuze.de" `
  -Lcid 1031 `
  -Template "STS#3" `
  -TimeZone 10 `
  -Wait