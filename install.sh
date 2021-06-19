# Install Homebrew.
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

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

# Install `wget`.
brew install wget

# Install more recent versions of some macOS tools.
brew install openssh
brew install vim

# Install other useful binaries.
brew install composer
brew install git
brew install nvm
brew install php
brew install pnpm --ignore-dependencies

# Install JetBrains mono font.
brew tap homebrew/cask-fonts
brew install font-jetbrains-mono --cask

# Install drivers.
brew tap homebrew/cask-drivers
brew install logitech-options --cask

# Install other useful softwares.
brew install appcleaner --cask
brew install brave-browser --cask
brew install discord --cask
brew install figma --cask
brew install keka --cask
brew install messenger --cask
brew install onyx --cask
brew install qbittorrent --cask
brew install rectangle --cask
brew install slack --cask
brew install spotify --cask
brew install visual-studio-code --cask
brew install whatsapp --cask

# Remove outdated versions from the cellar.
brew cleanup
brew cleanup -s

# Remove .zshrc file created by Oh My Zsh installation.
rm ~/.zshrc

# Create symlinks for files needed in ~.
ln -sv ~/Workspace/dotfiles-mac/.zshrc ~
ln -sv ~/Workspace/dotfiles-mac/.hushlogin ~
ln -sv ~/Workspace/dotfiles-mac/.curlrc ~
ln -sv ~/Workspace/dotfiles-mac/.wgetrc ~

# Install Oh My Zsh.
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
