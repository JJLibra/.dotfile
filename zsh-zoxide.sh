#!/bin/zsh

if [ "$EUID" -ne 0 ]; then
  echo "Please run this script as root or with sudo."
  exit 1
fi

echo "Installing Zsh plugins(zoxide)..."

if [ ! -d "$HOME/.oh-my-zsh" ]; then
  echo "Oh-My-Zsh not found. Please install it before running this script."
  exit 1
fi

echo "Installing zoxide..."
apt install -y zoxide fzf

echo "Installation complete! Please restart your terminal or log out and back in to apply the changes."
