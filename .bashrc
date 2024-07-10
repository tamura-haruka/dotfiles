set -o vi

alias rm='rm -r'
alias cp='cp -n'

alias ls='ls -Ahp -G'
alias la='ls -1'
alias ll='ls -og'

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

alias mkdir='mkdir -p'

alias ni='touch'

alias cat='cat -ns'
alias cl='clear'

bind 'set completion-ignore-case on'

#PS1="\n\e[1;36m\w \e[1;33m[\e[1;37m\t\e[1;33m] \n\e[1;31m>\e[0;0m "
PS1="\n\e[1;36m\w \e[1;33m[\e[1;37m\t\e[1;33m] \n\e[1;31m>\e[0;0m "
