<# This is a fun way to generate a symmetric key in PowerShell using Pokemon teams! 

 It requires a custom csv that was formatted to remove special characters and spaces. I could make a version with data for each Pokemon built in already but I'm going to work with this right now

#>

$dex = import-csv -path "C:\Users\lukes\GitHubRep\PowerShell-Project\Poke-ncrypt PowerShell\Pokedex Entries Formatted.csv"
$dex | fl

function PoKey {
    param(
        [array]$PokemonTeam
    )

    #Error checking to ensure the array length is correct, and that there are all items in the Array are pokemon names or numbers
    if($PokemonTeam.length -lt 1){
        write-host "ERROR: Requires at least pokemon on the team"
    }
    elseif ($PokemonTeam.length -gt 6 ) {
        Write-Host "ERROR: You can only have six Pokemon in the array"
        <# Action when this condition is true #>
    }

}