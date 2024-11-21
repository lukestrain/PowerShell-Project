<# This is a fun way to generate a symmetric key in PowerShell using Pokemon teams! 

 It requires a custom csv that was formatted to remove special characters and spaces. I could make a version with data for each Pokemon built in already but I'm going to work with this right now.

 Additionally, it requires you enter the number of the pokemon, not the names. I can fix that though but for now I am just working on other things now that the script runs as is.

#>

$dex = import-csv -path "C:\Users\lukes\GitHubRep\PowerShell-Project\Poke-ncrypt PowerShell\Pokedex Entries Formatted.csv"

# $TestTeam = @(6, 12, 150, 151, 12, 18)

<# write-host $team
foreach($p in $team){
    write-host ("Hello $($dex[$p-1].Name)!")
} #>
Write-Host $TestTeam

function PoKey {
    param(
        [int[]]$PokemonTeam
    )

    # Error checking to ensure the array length is correct, and that all items in the array are Pokemon numbers
    if ($PokemonTeam.length -lt 1) {
        Write-Host "ERROR: Requires at least one Pokemon on the team"
        return
    } elseif ($PokemonTeam.length -gt 6) {
        Write-Host "ERROR: You can only have six Pokemon in the array"
        return
    }

    $TeamLength = $PokemonTeam.Length

    # Subtract Pokemon numbers by 1 for easier referencing
    $AdjustedTeam = $PokemonTeam | ForEach-Object { $_ - 1 }
    $PokemonTeam = $AdjustedTeam

    # Assemble the Dex Entries
    function dexAssemble {
        param (
            [int[]]$team
        )
        $outValue = @()
        foreach ($p in $team) {
            $outValue += $dex[$p].DexEntry
        }
        return $outValue
    }

    # Determine the maximum entry length
    function determineMaxEntryLength {
        param (
            [int[]]$team
        )
        $maxLength = 0
        foreach ($p in $team) {
            if ($dex[$p].DexEntry.Length -gt $maxLength) {
                $maxLength = $dex[$p].DexEntry.Length
            }
        }
        return $maxLength
    }

    # Assemble the key
    function keyAssemble {
        param (
            [string[]]$entries,
            [int]$maxLength,
            [int]$teamLength
        )
        $key = ''
        for ($i = 0; $i -lt $maxLength; $i++) {
            $n = 0
            while ($n -lt $teamLength) {
                if ($i -lt $entries[$n].Length) {
                    $string = $entries[$n]
                    $key += $string[$i]
                }
                $n += 1
            }
        }
        return $key
    }

    $maxLength = determineMaxEntryLength -team $PokemonTeam
    $entriesArray = dexAssemble -team $PokemonTeam
    $CombinedEntriesString = keyAssemble -entries $entriesArray -maxLength $maxLength -teamLength $TeamLength

    $sha256 = [System.Security.Cryptography.SHA256]::Create()
    $byteArray = [System.Text.Encoding]::UTF8.GetBytes($CombinedEntriesString)
    $hashBytes = $sha256.ComputeHash($byteArray)

    $hexString = -join ($hashBytes | ForEach-Object { "{0:X2}" -f $_ })
    
    return $hexString
}

$TestReturn = PoKey -PokemonTeam $TestTeam

Write-Host $TestReturn

