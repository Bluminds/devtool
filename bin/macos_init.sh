#!/bin/bash
# This script will setup a new MacOS machine with all the tools I need.
echo
echo "This script will perform the following MacOS initial setup:"
echo " - Zsh Shell"
echo " - xcode-select"
echo " - Oh-My-Zsh"
echo " - Homebrew"
echo
echo -n "Do you want to continue? (y/n):"
read CONTINUE
if [ $CONTINUE != "y" ]; then
  echo "Exiting..."
  exit 1
fi

# Verify if the script is being run in a Macos machine or linux
if [ "$(uname)" != "Darwin" ]; then
  echo "This script is only for MacOS. Exiting..."
  echo
  exit 1
fi

# Verify if the shell is Zsh. If not, change it
if [ $SHELL != "/bin/zsh" ]; then
  echo "==> Changing shell to zsh"
  chsh -s /bin/zsh
else
  echo "==> Shell is already zsh. Skipping..."
fi
echo

# Install Xcode Command Line Tools
#verify if xcode-select is installed
if [ ! -x "$(command -v xcode-select)" ]; then
  echo "==> Installing Xcode Command Line Tools..."
  xcode-select --install
else
  echo "==> Xcode Command Line Tools is already installed. Skipping..."
fi
echo

# Install Oh My Zsh
#verify if oh-my-zsh is installed
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  echo "==> Installing Oh My Zsh..."
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
  echo "==> Oh My Zsh is already installed. Skipping..."
fi
echo

# Install Homebrew
#verify if homebrew is installed
if [ ! -x "$(command -v brew)" ]; then
  echo "==> Installing Homebrew..."
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
  echo "==> Homebrew is already installed. Skipping..."
fi
echo

# Iterate through the file "aliases", verify if the alias is already in "$HOME/.zshrc" and add it if not
echo "==> Creating aliases in .zshrc "
while read -r line; do
  if [ ! -f "$HOME/.zshrc" ]; then
    echo "# Aliases" >> $HOME/.zshrc
    echo $line >> $HOME/.zshrc
  else
    if grep -Fxq "$line" $HOME/.zshrc; then
      echo " Alias $line already exists. Skipping..."
    else
      echo $line >> $HOME/.zshrc
      echo " Added: $line"
    fi
  fi
done < ./lib/macos/app_settings/zsh/aliases

# Tell the user to restart the computer
echo
echo "Please restart your computer to apply all the changes."
echo
