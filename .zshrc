autoload -Uz colors
colors


# からふるぷろんぷとくん
PROMPT=$'%{\e[38;5;46m%}%n%{\e[m%}%{\e[38;5;226m%}@%m%{\e[m%} %{\e[38;5;45m%}[%D]%{\e[m%} %{\e[38;5;201m%}{%*}%{\e[m%} %{\e[38;5;208m%}(%~)%{\e[m%}
%{\e[38;5;27m%}%#%{\e[m%}'
RPROMPT=$'%{\e[38;5;249m%}[%~]%{\e[m%}'
setopt histignorealldups sharehistory

# キーバインドemacs 
bindkey -e

# ヒストリ１０まん
HISTSIZE=100000
SAVEHIST=100000
HISTFILE=~/.zsh_history

autoload -Uz compinit
compinit

# 設定いろいろ
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



# おれおれえいりあす
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


# cdしたらpushしたいまん
setopt auto_pushd
setopt pushd_ignore_dups

# ひすとりおぷしょん
setopt share_history
setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt hist_reduce_blanks
setopt extended_glob
bindkey '^R' history-incremental-pattern-search-backward

export EDITOR="usr/bin/emacs -nw"
