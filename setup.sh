#!/bin/bash

# Set up XDG_CONFIG_HOME

export XDG_CONFIG_HOME="$HOME"/.config
mkdir -p "$XDG_CONFIG_HOME"
mkdir -p "$XDG_CONFIG_HOME"/nixpkgs

# Create symlinks for existing configuration files
ln -sf "$PWD/nvim" "$XDG_CONFIG_HOME"/nvim
ln -sf "$PWD/.vimrc" "$HOME"/.vimrc
ln -sf "$PWD/.config/starship.toml" "$XDG_CONFIG_HOME"/starship.toml
ln -sf "$PWD/.config/kitty" "$XDG_CONFIG_HOME"/kitty
ln -sf "$PWD/.tmux.conf" "$HOME"/.tmux.conf
ln -sf "$PWD/.tmux" "$HOME"/.tmux
ln -sf "$PWD/.zshrc" "$HOME"/.zshrc
ln -sf "$PWD/.gitconfig" "$HOME"/.gitconfig
ln -sf "$PWD/config.nix" "$XDG_CONFIG_HOME"/nixpkgs/config.nix
ln -sf "$PWD/.bashrc" "$HOME"/.bashrc
ln -sf "$PWD/.zshenv" "$HOME"/.zshenv

# Install Nix Packages from config.nix
# nix-env -iA nixpkgs.myPackages

packages=(
	tmux
	tmuxplugin-vim-tmux-navigator-unstable
	fd
	ripgrep
	npm
	fzf
	neovim
	starship
)

for package in "${packages[@]}"; do
	nix-env -iA nixpkgs."$package"
done

# Install tmux plugins
~/.tmux/plugins/tpm/tpm

echo "Setup complete. Zsh configuration files have been downloaded and set up."
