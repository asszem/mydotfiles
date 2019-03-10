#.bashrc for Windows
# prompt settings for Git Bash is in file 'git-promt.sh' located in 'C:\Program Files\Git\etc\profile.d'


#http://blog.albertarmea.com/post/115102365718/using-gvim-from-git-bash

alias view='/c/Program\ Files\ \(x86\)/Vim/vim80/gvim.exe -R'
#alias vim='/c/Program\ Files\ \(x86\)/Vim/vim80/gvim.exe'

alias gvimdiff='/c/Program\ Files\ \(x86\)/Vim/vim80/gvim.exe -d'
#alias vimdiff='/c/Program\ Files\ \(x86\)/Vim/vim80/gvim.exe -d'

alias gvim='/c/Program\ Files\ \(x86\)/Vim/vim80/gvim.exe'
#alias gvim='C:\Program Files (x86)\Vim\vim80\gvim.exe'

alias cd..="cd .."
alias cd-="cd -"
alias back="cd -"
alias cd--="cd --"
alias dir="ls -la"
alias dirs="dirs -v"
alias p="pushd"
alias po="popd"

source ~/goto/goto.bash

#  SETUP CONSTANTS
#Source:
#https://gist.github.com/nbrew/9278728

# Reset
Color_Off="\[\033[0m\]"       # Text Reset

# Regular Colors
Black="\[\033[0;30m\]"        # Black
Red="\[\033[0;31m\]"          # Red
Green="\[\033[0;32m\]"        # Green
Yellow="\[\033[0;33m\]"       # Yellow
Blue="\[\033[0;34m\]"         # Blue
Purple="\[\033[0;35m\]"       # Purple
Cyan="\[\033[0;36m\]"         # Cyan
White="\[\033[0;37m\]"        # White

# Bold
BBlack="\[\033[1;30m\]"       # Black
BRed="\[\033[1;31m\]"         # Red
BGreen="\[\033[1;32m\]"       # Green
BYellow="\[\033[1;33m\]"      # Yellow
BBlue="\[\033[1;34m\]"        # Blue
BPurple="\[\033[1;35m\]"      # Purple
BCyan="\[\033[1;36m\]"        # Cyan
BWhite="\[\033[1;37m\]"       # White

# Underline
UBlack="\[\033[4;30m\]"       # Black
URed="\[\033[4;31m\]"         # Red
UGreen="\[\033[4;32m\]"       # Green
UYellow="\[\033[4;33m\]"      # Yellow
UBlue="\[\033[4;34m\]"        # Blue
UPurple="\[\033[4;35m\]"      # Purple
UCyan="\[\033[4;36m\]"        # Cyan
UWhite="\[\033[4;37m\]"       # White

# Background
On_Black="\[\033[40m\]"       # Black
On_Red="\[\033[41m\]"         # Red
On_Green="\[\033[42m\]"       # Green
On_Yellow="\[\033[43m\]"      # Yellow
On_Blue="\[\033[44m\]"        # Blue
On_Purple="\[\033[45m\]"      # Purple
On_Cyan="\[\033[46m\]"        # Cyan
On_White="\[\033[47m\]"       # White

# High Intensty
IBlack="\[\033[0;90m\]"       # Black
IRed="\[\033[0;91m\]"         # Red
IGreen="\[\033[0;92m\]"       # Green
IYellow="\[\033[0;93m\]"      # Yellow
IBlue="\[\033[0;94m\]"        # Blue
IPurple="\[\033[0;95m\]"      # Purple
ICyan="\[\033[0;96m\]"        # Cyan
IWhite="\[\033[0;97m\]"       # White

# Bold High Intensty
BIBlack="\[\033[1;90m\]"      # Black
BIRed="\[\033[1;91m\]"        # Red
BIGreen="\[\033[1;92m\]"      # Green
BIYellow="\[\033[1;93m\]"     # Yellow
BIBlue="\[\033[1;94m\]"       # Blue
BIPurple="\[\033[1;95m\]"     # Purple
BICyan="\[\033[1;96m\]"       # Cyan
BIWhite="\[\033[1;97m\]"      # White

# High Intensty backgrounds
On_IBlack="\[\033[0;100m\]"   # Black
On_IRed="\[\033[0;101m\]"     # Red
On_IGreen="\[\033[0;102m\]"   # Green
On_IYellow="\[\033[0;103m\]"  # Yellow
On_IBlue="\[\033[0;104m\]"    # Blue
On_IPurple="\[\033[10;95m\]"  # Purple
On_ICyan="\[\033[0;106m\]"    # Cyan
On_IWhite="\[\033[0;107m\]"   # White

# Various variables you might want for your PS1 prompt instead
Time12h="\T"
Time12a="\@"
PathShort="\w"
PathFull="\W"
NewLine="\n"
Jobs="\j"

#Sample prompt setup
#https://serverfault.com/questions/148209/whats-wrong-with-this-bash-prompt
#COLOR1="\[\e[1;32m\]"
#COLOR2='\[\e[1;1m\]'
#COLOR3='\[\e[m\]'
#GIT_STATUS=$(__git_ps1 " %s")
#PROMPT_CHAR="$"
#
#PROMPT="${COLOR1}\u@\h${COLOR3} \w${COLOR2}${GIT_STATUS} ${COLOR2}${PROMPT_CHAR} ${COLOR3}"
#PS1="$PROMPT"
#export PS1




#shopt -s promptvars
#export GIT_PS1_SHOWDIRTYSTATE=1
#export GIT_PS1_SHOWUPSTREAM='verbose git'
#export PS1='\[\033[1;36m\]\[\033[0m\]\[\033[1;34m\]\w\[\033[0m\] 
#\[\033[1;32m\]$(__git_ps1)\[\033[0m\]\$ '


#https://makandracards.com/makandra/1090-customize-your-bash-prompt
#export PS1='\[\e[14;33;41m\]alma$(__git_ps1 "%s")\[\e[0m\]'

export GIT_PS1_SHOWDIRTYSTATE=1
export GIT_PS1_SHOWCOLORHINTS=1
export GIT_PS1_SHOWUNTRACKEDFILES=1

#export PROMPT_COMMAND=' __git_ps1 "\n[\e[33;47m][[\e[m]\A [\e[31m]\u[\e[m]@[\e[32m]\h [\e[34;01m]\l[\e[m] [\e[36m]\w[\e[m]" "[\e[33m]][\e[m]\n$ "'

#export PROMPT_COMMAND=' __git_ps1 "\n[\e[30;47m] --[[\e[m]\A [\e[31m]\u[\e[m]@[\e[32m]\h [\e[34;01m]\l[\e[m] [\e[36m]\w[\e[m]" "[\e[33m]][\e[m]$ "'
#export PROMPT_COMMAND="$PS1$" '[\e[30;47m]korte\n'


unset TMP
unset TEMP

