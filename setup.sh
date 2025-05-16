#!/bin/bash

export XDG_CONFIG_HOME="$HOME"/.config
mkdir -p "$XDG_CONFIG_HOME"

# Install Homebrew
if ! command -v brew &> /dev/null; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Create symlinks for existing configuration files
if [ -d "$XDG_CONFIG_HOME/nvim" ]; then
    cp -r "$XDG_CONFIG_HOME/nvim" "$XDG_CONFIG_HOME/backup_nvim"
    rm -rf "$XDG_CONFIG_HOME/nvim"
fi
ln -sf "$PWD/nvim" "$XDG_CONFIG_HOME"/nvim
ln -sf "$PWD/.vimrc" "$HOME"/.vimrc
ln -sf "$PWD/.tmux.conf" "$HOME"/.tmux.conf
ln -sf "$PWD/.tmux" "$HOME"/.tmux
ln -sf "$PWD/.zshrc" "$HOME"/.zshrc
ln -sf "$PWD/.bashrc" "$HOME"/.bashrc
ln -sf "$PWD/.zshenv" "$HOME"/.zshenv
ln -sf "$PWD/.gitconfig" "$HOME"/.gitconfig

# Install Nix Packages from config.nix
# nix-env -iA nixpkgs.myPackages

packages=(
	tmux
	ripgrep
	node
	fzf
	neovim
)

for package in "${packages[@]}"; do
	brew install "$package"
done
#
# Install tmux plugins
"$HOME"/.tmux/plugins/tpm/scripts/install_plugins.sh

echo "Setup complete. Zsh configuration files have been downloaded and set up."
