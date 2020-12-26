# Apply macOS configuration.
sh ./.macos

# Install command-line tools and softwares using Homebrew.

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Save Homebrew’s installed location.
BREW_PREFIX=$(brew --prefix)

# Install GNU core utilities (those that come with macOS are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils
ln -s "${BREW_PREFIX}/bin/gsha256sum" "${BREW_PREFIX}/bin/sha256sum"

# Install `wget`.
brew install wget

# Install more recent versions of some macOS tools.
brew install vim
brew install openssh

# Install other useful binaries.
brew install git
brew install nvm
brew install pnpm
brew install php
brew install phpmyadmin
brew install mariadb
brew install composer

# Install JetBrains mono font.
brew tap homebrew/cask-fonts
brew install font-jetbrains-mono --cask

# Install Logitech Options.
brew tap homebrew/cask-drivers
brew install logitech-options --cask

# Install other useful softwares.
brew install chromium --cask
brew install figma --cask
brew install visual-studio-code --cask
brew install messenger --cask
brew install whatsapp --cask
brew install discord --cask
brew install spectacle --cask
brew install transmission --cask
brew install keka --cask
brew install appcleaner --cask
brew install firefox --cask
brew install slack --cask
brew install onyx --cask

# Remove outdated versions from the cellar.
brew cleanup
brew cleanup -s

# Install Node LTS Fermium (V14).
nvm install lts/fermium

# Install Oh My Zsh.
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install Oh My Zsh plugins.
git clone https://github.com/zsh-users/zsh-autosuggestions.git ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting

# Remove .zshrc file created by Oh My Zsh installation.
rm ~/.zshrc

# Create symlinks for files needed in ~.
ln -sv ~/Workspace/dotfiles/.zshrc ~
ln -sv ~/Workspace/dotfiles/.hushlogin ~
ln -sv ~/Workspace/dotfiles/.curlrc ~
ln -sv ~/Workspace/dotfiles/.wgetrc ~

# Add custom shortcuts to Spectacle.
cp -r spectacle.json ~/Library/Application\ Support/Spectacle/Shortcuts.json 2> /dev/null

# Install Laravel Valet.
composer global require laravel/valet
valet install

# Setup phpMyAdmin
cd /usr/local/share/phpmyadmin
valet link
valet secure
cd

# Reboot
sudo reboot
