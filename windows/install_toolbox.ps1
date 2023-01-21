#if winget is missing update App Installer in ms store

winget install --accept-source-agreements -e --id Unity.UnityHub
winget install --accept-source-agreements -e --id Git.Git
winget install --accept-source-agreements -e --id GitHub.cli
winget install --accept-source-agreements -e --id GitHub.GitLFS
winget install --accept-source-agreements -e --id Fork.Fork
winget install --accept-source-agreements -e --id Microsoft.VisualStudioCode
winget install --accept-source-agreements -e --id JetBrains.Rider
winget install --accept-source-agreements --id Microsoft.Powershell --source winget
winget install --accept-source-agreements -e --id JanDeDobbeleer.OhMyPosh

winget install --accept-source-agreements -e --id Obsidian.Obsidian
winget install --accept-source-agreements -e --id VideoLAN.VLC
winget install --accept-source-agreements -e --id Microsoft.PowerToys
winget install --accept-source-agreements -e --id AgileBits.1Password
winget install --accept-source-agreements -e --id Logitech.OptionsPlus

winget install --accept-source-agreements -e --id Valve.Steam
wsl --install