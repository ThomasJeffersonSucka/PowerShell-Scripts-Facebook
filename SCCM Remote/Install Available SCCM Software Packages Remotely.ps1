# Server Variable
$servers = @('1','2','3')

# Creates sessions to all servers
$sessions = $servers | foreach{New-PSSession $_}

# For each session, grabs all available software packages (not KB articles) from SCCM that have not been installed
# And installs them and tells the server to NOT restart
# Good for environments where you do not control the SCCM server, but have admin rights on the clients
$sessions | foreach{
$computername = $_ | select -ExpandProperty computername
Invoke-Command -Session $_ -Argu $ComputerName -ScriptBlock `
{
param ($computerName)
write-host "Getting Parameters for available SCCM applications on $computerName"
# Gets apps that are advertised but not installed
$Apps = Get-WmiObject -computername $ComputerName -Namespace "root\ccm\ClientSDK" -Class CCM_Application `
 | where {$_.installstatus -ne "Installed"} | Select-Object Id, Revision, IsMachineTarget | foreach{
$AppID = $_.Id
$AppRev = $_.Revision
$AppTarget = $_.IsMachineTarget
# Line below installs them following the link
# https://docs.microsoft.com/en-us/previous-versions/system-center/developer/jj902780(v=cmsdk.12)?redirectedfrom=MSDN
([wmiclass]'ROOT\ccm\ClientSdk:CCM_Application').Install($AppID, $AppRev, $AppTarget, 0, 'Normal', $False) | Out-Null}
}
}

Remove-PSSession *