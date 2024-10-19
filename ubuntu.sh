#!/bin/bash

if [ "$EUID" -ne 0 ]; then
  echo "Please run this script as root or with sudo."
  exit 1
fi

echo "Updating package lists and upgrading system..."
apt update && apt upgrade -y

echo "Installing common tools: net-tools, curl, wget..."
apt install -y net-tools curl wget

echo "Installing build-essential..."
apt install -y build-essential

echo "Configuring Git..."
git config --global user.name "jj_li_ubuntu"
git config --global user.email "2565474095@qq.com"

echo "Cleaning up unused packages..."
apt autoremove -y && apt clean

echo "Installing zsh..."
apt install -y zsh
chsh -s $(which zsh) $(whoami)

echo "Installing oh-my-zsh..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
