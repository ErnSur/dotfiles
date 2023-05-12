# homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Utility
brew install duti # https://github.com/moretension/duti
	# stack post: https://apple.stackexchange.com/a/123954
	# get app bundle_id: mdls -name kMDItemCFBundleIdentifier -r "/Applications/Visual Studio Code.app"
brew install --cask fork
brew install --cask rider
brew install --cask obsidian
brew install --cask rectangle
brew install --cask microsoft-edge
brew install --cask icons8
brew install --cask iterm2
brew install --cask visual-studio-code
# colorSlurp is missing
brew install --cask 1password
brew install --cask licecap
brew install --cask snipaste
brew install gh
brew install --cask folx

brew install --cask steam
brew install --cask unity-hub
brew install --cask vlc

# Shell
brew install --cask powershell
brew install jandedobbeleer/oh-my-posh/oh-my-posh

# Other
brew install --cask krita
brew install --cask the-unarchiver

# Dev
brew install git-lfs
brew install pyenv
brew install nvm
mkdir ~/.config/nvm # required by nvm, also add some code to .zshrc

# Android dev
brew install pidcat
brew install --cask android-studio
brew install jadx
brew install bundletool
# Android user
brew install --cask android-file-transfer

# Other
brew install --cask messenger
brew install --cask middleclick


# TODO:
#- add openUPM
#- install python with pyenv
pyenv install 2.7.18

# PIDCAT
# to make it work you need to update the python reference
# code "$(which pidcat)"
# replace path in the first line to the new one from pyenv:
# example: /Users/ernest.surys/.pyenv/versions/2.7.18/bin/python

# TODO:
# macOS Settings:
#  - Open In new tab: always
#  - Accesability > Pointer Control > Trackpad Options... > Enable dragging: without drag lock