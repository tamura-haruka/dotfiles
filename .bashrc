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
alias ii='open'

alias cat='cat -ns'
alias cl='clear'

alias n='nvim'

alias l="git log --graph --all --pretty=format:'%x09%C(#919191)%ad%x09%C(ul)%C(#ff0059)%h%Creset %x09%s%x09%C(auto)%d' --date=format-local:'%Y/%m/%d/ %H:%M:%S'"
alias gl="git log --all --pretty=format:'%C(auto)%H%x09%d%n%C(#919191)author : %an%n%C(#919191)date : %ad%n%n%C(bold)%s%n%n%b' --date=format-local:'%Y/%m/%d %H:%M:%S'"
alias ga='git add'
alias gc='git commit'
alias gp='git push origin main'
alias gpl='git pull'
alias gch='git checkout'
alias gb='git branch'
alias gs='git status'
alias gd='git diff'

alias bud='brew update'
alias bug='brew upgrade'
alias bin='brew install'
alias bse='brew search'

alias prc='cd ~/project/c'
alias cma='cd ~/project/c/Main-AI'
alias alp='cd ~/project/c/alpha'
alias cdf='cd ~/project/c/diffusion'
alias trr='cd ~/tex/research/regular_report'
alias dot='cd ~/dotfiles'
alias neo='cd ~/neorg'
alias noe='cd ~/neorg'

#環境変数
export EDITOR=nvim
export HISTCONTROL=ignoredups
export STARSHIP_CONFIG=~/.config/starship/starship.toml

bind 'set completion-ignore-case on'

PS1="\n\e[1;34m\w \e[1;33m[\e[1;37m\t\e[1;33m] \n\e[1;31m>\e[0;0m "

eval "$(starship init bash)"
eval "$(gh completion -s bash)"
