# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH
# Path to your oh-my-zsh installation.
export ZSH=/Users/abhatnagar/.oh-my-zsh
# Import oh-my-zsh's rc settings separately
source $ZSH/.zshrc_oh-my-zsh

# User configuration

#MITRE Proxy
export HTTP_PROXY=http://gatekeeper.mitre.org:80
export HTTPS_PROXY=http://gatekeeper.mitre.org:80
export http_proxy=http://gatekeeper.mitre.org:80
export https_proxy=http://gatekeeper.mitre.org:80
alias np="unset http_proxy;unset HTTP_PROXY;unset HTTPS_PROXY;unset https_proxy"
alias pp="export http_proxy=http://gatekeeper.mitre.org:80;export http_proxy=https://gatekeeper.mitre.org:80;export HTTP_PROXY=http://gatekeeper.mitre.org:80;export HTTPS_PROXY=http://gatekeeper.mitre.org:80;"

#aliases
alias code='open $@ -a "Visual Studio Code - Insiders"'

#homesick dotfile management
source "$HOME/.homesick/repos/homeshick/homeshick.sh"

# hide vim with 'ctrl-z' (broken?)
foreground-vi() {
  fg %vi
}
zle -N foreground-vi
bindkey '^Z' foreground-vi

# shared cd 'd' history
DIRSTACKSIZE=10
DIRSTACKFILE=~/.zdirs
if [[ -f $DIRSTACKFILE ]] && [[ $#dirstack -eq 0 ]]; then
  dirstack=( ${(f)"$(< $DIRSTACKFILE)"} )
  [[ -d $dirstack[1] ]] && cd $dirstack[1] && cd $OLDPWD
fi
chpwd() {
  print -l $PWD ${(u)dirstack} >$DIRSTACKFILE
}

# custom tab title
title() {
  echo -ne "\033]0;"$*"\007"
}
#DISABLE_AUTO_TITLE="true"

