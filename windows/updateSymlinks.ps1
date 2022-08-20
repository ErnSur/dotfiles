# Run from dotfiles root dir with admin rights
function New-Link ($target, $link) {
    $dir = Split-Path -Path $link
    New-Item -ItemType Directory -Force -Path "$dir"
    New-Item -Path $link -ItemType SymbolicLink -Value $(Resolve-Path $target) -Force
}

# pwsh profile
New-Link "./.config/powershell/profile.ps1" "~/Documents/PowerShell/profile.ps1"
# gitconfig
New-Link "./.config/git/config" "~/.gitconfig"
# gitignore
New-Link "./.config/git/.gitignore" "~/.config/git/.gitignore"

# Windows Terminal
New-Link "./windows/windows-terminal.settings.json" "~/AppData\Local\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json"

# unity shortcuts
New-Link "./unity/ES Shortcuts.shortcut" "~/AppData/Roaming/Unity/Editor-5.x/Preferences/shortcuts/default/ES Shortcuts.shortcut"
# window layouts are not in sync, I could try symlinking parent directory instead. adding a gitignore inside so that default layouts are not in repo changes
New-Link "./unity/ES Tall.wlt" "~/AppData/Roaming/Unity/Editor-5.x/Preferences/Layouts/default/ES Tall.wlt"
