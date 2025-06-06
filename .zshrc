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

export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad

alias ls='ls --color=auto'
if [[ "$(uname)" == "Darwin" ]]; then
	alias ls='ls -G'
fi
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

alias ccc='cc -Wall -Wextra -Werror -g'
alias ccx='cc -lmlx -lXext -lX11 -lm -Wall -Wextra -Werror -g'
alias vgf='valgrind -s --leak-check=full --show-leak-kinds=all --trace-children=yes --track-fds=yes'
alias vg='valgrind'
alias ga='git add'
alias gc='git commit'
alias gcm='git commit -m'
alias gco='git checkout'
alias gp='git pull'
alias gps='git push'
alias gst='git status'
alias mlx='git clone https://github.com/42Paris/minilibx-linux mlx'
alias dis='open -a XQuartz && export DISPLAY=:0 && xhost +'

export PATH=$HOME/.brew/bin:$PATH
export PATH=$HOME/.cargo/bin:$PATH
export PATH="$HOME/Library/Python/3.9/bin/:$PATH"
export EDITOR=nvim

export TERM=xterm-256color
if [ -z "$DISPLAY" ]; then
    export DISPLAY=localhost:0
fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

if [[ "$(uname)" == "Darwin" ]] && [[ -x /opt/homebrew/bin/brew ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi
eval "$(starship init zsh)"
# The following lines have been added by Docker Desktop to enable Docker CLI completions.
fpath=(/Users/olliejoestar/.docker/completions $fpath)
autoload -Uz compinit
compinit
# End of Docker CLI completions
