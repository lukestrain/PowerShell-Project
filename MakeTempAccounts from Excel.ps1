#Import Excel
Import-Module ImportExcel

$path = "C:\Users\Administrator.ADATUM\Desktop\TempAccounts.xlsx"
#Excel headers have the following info: Organization name, exercise dates and supervisor

$OrgInfo = Import-Excel -path $path -StartRow 2 -EndRow 3


#$expDate = Import-Excel -path $path -EndRow 2 -ImportColumns 4 -AsDate 4 #exercise end date from excel + 1 day
$expDate = $orgInfo.'Expiration Date'
$OUName = $OrgInfo.OrgName + "_temp"


New-ADOrganizationalUnit -Name $OUName -ProtectedFromAccidentalDeletion $false -path "DC=ADATUM,DC=COM" #Creates a new OU for the temporary organization
$NewOUPath = "OU=$OUNAME,DC=ADATUM,DC=COM"

$TempPass = ConvertTo-SecureString -AsPlainText "Pa55w.rd" -Force ## Defines the temporary Password variable

#Next (optional) create 1-3 designated admins for the organization to help with administration


#Finally, create accounts from the third section of the excel has required user information for accounts. First, Last, Position, Cell #. Set Temp Password

$TempAccounts = Import-Excel -Path "C:\Users\Administrator.ADATUM\Desktop\TempAccounts.xlsx" -StartRow 5

forEach($u in $TempAccounts) {
    $first = ($u.'First Name') #first name from excel
    $last = ($u.'Last Name') #last name from excel
    $display = "$first $last"
    $upn = "$first"+"."+"$last"

    $phone = $u.'Phone Number' #phone Number from excel
    New-ADUser -name $display -GivenName $first -Surname $last -UserPrincipalName $upn -MobilePhone $phone -ChangePasswordAtLogon $true -AccountExpirationDate $expDate -Manager $supervisor -AccountPassword $TempPass -Path "$NewOUPath"
}


#Things to do next: Add the Supervisor functionality. I would need to create the supervisor's account from the excel doc, remove it from the list of accounts to be created, store his/her account as the $supervisor variable, then add -manger $supervisor to the new-aduser command in the function