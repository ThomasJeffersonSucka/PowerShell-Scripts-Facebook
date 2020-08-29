<# This form was created using POSHGUI.com  a free online gui designer for PowerShell
.NAME
    Untitled
#>

Add-Type -AssemblyName System.Windows.Forms
[System.Windows.Forms.Application]::EnableVisualStyles()

$sccm_checker                    = New-Object system.Windows.Forms.Form
$sccm_checker.ClientSize         = '879,608'
$sccm_checker.text               = "SCCM Checker"
$sccm_checker.TopMost            = $false

$select_server1                  = New-Object system.Windows.Forms.Label
$select_server1.text             = "Select AFNET Servers"
$select_server1.AutoSize         = $true
$select_server1.width            = 25
$select_server1.height           = 10
$select_server1.location         = New-Object System.Drawing.Point(9,12)
$select_server1.Font             = 'Microsoft Sans Serif,10'

$servers1                   = New-Object system.Windows.Forms.checkedlistbox
$servers1.text              = "afnetservers"
$servers1.width             = 165
$servers1.height            = 201
$servers1.location          = New-Object System.Drawing.Point(10,35)

#Edit Domain Servers Here
@('server1','server2') | ForEach-Object {[void] $servers1.Items.Add($_)}

$updates                        = New-Object system.Windows.Forms.listbox
$updates.width                  = 860
$updates.height                 = 145
$updates.location               = New-Object System.Drawing.Point(9,274)
$updates.Font                   = 'Microsoft Sans Serif,10'
#$updates.ReadOnly               = $true
#$updates.Multiline              = $true
#$updates.ScrollBars             = 'Both'
#$updates.WordWrap               = $false
$updates.ScrollAlwaysVisible     = $true
$updates.HorizontalScrollbar     = $true

$select_server2                  = New-Object system.Windows.Forms.Label
$select_server2.text             = "Select DMZ Servers"
$select_server2.AutoSize         = $true
$select_server2.width            = 25
$select_server2.height           = 10
$select_server2.location         = New-Object System.Drawing.Point(205,12)
$select_server2.Font             = 'Microsoft Sans Serif,10'

$servers2                     = New-Object system.Windows.Forms.checkedlistbox
$servers2.text                = "dmzservers"
$servers2.width               = 164
$servers2.height              = 202
$servers2.location            = New-Object System.Drawing.Point(205,35)
#Edit Cross Domain Servers Here
@('server3','server4' )| ForEach-Object {[void] $servers2.Items.Add($_)}

$cross_domain_usrname                     = New-Object system.Windows.Forms.Label
$cross_domain_usrname.text                = "Cross Domain Username"
$cross_domain_usrname.AutoSize            = $true
$cross_domain_usrname.width               = 25
$cross_domain_usrname.height              = 10
$cross_domain_usrname.location            = New-Object System.Drawing.Point(390,40)
$cross_domain_usrname.Font                = 'Microsoft Sans Serif,10'

$cross_domain_usrname_txt                 = New-Object system.Windows.Forms.TextBox
$cross_domain_usrname_txt.multiline       = $false
$cross_domain_usrname_txt.width           = 130
$cross_domain_usrname_txt.height          = 20
$cross_domain_usrname_txt.location        = New-Object System.Drawing.Point(550,35)
$cross_domain_usrname_txt.Font            = 'Microsoft Sans Serif,10'

$cross_domain_pswd                       = New-Object system.Windows.Forms.Label
$cross_domain_pswd.text                  = "Cross Domain Password"
$cross_domain_pswd.AutoSize              = $true
$cross_domain_pswd.width                 = 25
$cross_domain_pswd.height                = 10
$cross_domain_pswd.location              = New-Object System.Drawing.Point(390,65)
$cross_domain_pswd.Font                  = 'Microsoft Sans Serif,10'

$cross_domain_txt                    = New-Object system.Windows.Forms.maskedTextBox
$cross_domain_txt.multiline          = $false
$cross_domain_txt.width              = 131
$cross_domain_txt.height             = 20
$cross_domain_txt.location           = New-Object System.Drawing.Point(550,61)
$cross_domain_txt.Font               = 'Microsoft Sans Serif,10'
$cross_domain_txt.PasswordChar       = '*'        

$avail_patches                   = New-Object system.Windows.Forms.Label
$avail_patches.text              = "Updates that will be applied"
$avail_patches.AutoSize          = $true
$avail_patches.width             = 25
$avail_patches.height            = 10
$avail_patches.location          = New-Object System.Drawing.Point(9,260)
$avail_patches.Font              = 'Microsoft Sans Serif,10'

