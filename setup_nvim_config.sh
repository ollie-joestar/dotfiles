#!/bin/bash

export XDG_CONFIG_HOME="$HOME"/.config
# mkdir -p "$XDG_CONFIG_HOME"

# Uncomment next 16 lines if you need to install Homebrew, Neovim and other dependencies

# Install Homebrew if not already installed
# if ! command -v brew &> /dev/null; then
#     /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
# fi
#
# Install dependencies
# packages=(
# 	ripgrep
# 	fzf
# 	neovim
# )
#
# for package in "${packages[@]}"; do
# 	brew install "$package"
# done

if [ -d "$XDG_CONFIG_HOME/nvim" ]; then
    cp -r "$XDG_CONFIG_HOME/nvim" "$XDG_CONFIG_HOME/backup_nvim"
    rm -rf "$XDG_CONFIG_HOME/nvim"
fi

git clone https://github.com/ollie-joestar/nvim.git "$XDG_CONFIG_HOME/nvim"
