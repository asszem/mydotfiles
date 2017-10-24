#alias gvim='C:\Program Files (x86)\Vim\vim80\gvim.exe'
#http://blog.albertarmea.com/post/115102365718/using-gvim-from-git-bash
#alias vim='/c/Program\ Files\ \(x86\)/Vim/vim80/gvim.exe'
alias view='/c/Program\ Files\ \(x86\)/Vim/vim80/gvim.exe -R'
#alias vimdiff='/c/Program\ Files\ \(x86\)/Vim/vim80/gvim.exe -d'
alias gvim='/c/Program\ Files\ \(x86\)/Vim/vim80/gvim.exe'
alias gvimdiff='/c/Program\ Files\ \(x86\)/Vim/vim80/gvim.exe -d'
alias cd..="cd .."
alias dir="ls -la"


#shopt -s promptvars
#export GIT_PS1_SHOWDIRTYSTATE=1
#export GIT_PS1_SHOWUPSTREAM='verbose git'
#export PS1='\[\033[1;36m\]\[\033[0m\]\[\033[1;34m\]\w\[\033[0m\] 
#\[\033[1;32m\]$(__git_ps1)\[\033[0m\]\$ '


export GIT_PS1_SHOWDIRTYSTATE=1
export GIT_PS1_SHOWCOLORHINTS=1
export GIT_PS1_SHOWUNTRACKEDFILES=1

#export PROMPT_COMMAND=' __git_ps1 "\n[\e[33m][[\e[m]\A [\e[31m]\u[\e[m]@[\e[32m]\h [\e[34;01m]\l[\e[m] [\e[36m]\w[\e[m]" "[\e[33m]][\e[m]\n$ "'

unset TMP
unset TEMP

