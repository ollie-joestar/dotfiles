{
  packageOverrides = pkgs: with pkgs; {
    myPackages = pkgs.buildEnv {
      name = "ollie-tools";
      paths = [
		tmux
		fd
		ripgrep
		fzf
        zsh-completions
        neovim
        nodejs_23
		starship
      ];
    };
  };
}
