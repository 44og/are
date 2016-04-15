# Set up the prompt

autoload -Uz colors
colors


PROMPT=$'%{\e[38;5;46m%}%n%{\e[m%}%{\e[38;5;226m%}@%m%{\e[m%} %{\e[38;5;45m%}[%D]%{\e[m%} %{\e[38;5;201m%}{%*}%{\e[m%} %{\e[38;5;208m%}(%~)%{\e[m%}
%{\e[38;5;27m%}%#%{\e[m%}'
RPROMPT=$'%{\e[38;5;249m%}[%~]%{\e[m%}'
setopt histignorealldups sharehistory

# Use emacs keybindings even if our EDITOR is set to vi
bindkey -e

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=100000
SAVEHIST=100000
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
zstyle ':completion:*:processes' command 'ps x -o pid,s,args'
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
#Xilinx & Altera settings
export QTS_VER=13.1
export ISE_VER=14.7
export MSA_VER=15.0
export PATH=$PATH:/opt/Xilinx/$ISE_VER/ISE_DS/ISE/bin/lin64/
export PATH=$PATH:/opt/Xilinx/$ISE_VER/ISE_DS/ISE/
export XILINX=/opt/Xilinx/$ISE_VER/ISE_DS/ISE/
export ALTERA=$HOME/altera
export PATH=$PATH:$ALTERA/$QTS_VER/quartus/bin
export PATH=$PATH:$ALTERA/$MSA_VER/modelsim_ae/bin
export PATH=$PATH:$ALTERA/$QTS_VER/quartus/linux64
export ALTERAOCLSDKROOT="/home/yogawa/altera/$QTS_VER/hld"

#Licence settings
##export XILINXD_LICENSE_FILE=2100@172.21.67.183
export LM_LICENSE_FILE=1800@172.21.67.249
##export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/lib
##export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$HOME/altera/$QTS_VER/quartus/linux64



#alias setting
alias ll='ls -alF'
alias la='ls -A'
alias emacsn='emacs -nw'
alias l='ls -CF'
alias sudo='sudo '
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias ls='ls --color=auto'
alias dir='dir --color=auto'
alias vdir='vdir --color=auto'
alias zshrl='source ~/.zshrc'
alias pd='popd'
alias sdhn='sudo shutdown -h now'
alias chrome='google-chrome --disable-new-avatar-menu'


# cd option
setopt auto_pushd
setopt pushd_ignore_dups

# history option
setopt share_history
setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt hist_reduce_blanks
setopt extended_glob
bindkey '^R' history-incremental-pattern-search-backward

# set default editor
export EDITOR="usr/bin/emacs -nw"
