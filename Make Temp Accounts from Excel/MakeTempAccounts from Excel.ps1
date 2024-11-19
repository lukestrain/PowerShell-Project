#Import Excel
Import-Module ImportExcel

$path = Read-Host "Enter the filepath of the excel file " #For Lab its C:\Users\Administrator.ADATUM\Desktop\TempAccounts.xlsx
#Excel headers have the following info: Organization name, exercise dates and supervisor

$OrgInfo = Import-Excel -path $path -StartRow 2 -EndRow 3


$expDate = $orgInfo.'Expiration Date'
$OUName = $OrgInfo.OrgName + "_temp"
$Domain = Read-Host "Enter the Domain" #For lab it's DC=ADATUM,DC=COM

#Create domain path from the domain
$DomainArray = $domain.split(".")

$ct = 0
while ( $ct -le 1) {
    $DomainArray[$ct] = $DomainArray[$ct].insert(0, "DC=")
    $CT += 1    
}
$DomainPath = $DomainArray -join ","



New-ADOrganizationalUnit -Name $OUName -ProtectedFromAccidentalDeletion $false -path $DomainPath #Creates a new OU for the temporary organization
$NewOU = "OU=$OUNAME,$DomainPath"

$TempPass = ConvertTo-SecureString -AsPlainText "Pa55w.rd" -Force ## Defines the temporary Password variable

#Next (optional) create 1-3 designated admins for the organization to help with administration


#Finally, create accounts from the third section of the excel has required user information for accounts. First, Last, Position, Cell #. Set Temp Password

$TempAccounts = Import-Excel -Path $path -StartRow 5

forEach($u in $TempAccounts) {
    $first = ($u.'First Name') #first name from excel
    $last = ($u.'Last Name') #last name from excel
    $display = "$first $last"
    $sam = "$first" + "." + "$last"
    $upn = "$sam" + "@$Domain"

    $phone = $u.'Phone Number' #phone Number from excel
    New-ADUser -name $display -GivenName $first -Surname $last -DisplayName $display  -UserPrincipalName $upn -SamAccountName $sam -MobilePhone $phone -Enabled $true -AccountPassword $TempPass -ChangePasswordAtLogon $true -AccountExpirationDate $expDate -Manager $supervisor -Path "$NewOU"
}

#Things to do next: Add the Supervisor functionality. I would need to create the supervisor's account from the excel doc, remove it from the list of accounts to be created, store his/her account as the $supervisor variable, then add -manger $supervisor to the new-aduser command in the function