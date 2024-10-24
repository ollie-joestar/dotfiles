# Set up the prompt

autoload -Uz promptinit
promptinit
#prompt adam1
PROMPT='%B%(?.%F{green}Joestar.%F{red}XxXxXxX)%f%b %B%F{4}%1~%f%b '

setopt histignorealldups sharehistory

# Use emacs keybindings even if our EDITOR is set to vi
bindkey -e

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

# Use modern completion system
autoload -Uz compinit
compinit

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi
alias ccc='cc -Wall -Wextra -Werror -g'
alias ccx='cc -lmlx -lXext -lX11 -lm -Wall -Wextra -Werror -g'
alias lock='ft_lock'
alias vgf='valgrind -s --leak-check=full --show-leak-kinds=all --trace-children=yes --track-fds=yes'
alias 42free='bash /home/oohnivch/.scripts/42free.sh'
alias rustgrade='git commit --allow-empty -m "grademe" && git push'
#alias nvim='flatpak run io.neovim.nvim'
export PATH=/home/oohnivch/.local/funcheck/host:$PATH
export PATH=$HOME/.brew/bin:$PATH
source <(fzf --zsh)
export CARGO_HOME=/sgoinfre/$USER/rust
export HOME_MAX_SIZE=5
export SGOINFRE_MAX_SIZE=30
export SGOINFRE='/sgoinfre/goinfre/Perso/oohnivch'
export RUSTUP_HOME=/sgoinfre/oohnivch/.rustup

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
