# If not running interactively, don't do anything
[[ $- != *i* ]] && return

[ -r /usr/share/bash-completion/bash_completion ] && . /usr/share/bash-completion/bash_completion

# Change the window title of X terminals
case ${TERM} in
	xterm*|rxvt*|Eterm*|aterm|kterm|gnome*|interix|konsole*)
		PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/\~}\007"'
		;;
	screen*)
		PROMPT_COMMAND='echo -ne "\033_${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/\~}\033\\"'
		;;
esac

use_color=true

#alias cp="cp -i"                          # confirm before overwriting something
#alias np='nano -w PKGBUILD'
alias df='df -h'                          # human-readable sizes
alias free='free -m'                      # show sizes in MB
alias more=less
alias clipboard='xclip -selection clipboard'
alias kk="ls -lah --color=auto"
alias ll="ls -lah --color=auto"
alias cd..="cd .."
alias ..="cd .."
alias ...="cd ../../"

# Grants local root applications permission to open GUI windows on your X display.
# Prevents "cannot open display" errors when launching graphical tools with sudo.
xhost +local:root > /dev/null 2>&1

# Bash won't get SIGWINCH if another process is in the foreground.
# Enable checkwinsize so that bash will check the terminal size when
# it regains control.  #65623
# http://cnswww.cns.cwru.edu/~chet/bash/FAQ (E11)
shopt -s checkwinsize
# Enable history appending instead of overwriting.  #139609
shopt -s histappend
shopt -s expand_aliases

# to be able to i-search in bash history with Ctrl-S
set stty -ixon

# Source goto
[[ -s "/usr/local/share/goto.sh" ]] && source /usr/local/share/goto.sh
# Use fzf to replace ctrl-r/ctrl-s for command line history searchk
source <(fzf --bash)

# For NPM
export PATH="$HOME/.npm-global/bin:$PATH"

# Set Starship as prompt, use ~/.config/starship.toml to configure
eval "$(starship init bash)"
