# homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# install oh-my-zsh

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
brew install gh
brew install --cask folx

brew install --cask steam
brew install --cask unity-hub
brew install --cask vlc
brew install --cask powershell
brew install --cask android-file-transfer
brew install --cask krita

# Dev
brew install nvm
mkdir ~/.config/nvm # required by nvm, also add some code to .zshrc

# Android dev
brew install --cask android-studio
brew install jadx
brew install bundletool


# TODO:
#- add openUPM