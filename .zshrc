#!/bin/zsh
autoload -Uz colors
colors

if [ -n "$SSH_CONNECTION" ]; then
    export PROMPT=$'%{\e[38;5;244m%}<SSH> %{\e[38;5;70m%}%n%{\e[m%}%{\e[38;5;3m%}@%m%{\e[m%} %{\e[38;5;73m%}[%D]%{\e[m%} %{\e[38;5;209m%}{%*}%{\e[m%} %{\e[38;5;136m%}(%~)%{\e[m%}
%{\e[38;5;32m%}%#%{\e[m%}'
else
    export PROMPT=$'%{\e[38;5;28m%}%n%{\e[m%}%{\e[38;5;142m%}@%m%{\e[m%} %{\e[38;5;6m%}[%D]%{\e[m%} %{\e[38;5;133m%}{%*}%{\e[m%} %{\e[38;5;130m%}(%~)%{\e[m%}
%{\e[38;5;04m%}%#%{\e[m%}'

fi

if [ -e ~/os_info.sh ]; then
    source ~/os_info.sh
fi


#RPROMPT=$'%{\e[38;5;249m%}[%~]%{\e[m%}'
setopt histignorealldups sharehistory


bindkey -e


HISTSIZE=100000
SAVEHIST=100000
HISTFILE=~/.zsh_history

autoload -Uz compinit
compinit

setopt extended_history
setopt append_history
setopt inc_append_history
setopt notify
setopt hist_find_no_dups
setopt complete_in_word

if [ -e /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ];then
  source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
elif [ -e /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ];then
  source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
elif [ -e /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ];then
  source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
elif [ -e ${HOME}/local/src/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ];then
  source  ${HOME}/local/src/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh  
fi

zstyle ':zle:*' word-chars " /=;@:{},|"
zstyle ':zle:*' word-style unspecified

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
#export PATH="$HOME/.rbenv/bin:$PATH"
#eval "$(rbenv init -)"

export PATH=${HOME}/local/bin:$PATH

unalias -m *
alias ll='ls -talFh'
alias la='ls -A'
alias emacs='env TERM=screen emacsclient -c -a -nw""'
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
alias share_dir_mount='sudo mount -t vboxsf vm_share ~/host_share'
#alias cal="/usr/bin/cal | grep -C6 --color '`date +' %-d '`'  "
alias ks='echo "は？"' 
alias pip-all-update="pip list --outdated --format=legacy | awk '{print $1}' | xargs sudo  pip install -U"
alias fuck='echo "ふぁっきゅー"'
alias pbcopy='xclip -selection c'
alias count_file='ls -UF | grep -v / | wc -l'
alias lessf='less -L +F' 

setopt auto_pushd
setopt pushd_ignore_dups

setopt share_history
setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt hist_reduce_blanks
setopt extended_glob
bindkey '^R' history-incremental-pattern-search-backward

export GREP_COLOR="37;45"
export EDITOR="vim"
export http_proxy=""
export https_proxy=""
export ftp_proxy=""
export rsync_proxy=""
export HTTP_PROXY=""
export HTTPS_PROXY=""
export FTP_PROXY=""
export RSYNC_PROXY=""


export TERM=xterm-256color
# プロキシ設定 ==============================================
P_HOST="proxygate2.nic.nec.co.jp"
P_PORT="8080"
# 認証が必要なプロキシの場合
#PROXY="$USERNAME:$PASSWORD@$HOST:$PORT"
# 認証が不要なプロキシの場合
PROXY="$P_HOST:$P_PORT"
# 実際の環境変数の設定
export http_proxy="http://$PROXY"
export https_proxy="http://$PROXY"
export ftp_proxy="http://$PROXY"
export rsync_proxy="http://$PROXY"
export nfs_proxy="localhost:25555"

# 大文字バージョンしか認識しないプログラム用
export HTTP_PROXY="http://$PROXY"
export HTTPS_PROXY="http://$PROXY"
export RSYNC_PROXY="http://$PROXY"
export FTP_PROXY="http://$PROXY"
export NFS_PROXY="localhost:25555"

# プロキシを利用しないアドレスの指定（必須）
export no_proxy="127.0.0.1,localhost"
export NO_PROXY="$no_proxy"
export PYTHONPATH=/usr/local:$PYTHONPATH
export LD_LIBRARY_PATH=/usr/local/lib:$LD_LIBRARY_PATH

export LESS='-iMR'
if [ -e /usr/bin/src-hilite-lesspipe.sh ];then
    export LESSOPEN='| /usr/bin/src-hilite-lesspipe.sh %s'
elif [ -e /usr/share/source-highlight/src-hilite-lesspipe.sh ];then
    export LESSOPEN='| /usr/share/source-highlight/src-hilite-lesspipe.sh %s'
fi

export VISUAL='vim'
stty stop undef

if type cal.rb > /dev/null 2>&1; then
  cal.rb
elif type cal > /dev/null 2>&1; then
  cal
fi
umask 022
export LC_CTYPE='ja_JP.UTF-8'
export LC_ALL='ja_JP.UTF-8'
export LC_MESSAGES='ja_JP.UTF-8'
