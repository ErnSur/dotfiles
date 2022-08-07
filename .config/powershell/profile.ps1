#$env:AndroidSDK = "~/Library/Android/sdk"
#$env:PATH += ":$env:AndroidSDK/platform-tools/"
#$PSToolbox = "$HOME/Repos/Automation/PowerShell-Toolkit"
#$PSToolbox | Get-ChildItem -Directory | Import-Module
#Set-Alias fork "/usr/local/bin/fork"

# To start pwsh without "logo"
# /usr/local/bin/pwsh-nologo

Set-Alias clr Clear-Console
$env:POSH_SESSION_DEFAULT_USER = "ES"

#oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\lambdageneration.omp.json" | Invoke-Expression

function Clear-GitCache {
    git rm -r --cached .
    git add .
}

function Get-GhRepos {
    #gh search repos --owner=ErnSur --json url | ConvertFrom-Json | ForEach-Object -Process {$_.url+".git"}
    gh search repos --owner=ErnSur --json url | ConvertFrom-Json | ForEach-Object -Process {
        return @{
            Name = "Nam"
            Url = $_.url
        }
    }
}

function New-UPMPackage {

    [CmdletBinding()]
    param (
        [Parameter(Mandatory)]
        [string]$PackageName,
        [Parameter(Mandatory)]
        [string]$DisplayName,
        [string]$Author,
        [Parameter(Mandatory)]
        [string]$AssemblyName
    )

    function New-PackageJson() {
        [ordered]@{
            "name" = "$PackageName"
            "displayName" = "$DisplayName"
            "author" = "$Author"
            "version" = "0.1.0"
            "unity" = "2021.3"
        } | ConvertTo-Json | New-Item "package.json"
    }

    function New-AsmdefEditor {
        [ordered]@{
            "name" = "$AssemblyName.Editor"
            "references"= @("$AssemblyName")
            "includePlatforms" = @("Editor")
        } | ConvertTo-Json | New-Item "Editor/$AssemblyName.Editor.asmdef"
    }

    New-Item -ItemType Directory "$PackageName"
    Set-Location "$PackageName"
    New-Item -ItemType Directory "Editor"
    New-AsmdefEditor
    New-Item -ItemType Directory "Runtime"
    @{ "name" = "$AssemblyName" } | ConvertTo-Json | New-Item "Runtime/$AssemblyName.asmdef"
    New-PackageJson
    New-Item -ItemType File "README.md"
}

function devices {
    Get-AdbDevices | Format-Table Id, Model, Product
}

function Get-GitIgnore {
    $url = "https://gist.githubusercontent.com/ErnSur/8112c76adab8633e60db4aff7ca3b8e8/raw/"
    $content = (New-Object System.Net.WebClient).DownloadString($url)
    return $content
}

function New-GitIgnore {
    Get-GitIgnore | Out-File "./.gitignore"
}

function Update-UPMVersion {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory)]
        [string]
        $JsonPath,
        [Parameter(Mandatory)]
        [string]
        $NewVersion
    )
    $a = Get-Content $JsonPath -raw | ConvertFrom-Json
    $a.version = $NewVersion
    $a | ConvertTo-Json -depth 32 | set-content $JsonPath
    $a
}

function opProfile {
    code $PROFILE.CurrentUserAllHosts
}

function gt {
    git log --graph --abbrev-commit --decorate --oneline
}