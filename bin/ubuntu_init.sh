#!/bin/bash
# This script will setup a new Ubuntu machine with all the tools I need.
echo
echo "This script will perform the following Ubuntu initial setup:"
echo " - Zsh Shell"
echo " - Oh-My-Zsh"
echo " - SSH Server"
echo
echo -n "Do you want to continue? (y/n):"
read CONTINUE
if [ $CONTINUE != "y" ]; then
    echo "Exiting..."
    exit 1
fi

# Verify if the script is being run in a Ubuntu machine or other OS
if [ "$(uname)" != "Linux" ]; then
    echo "This script is only for Ubuntu. Exiting..."
    echo
    exit 1
fi

# Verify if the shell is Zsh. If not, change it
if [ $SHELL != "/bin/zsh" ]; then
    echo "==> Changing shell to zsh"
    sudo apt install zsh
    chsh -s $(which zsh)
else
    echo "==> Shell is already zsh. Skipping..."
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
done < ./lib/ubuntu/app_settings/zsh/aliases

# Tell the user to restart the computer
echo
echo "Please restart your computer to apply all the changes."
echo

# If DEVTOOL variable is not present in .zshrc, add it pointing to the current folder
if [ ! -f "$HOME/.zshrc" ]; then
    echo "export DEVTOOL=$PWD" >> $HOME/.zshrc
else
    if grep -Fxq "export DEVTOOL=$PWD" $HOME/.zshrc; then
        echo " DEVTOOL variable already exists. Skipping..."
    else
        echo "export DEVTOOL=$PWD" >> $HOME/.zshrc
        echo "export PATH=$DEVTOOL:$PATH" >> ~/.zshrc
        echo " Added: DEVTOOL=$PWD"
    fi
fi