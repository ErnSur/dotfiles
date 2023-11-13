
eval "$(/opt/homebrew/bin/brew shellenv)"
export NVM_DIR="$HOME/.config/nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

## Add PyenvPython to PATH
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/shims:$PATH"

if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi

## Ruby & Cocoapods
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

## PATH
export PATH=$HOME/.config/scripts:$PATH
export PATH=$HOME/Library/Android/sdk/platform-tools:$PATH
export PATH="/opt/homebrew/opt/openjdk@17/bin:$PATH"

# TODO: Autocreate folders if they dont exists
export BUILDS=~/Builds
export REPOS=~/Repos
export TEMP=~/Temp

export NPM_REG_SDK="https://homagames.jfrog.io/artifactory/api/npm/unity-public-sdk/"
export NPM_REG_SDK_PRE="https://homagames.jfrog.io/artifactory/api/npm/unity-public-sdk-pre-release/"

loadPoshTheme() {
  theme=$(brew --prefix oh-my-posh)/themes/${1}.omp.json
  eval "$(oh-my-posh init zsh --config ${theme})"
}
loadPoshTheme avit

symlink() {
  # 1 - from
  # 2 - to
  ln -s "$1" "$2"
}

pullApk() {
  adb pull $(adb shell pm path "$1") .
}

getRepos() {
  #gh search repos --owner=ErnSur --json url
  pwsh -Command "Get-GhRepos '${1}'"
}

newGitIgnore() {
  pwsh -Command "New-GitIgnore"
}

# edit profile
profile="~/.zprofile"
alias opProfile="code $profile"
alias sProfile="source $profile"

# check Unity project version
alias chver='grep -oE "\d.+" ProjectSettings/ProjectVersion.txt'

## ADB
# restart adb
alias adbres="adb kill-server && adb start-server"
# list installed apps
alias pmnames="adb shell pm list packages -f"

# Source: https://askubuntu.com/questions/73709/how-do-i-delete-all-empty-directories-in-a-directory-from-the-command-line
delete_empty_dir() {
  find . -type f -name ".DS_Store" -print -delete
  find . -empty -type d -print -delete
}

# Grant exec permissions to all of the files in directory
gper() {
  ls $1 | xargs -p -L1 chmod +x
}

# Get filename without extension
gname() {
  echo $(basename "${1%.*}")
}

getRepoName(){
  basename $(git config --get remote.origin.url) .git
}