$chk_updates                     = New-Object system.Windows.Forms.Button
$chk_updates.text                = "Check for SCCM Updates"
$chk_updates.width               = 182
$chk_updates.height              = 44
$chk_updates.location            = New-Object System.Drawing.Point(388,104)
$chk_updates.Font                = 'Microsoft Sans Serif,10'

$inst_updates                    = New-Object system.Windows.Forms.Button
$inst_updates.text               = "Install SCCM Updates"
$inst_updates.width              = 182
$inst_updates.height             = 44
$inst_updates.location           = New-Object System.Drawing.Point(388,153)
$inst_updates.Font               = 'Microsoft Sans Serif,10'

$output_txt                      = New-Object system.Windows.Forms.richTextBox
$output_txt.multiline            = $true
$output_txt.width                = 861
$output_txt.height               = 143
$output_txt.location             = New-Object System.Drawing.Point(9,459)
$output_txt.Font                 = 'Microsoft Sans Serif,10'
$output_txt.ReadOnly             = $true

$output                          = New-Object system.Windows.Forms.Label
$output.text                     = "Output / Results"
$output.AutoSize                 = $true
$output.width                    = 25
$output.height                   = 10
$output.location                 = New-Object System.Drawing.Point(9,439)
$output.Font                     = 'Microsoft Sans Serif,10'

$clear1                          = New-Object system.Windows.Forms.Button
$clear1.text                     = "Clear"
$clear1.width                    = 60
$clear1.height                   = 30
$clear1.location                 = New-Object System.Drawing.Point(809,239)
$clear1.Font                     = 'Microsoft Sans Serif,10'

$Clear2                          = New-Object system.Windows.Forms.Button
$Clear2.text                     = "Clear"
$Clear2.width                    = 60
$Clear2.height                   = 30
$Clear2.location                 = New-Object System.Drawing.Point(810,424)
$Clear2.Font                     = 'Microsoft Sans Serif,10'

$select_all1                     = New-Object system.Windows.Forms.Button
$select_all1.text                = "Select All"
$select_all1.width               = 80
$select_all1.height              = 30
$select_all1.location            = New-Object System.Drawing.Point(10,229)
$select_all1.Font                = 'Microsoft Sans Serif,10'

$clear3                          = New-Object system.Windows.Forms.Button
$clear3.text                     = "Clear"
$clear3.width                    = 82
$clear3.height                   = 30
$clear3.location                 = New-Object System.Drawing.Point(93,229)
$clear3.Font                     = 'Microsoft Sans Serif,10'

$select_all2                     = New-Object system.Windows.Forms.Button
$select_all2.text                = "Select All"
$select_all2.width               = 83
$select_all2.height              = 30
$select_all2.location            = New-Object System.Drawing.Point(205,229)
$select_all2.Font                = 'Microsoft Sans Serif,10'

$clear4                          = New-Object system.Windows.Forms.Button
$clear4.text                     = "Clear"
$clear4.width                    = 78
$clear4.height                   = 30
$clear4.location                 = New-Object System.Drawing.Point(291,229)
$clear4.Font                     = 'Microsoft Sans Serif,10'

$btn_clearcache = New-Object System.Windows.Forms.Button
$btn_clearcache.Text = 'Clear Cache'
$btn_clearcache.Width = '82'
$btn_clearcache.Height = '30'
$btn_clearcache.Location           = New-Object System.Drawing.Point(388,202)

$export_updates                     = New-Object system.Windows.Forms.Button
$export_updates.text                = "Export Updates to 'C:\temp\results'"
$export_updates.width               = 250
$export_updates.height              = 44
$export_updates.location            = New-Object System.Drawing.Point(570,104)
$export_updates.Font                = 'Microsoft Sans Serif,10'


$sccm_checker.controls.AddRange(@($select_server1,$servers1,$updates,$select_server2,$servers2,$cross_domain_usrname,$cross_domain_usrname_txt,$cross_domain_pswd,$cross_domain_txt,
$avail_patches,$chk_updates,$inst_updates,$output_txt,$output,$Clear2,$clear1,$select_all1,$clear3, $select_all2,$clear4,$btn_clearcache,$export_updates))


$export_updates.add_click({
$date = get-date -Format 'MMM-dd-yyyy'
$time = get-date -Format 'HH:mm:ss'
$filename = "SCCM_Results"+"."+$date+"."+$time+".csv"
$updates.Items |  ft | export-csv "C:\temp\results\$filename"
})

