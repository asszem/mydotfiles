#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Always start interactive shells in WSL home, not Windows-mounted paths
if [[ $PWD == /mnt/* ]]; then
  cd "$HOME"
fi

alias cd..="cd .."
alias ..="cd .."
alias ...="cd ../../"
alias cd-="cd -"
alias back="cd -"
alias cd--="cd --"
alias dir="ls -la"
alias dirs="dirs -v"
alias p="pushd"
alias po="popd"
alias cls="clear"
alias grep="grep --color=auto"
alias ls="ls --color=auto"
alias ll="ls -la"
alias lt="ll -lath"
alias lth="ll -lath | head"
alias kk="ll -lath"
alias kh="ll -lath | head"



PS1='[\u@\h \W]\$ '
export OPENCLAW_WORKSPACE="$HOME/.openclaw/workspace"
alias cworkspace="cd \"$OPENCLAW_WORKSPACE\""
alias klaw="openclaw tui"

# ---- OpenKlaw prompt ----
# Colors
cyan='\[\e[0;36m\]'
green='\[\e[0;32m\]'
yellow='\[\e[0;33m\]'
red='\[\e[0;31m\]'
reset='\[\e[0m\]'

# Git branch helper
git_branch() {
  local b
  b=$(git rev-parse --abbrev-ref HEAD 2>/dev/null) || return
  echo "${red}(${b})${reset}"
}

# Prompt: user@host [time] dir (git)
export PS1="${cyan}\u${reset}@${green}\h${reset} ${yellow}[\A]${reset} ${cyan}\w${reset} \$(git_branch)\\n\$ "
# ---- end OpenKlaw prompt ----


# ---- OpenKlaw prompt v2 (one-line with time) ----
# Reuse git_branch if defined; define if missing
if ! declare -f git_branch >/dev/null 2>&1; then
  red='\[\e[0;31m\]'
  reset='\[\e[0m\]'
  git_branch() {
    local b
    b=$(git rev-parse --abbrev-ref HEAD 2>/dev/null) || return
    echo "${red}(${b})${reset}"
  }
fi

cyan='\[\e[0;36m\]'
green='\[\e[0;32m\]'
yellow='\[\e[0;33m\]'
reset='\[\e[0m\]'

# One-line: [HH:MM] user@host path (git)$
export PS1="${yellow}[\A]${reset} ${cyan}\u${reset}@${green}\h${reset} ${cyan}\w${reset} \$(git_branch)\$ "
# ---- end OpenKlaw prompt v2 ----

# Set blinking block cursor if terminal supports it
echo -ne '\e[1 q'
export PATH="$HOME/.local/bin:$PATH"

# ---- OpenKlaw prompt v3: git branch + status (simple, all green) ----
# git_info prints branch name and status symbols, no colors.
git_info() {
  git rev-parse --is-inside-work-tree >/dev/null 2>&1 || return

  local branch dirty ahead behind marks=""

  branch=$(git rev-parse --abbrev-ref HEAD 2>/dev/null) || return

  # Dirty (uncommitted changes)?
  if ! git diff --quiet 2>/dev/null || ! git diff --cached --quiet 2>/dev/null; then
    dirty="*"
  fi

  # Ahead/behind remote if it exists
  if git rev-parse @{u} >/dev/null 2>&1; then
    local ab
    ab=$(git rev-list --left-right --count HEAD...@{u} 2>/dev/null || echo "")

    if [ -n "${ab}" ]; then
      ahead=${ab%% *}
      behind=${ab##* }

      # Ensure ahead/behind are integers
      case "${ahead}" in
        ''|*[!0-9]*) ahead=0 ;;
      esac
      case "${behind}" in
        ''|*[!0-9]*) behind=0 ;;
      esac

      if [ "${ahead}" -gt 0 ]; then
        marks+="↑${ahead}"
      fi
      if [ "${behind}" -gt 0 ]; then
        [ -n "${marks}" ] && marks+=" "
        marks+="↓${behind}"
      fi
    fi
  fi

  [ -n "${dirty}" ] && marks="${dirty}${marks:+ ${marks}}"

  if [ -n "${marks}" ]; then
    printf '%s %s' "${branch}" "${marks}"
  else
    printf '%s' "${branch}"
  fi
}

# Colors for prompt
yellow='\[\e[0;33m\]'
cyan='\[\e[0;36m\]'
green='\[\e[0;32m\]'
reset='\[\e[0m\]'

# Simple one-line prompt: [HH:MM] user@host path (branch [* ↑N ↓M])$
export PS1="${yellow}[\A]${reset} ${cyan}\u${reset}@${green}\h${reset} ${cyan}\w${reset} ${green}(\$(git_info))${reset}\$ "
# ---- end OpenKlaw prompt v3 ----

# Source goto
[[ -s "/usr/local/share/goto.sh" ]] && source /usr/local/share/goto.sh

