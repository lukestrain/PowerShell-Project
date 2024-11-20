<# This is a fun way to generate a symmetric key in PowerShell using Pokemon teams! 

 It requires a custom csv that was formatted to remove special characters and spaces. I could make a version with data for each Pokemon built in already but I'm going to work with this right now

#>

$dex = import-csv -path ".\Pokedex Entries Formatted.csv"
$dex | Get-Member
