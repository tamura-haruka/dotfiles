set -o vi

#エイリアス
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

alias log="git log --graph --all --pretty=format:'%x09%C(#919191)%ad%x09%C(ul)%C(#ff0059)%h%Creset %x09%s%x09%C(auto)%d' --date=format-local:'%Y/%m/%d/ %H:%M:%S'"
alias gad='git add'
alias gcm='git commit'
alias gps='git push origin main'
alias gpl='git pull'
alias gch='git checkout'
alias gbr='git branch'
alias gst='git status'
alias gdf='git diff'

alias bud='brew update'
alias bug='brew upgrade'
alias bin='brew install'
alias bse='brew search'

alias prc='cd ~/project/c'
alias cma='cd ~/project/c/Main-AI'
alias alp='cd ~/project/c/alpha'
alias trr='cd ~/tex/research/regular_report'
alias dot='cd ~/dotfiles'

#環境変数
export EDITOR=nvim
export HISTCONTROL=ignoredups

bind 'set completion-ignore-case on'

PS1="\n\e[1;34m\w \e[1;33m[\e[1;37m\t\e[1;33m] \n\e[1;31m>\e[0;0m "

eval "$(starship init bash)"
