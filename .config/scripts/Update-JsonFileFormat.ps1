<#
    Format JSON file with indentations.
#>
param (
    # height of largest column without top bar
    [Parameter(Mandatory=$true)]
    [string]$jsonFilePath
)

# Add custom file command
# run shell
# pwsh -File ~/.config/scripts/Update-JsonFileFormat.ps1 "${file}"

$json = Get-Content -Path ${jsonFilePath} -Raw
$object = ConvertFrom-Json $json -Depth 100
$formattedJson = ConvertTo-Json $object -Depth 100
$formattedJson | Set-Content -Path ${jsonFilePath}