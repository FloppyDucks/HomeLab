# Import the Active Directory module
Import-Module ActiveDirectory

# Path to your CSV file
$csvPath = "C:\path\to\users.csv"

# Import the CSV file
$users = Import-Csv -Path $csvPath

foreach ($user in $users) {
    # Construct the SamAccountName (User logon name without domain)
    $samAccountName = $user.'User logon name'

    # Create the AD user
    New-ADUser `
        -GivenName $user.'First name' `
        -Surname $user.'Last Name' `
        -Name $user.'Full Name' `
        -DisplayName $user.'Full Name' `
        -SamAccountName $samAccountName `
        -UserPrincipalName ($samAccountName + "@openwrt.com") `
        -AccountPassword (ConvertTo-SecureString $user.Password -AsPlainText -Force) `
        -Path "OU=Users,OU=global,DC=openwrt,DC=com" `
        -Enabled $true `
        -ChangePasswordAtLogon $false
}
