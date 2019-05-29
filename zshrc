export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="robbyrussell"

plugins=(git autojump)

source $ZSH/oh-my-zsh.sh

# User configuration

[ -f ~/.ctfrc ] && . ~/.ctfrc
[ -f /usr/share/autojump/autojump.sh ] && . /usr/share/autojump/autojump.sh
[ -f ~/.pythonrc ] && export PYTHONSTARTUP="$HOME/.pythonrc"


export PATH=~/bin:$PATH
export EDITOR=vim
export CLICOLOR=1
export PIN_ROOT="$HOME/bin/pin"


alias ..="cd .."
alias gdb="gdb -q"
alias gdbm="gdb-multiarch -q"
alias pwndbg="gdb -x ~/pwndbg/gdbinit.py"
alias tmux="history -n;tmux -2"
alias strace="strace -ixv"
alias ltrace="ltrace -iC"
alias objdump="objdump -M intel"
alias len="expr length"
alias fuck="killall -9"
alias djson="python -m json.tool"
alias folders="find . -maxdepth 1 -type d -print0 | xargs -0 du -skh | sort -rn"


alias ll='ls -l'
alias la='ls -Ahl'
alias l='ls -CF'
alias rm="rm -i"
alias mv="mv -i"
alias cp="cp -i"


alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'


# Less Colors for Man Pages
export PAGER="$(which less) -s"
export BROWSER="$PAGER"
export LESS='-R'
export LESS_TERMCAP_mb=$'\E[38;5;167m'  # begin blinking
export LESS_TERMCAP_md=$'\E[38;5;39m'   # begin bold
export LESS_TERMCAP_me=$'\E[0m'         # end mode
export LESS_TERMCAP_se=$'\E[38;5;231m'  # end standout-mode
export LESS_TERMCAP_so=$'\E[38;5;167m'  # begin standout-mode - info box
export LESS_TERMCAP_us=$'\E[38;5;167m'  # begin underline
export LESS_TERMCAP_ue=$'\E[0m'         # end underline


# virtualenvwrapper
if [ -f /usr/local/bin/virtualenvwrapper.sh ]; then
    export WORKON_HOME=~/.env
    source /usr/local/bin/virtualenvwrapper.sh
fi


docker-shell()
{
    docker exec -it $1 /bin/bash
}


export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"