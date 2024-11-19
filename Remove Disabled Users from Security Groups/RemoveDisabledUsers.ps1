# Get all disabled users in the Domain
$users = Get-ADUser -SearchBase "DC=ADATUM,DC=COM" -filter {Enabled -eq $false}

#$users = Get-ADUser -Identity ada

# Remove the users from all security groups (except domain users)

foreach($u in $users){
    $groups = Get-ADPrincipalGroupMembership -Identity $u
    $groupsRemoved = @()
    foreach($g in $groups){
        IF($G.name -ne "Domain Users"){
            Remove-ADGroupMember -Identity $g -Members $u -Confirm:$false
            $groupsRemoved += (get-ADGroup -Identity $g -Properties Name | Select-Object -Property name)
        }
    }
    $groupsRemovedString = $groupsRemoved | Join-String -Separator ", "
    Set-ADUser -Identity $u -Description "Removed from $groupsRemovedString because the account was disabled"
}


#Get-ADGroup -Identity "Marketing" -Properties Name | select-object -Property name