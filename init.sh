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

# Install `wget` with IRI support.
brew install wget --with-iri

# Install more recent versions of some macOS tools.
brew install vim --with-override-system-vi
brew install openssh

# Install JetBrains mono font.
brew tap homebrew/cask-fonts
brew cask install font-jetbrains-mono

# Install other useful binaries.
brew install git
brew install nvm
brew install pnpm

# Install other useful softwares.
brew cask install chromium
brew cask install figma
brew cask install visual-studio-code
brew cask install messenger
brew cask install whatsapp
brew cask install discord
brew cask install spectacle

# Remove outdated versions from the cellar.
brew cleanup

# Install Node LTS Fermium (V14).
nvm install lts/fermium

# Install Oh My Zsh.
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install Oh My Zsh plugins.
git clone https://github.com/zsh-users/zsh-autosuggestions.git ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting

# Remove .zshrc file created by Oh My Zsh installation.
rm ~/.zshrc

# Create symlinks needed in ~.
ln -sv ~/Desktop/dotfiles/.zshrc ~
ln -sv ~/Desktop/dotfiles/.hushlogin ~
ln -sv ~/Workspace/dotfiles/.curlrc ~
ln -sv ~/Desktop/dotfiles/.wgetrc ~

# Add custom shortcuts to Spectacle.
cp -r spectacle.json ~/Library/Application\ Support/Spectacle/Shortcuts.json 2> /dev/null
