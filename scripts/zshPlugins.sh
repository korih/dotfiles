#!/bin/bash

# Function to install Homebrew
install_homebrew() {
  if ! command -v brew &>/dev/null; then
    echo "Homebrew not found. Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
    eval "$(/opt/homebrew/bin/brew shellenv)"
  else
    echo "Homebrew is already installed."
  fi
}

# Function to install Zsh
install_zsh() {
  if [ "$SHELL" != "/bin/zsh" ]; then
    echo "Installing Zsh..."
    brew install zsh
    chsh -s /bin/zsh
  else
    echo "Zsh is already set as the default shell."
  fi
}

# Function to install zsh-aliases
install_zsh_aliases() {
  if [ ! -d ~/.oh-my-zsh/custom/plugins/zsh-aliases ]; then
    echo "Installing zsh-aliases..."
    git clone https://github.com/zdharma-continuum/zsh-aliases-exa.git ~/.oh-my-zsh/custom/plugins/zsh-aliases
  else
    echo "zsh-aliases is already installed."
  fi
}

# Function to install zsh-syntax-highlighting
install_zsh_syntax_highlighting() {
  if [ ! -d ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting ]; then
    echo "Installing zsh-syntax-highlighting..."
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
  else
    echo "zsh-syntax-highlighting is already installed."
  fi
}

# Function to install Powerlevel10k
install_powerlevel10k() {
  if [ ! -d ~/.oh-my-zsh/custom/themes/powerlevel10k ]; then
    echo "Installing Powerlevel10k..."
    git clone https://github.com/romkatv/powerlevel10k.git ~/.oh-my-zsh/custom/themes/powerlevel10k
  else
    echo "Powerlevel10k is already installed."
  fi
}

# Function to install eza
install_eza() {
  if ! command -v eza &>/dev/null; then
    echo "Installing eza..."
    brew install eza
  else
    echo "eza is already installed."
  fi
}

# Function to install zoxide
install_zoxide() {
  if ! command -v zoxide &>/dev/null; then
    echo "Installing zoxide..."
    brew install zoxide
  else
    echo "zoxide is already installed."
  fi
}

# Function to configure .zshrc
configure_zshrc() {
  echo "Configuring .zshrc..."

  # Add plugins to .zshrc if not already present
  grep -q "plugins=(git zsh-aliases zsh-syntax-highlighting)" ~/.zshrc || echo "plugins=(git zsh-aliases zsh-syntax-highlighting)" >> ~/.zshrc

  # Add Powerlevel10k theme to .zshrc if not already present
  grep -q "ZSH_THEME=\"powerlevel10k/powerlevel10k\"" ~/.zshrc || echo "ZSH_THEME=\"powerlevel10k/powerlevel10k\"" >> ~/.zshrc

  # Source the zsh-syntax-highlighting
  grep -q "source ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ~/.zshrc || echo "source ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ~/.zshrc

  # Add zoxide initialization
  grep -q "eval \"\$(zoxide init zsh)\"" ~/.zshrc || echo "eval \"\$(zoxide init zsh)\"" >> ~/.zshrc

  echo "Configuration complete. Please restart your terminal."
}

# Install necessary components
install_homebrew
install_zsh

# Install Oh My Zsh
if [ ! -d ~/.oh-my-zsh ]; then
  echo "Installing Oh My Zsh..."
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
  echo "Oh My Zsh is already installed."
fi

install_zsh_aliases
install_zsh_syntax_highlighting
install_powerlevel10k
install_eza
install_zoxide
configure_zshrc

echo "Installation complete!"
