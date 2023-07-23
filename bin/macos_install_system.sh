#!/bin/bash
# This script will setup a new MacOS machine with all the tools I need.
echo "This script will perform the following MacOS setup and installations:"
echo "* Set Zsh as the default shell"
echo "* Installation xcode-select"
echo "* Oh My Zsh"
echo "* Homebrew"
echo -n "Do you want to continue? (y/n):"
read CONTINUE
if [ $CONTINUE != "y" ]; then
  echo "Exiting..."
  exit 1
fi

# Verify if the script is being run in a Macos machine
if [ "$(uname)" != "Darwin" ]; then
  echo "FATAL: This script is only for MacOS"
  exit 1
fi

# Import the settings file from .config folder
source .config/settings.sh

# Asking for the administrator password upfront
echo "This script will require sudo access for the installation."
echo -n "Please enter your sudo "
sudo -v

# Keep-alive: update existing `sudo` time stamp until `setup_macos.sh` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Verify if the shell is Zsh. If not, change it
if [ $SHELL != "/bin/zsh" ]; then
  echo "Changing shell to zsh"
  chsh -s /bin/zsh
fi

# Install Xcode Command Line Tools
echo "Installing Xcode Command Line Tools..."
xcode-select --install

# Install Oh My Zsh
echo "Installing Oh My Zsh..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install Homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"#