$chk_updates.Add_Click({
$updates.Items.clear()
if ($cross_domain_usrname_txt.Text -ne $null){$account = $cross_domain_usrname_txt.Text}
if ($cross_domain_txt.Text -ne $null){$pwd = $cross_domain_txt.Text | ConvertTo-SecureString -AsPlainText -Force -ErrorAction SilentlyContinue}
if($account -ne $null -and $pwd -ne $null){
$cred = new-object -typename System.Management.Automation.PSCredential -argumentlist $Account,$pwd -ErrorAction SilentlyContinue
}

$servers1.CheckedItems| foreach{
$avail_patches1 = Get-WmiObject -Class CCM_SoftwareUpdate -Filter ComplianceState=0 -Namespace root\CCM\ClientSDK -Computername $_ | select $_, articleid, name
$avail_patches2 = Get-WmiObject -ComputerName $_ -Namespace root\ccm\clientsdk -Class ccm_application | where{$_.installstate -ne 'installed' -and $_.name -ne $null} | select $_,name,description  
$updates.Items.AddRange($avail_patches1)
$updates.Items.AddRange($avail_patches2)}

$servers2.CheckedItems | foreach{
$avail_patches1 = Get-WmiObject -Class CCM_SoftwareUpdate -Filter ComplianceState=0 -Namespace root\CCM\ClientSDK -Computername $_ -Credential $cred | select $_, articleid, name
$updates.Items.AddRange($avail_patches1)}
})

$btn_clearcache.add_click({
 $servers1.CheckedItems | foreach{
 Get-ChildItem \\$_\c$\windows\ccmcache | where{$_.Name -notlike '*.dat'} | select -exp fullname | foreach{Remove-Item $_ -Recurse -Force}}
})

$inst_updates.add_click({
    $servers1.CheckedItems | foreach{
        if(($env:COMPUTERNAME) -eq $_){
        Get-WmiObject -Class CCM_SoftwareUpdate -Filter ComplianceState=0 -Namespace root\CCM\ClientSDK | foreach{
        Invoke-WmiMethod -Class CCM_SoftwareUpdatesManager -Name InstallUpdates -ArgumentList (,$_) -Namespace root\ccm\clientsdk}
        $Apps = Get-WmiObject -Namespace "root\ccm\ClientSDK" -Class CCM_Application `
        | where {$_.installstate -ne "Installed"} | Select-Object Id, Revision, IsMachineTarget | foreach{
        $AppID = $_.Id
        $AppRev = $_.Revision
        $AppTarget = $_.IsMachineTarget
        ([wmiclass]'ROOT\ccm\ClientSdk:CCM_Application').Install($AppID, $AppRev, $AppTarget, 0, 'Normal', $False)}}
        else{
        Invoke-Command -ComputerName $_ -scriptblock{ 
        Get-WmiObject -Class CCM_SoftwareUpdate -Filter ComplianceState=0 -Namespace root\CCM\ClientSDK | foreach{
        Invoke-WmiMethod -Class CCM_SoftwareUpdatesManager -Name InstallUpdates -ArgumentList (,$_) -Namespace root\ccm\clientsdk}
        $Apps = Get-WmiObject -Namespace "root\ccm\ClientSDK" -Class CCM_Application `
        | where {$_.installstate -ne "Installed"} | Select-Object Id, Revision, IsMachineTarget | foreach{
        $AppID = $_.Id
        $AppRev = $_.Revision
        $AppTarget = $_.IsMachineTarget
        ([wmiclass]'ROOT\ccm\ClientSdk:CCM_Application').Install($AppID, $AppRev, $AppTarget, 0, 'Normal', $False)}}}
    $output_txt.Text += "SCCM Updates for $_ are complete `n"}
})


$select_all1.add_click({
 for($i=0; $i -lt $servers1.Items.Count; $i++){
 $servers1.SetItemChecked($i,$true)}
})

$clear3.add_click({
 for($i=0; $i -lt $servers1.Items.Count; $i++){
 $servers1.SetItemChecked($i,$false)}
})

$select_all2.add_click({
 for($i=0; $i -lt $servers2.Items.Count; $i++){
 $servers2.SetItemChecked($i,$true)}
})

$clear4.add_click({
 for($i=0; $i -lt $servers2.Items.Count; $i++){
 $servers2.SetItemChecked($i,$false)}
})

$clear1.add_click({$updates.Items.Clear()})

$sccm_checker.ShowDialog()