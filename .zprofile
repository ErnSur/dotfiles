
eval "$(/opt/homebrew/bin/brew shellenv)"
export NVM_DIR="$HOME/.config/nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

## PATH
export PATH=$HOME/.config/scripts:$PATH

# TODO: Autocreate folders if they dont exists
export BUILDS=~/Builds
export REPOS=~/Repos
export TEMP=~/Temp

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
  gh search repos --owner=ErnSur --json url
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