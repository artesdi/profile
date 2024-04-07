/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

brew install git

git clone https://github.com/artesdi/profile.git ~/profile

#terminal
brew install --cask iterm2
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
git clone https://github.com/jeffreytse/zsh-vi-mode $ZSH_CUSTOM/plugins/zsh-vi-mode

#devenv
brew install tfenv
brew install wget

#vim
brew install nvim
brew install ripgrep
brew install lazygit
cd $HOME/Library/Fonts && wget -qO- https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.0/Meslo.zip | bsdtar -xvf-

#python
brew install pyenv
git clone https://github.com/momo-lab/pyenv-install-latest.git "$(pyenv root)"/plugins/pyenv-install-latest
pyenv install-latest
brew install pyenv-virtualenv

#node
mkdir ~/.nvm
brew install nvm

#sdkman
curl -s "https://get.sdkman.io" | bash
source "$HOME/.sdkman/bin/sdkman-init.sh"

#apps
brew install --cask 1password
brew install --cask google-chrome
brew install --cask postman
brew install --cask slack
brew install --cask notion
brew install --cask gitkraken
brew install --cask spectacle
brew install --cask karabiner-elements
brew install --cask boop
brew install --cask sublime-text
brew install --cask zoom
brew install --cask postman
brew install --cask caffeine
brew install --cask docker
brew install --cask visual-studio-code
brew install --cask spotify

brew install alt-tab
brew install mackup
echo "[storage]\nengine = icloud" >>~/.mackup.cfg
mackup restore

#unix
brew install plantuml
brew install --cask temurin

brew install telnet
brew install fzf
$(brew --prefix)/opt/fzf/install
