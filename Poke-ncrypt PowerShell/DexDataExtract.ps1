# Define the path to your CSV file
$csvPath = "C:\Users\lukes\GitHubRep\PowerShell-Project\Poke-ncrypt PowerShell\Pokedex Entries.csv"

# Read the CSV data
$csvData = Import-Csv -Path $csvPath

# Initialize an array to store the generated PSObject code
$psObjects = @()

# Loop through each row in the CSV data and generate the PSObject code
foreach ($row in $csvData) {
    $dexNumber = $row.no
    $name = $row.Name
    $dexEntry = $row.DexEntry -replace '"', '\"'  # Escape double quotes

    $psObjectCode = "[PSCustomObject]@{DexNumber = $dexNumber; Name = '$name'; DexEntry = '$dexEntry'}"
    $psObjects += $psObjectCode
}

# Combine the PSObject code into a single string
$psObjectsCodeString = $psObjects -join ",`n"

# Print the final PSObjects array code to the console
Write-Output "`$PokedexData = @(`n$psObjectsCodeString`n)"
