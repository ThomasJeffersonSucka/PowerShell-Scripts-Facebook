# Location of user file (normally in the format of samaccountname in AD)
$users_file = 'c:\RDP_Setup\users.txt'
$users = get-connect $user

# Location of computer file
$computersfile= 'c:\RDP_Setup\computers.txt'
$computers = get-content $computersfile

# Specify domain name here 
$domain = 'testdomain1.test.domain.com'

# Will first attempt test-connection (ping) to every computer. 
# If computer replies, it will add all specified users as RDP users
# If not, will skip and go to the next
foreach($pc in $computers){
    if(test-connection $pc -ErrorAction SilentlyContinue){
    foreach($user in $users){
        ([adsi]"WinNT://$pc/Remote Desktop Users,group").psbase.invoke("Add",([adsi]"WinNT://$domain/$user").path)
    Write-Host "$user was added as a Remote Desktop User to $pc"}}
    else{write-host "Unable to connect to $pc"}}