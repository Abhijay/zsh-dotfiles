#If you come from bash you might have to change your $PATH.
  export PATH=$HOME/bin:/usr/local/bin:$PATH
#Path to your oh-my-zsh installation.
  export ZSH=~/.oh-my-zsh
#Import oh-my-zsh's rc settings separately
  source $ZSH/.zshrc_oh-my-zsh
#Fix Java
  export JAVA_HOME=`/usr/libexec/java_home`

#User configuration

#aliases
  alias code='open $@ -a "Visual Studio Code - Insiders"'
  alias run='python ~/Code/Scripts/run-script.py'
  alias goto='run go-to-dir'
  alias rm='trash'
  alias RM='/bin/rm'
  alias todo='~/code/scripts/todo.rb'
  alias showHidden='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'
  alias hideHidden='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'
  alias ngrok='~/code/scripts/ngrok'
  alias yarn-links='ls -l node_modules | grep ^l'
  alias school='cd ~/School/Berkeley/Spring-2019'
  alias tpad='open $@ -a "Texpad"'
  alias lock='/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend'
  alias devbox='docker run -i -t ethanlee/cs61c-env /bin/bash'
  alias usbdoff='sudo killall -STOP -c usbd'
  alias usbdon'sudo killall -CONT usbd'

#homesick dotfile management
  source "$HOME/.homesick/repos/homeshick/homeshick.sh"

#MITRE Proxy
#  export HTTP_PROXY=http://gatekeeper.mitre.org:80
#  export HTTPS_PROXY=http://gatekeeper.mitre.org:80
#  export http_proxy=http://gatekeeper.mitre.org:80
#  export https_proxy=http://gatekeeper.mitre.org:80
  alias np="unset http_proxy;unset HTTP_PROXY;unset HTTPS_PROXY;unset https_proxy"
  alias pp="export http_proxy=http://gatekeeper.mitre.org:80;export http_proxy=http://gatekeeper.mitre.org:80;export HTTP_PROXY=http://gatekeeper.mitre.org:80;export HTTPS_PROXY=http://gatekeeper.mitre.org:80;"
  alias setJava="export JAVA_OPTS=\"-Dhttp.proxyHost=gatekeeper.mitre.org -Dhttp.proxyPort=80 -Dhttps.proxyHost=gatekeeper.mitre.org -Dhttps.proxyPort=80 -DsocksProxyHost=gatekeeper.mitre.org -DsocksProxyPort=80\""

#Flask
 export FLASK_DEBUG=1

#hide vim with 'ctrl-z' (broken?)
  foreground-vi() {
    fg %vi
  }
  zle -N foreground-vi
  bindkey '^Z' foreground-vi

#shared cd 'd' history
  DIRSTACKSIZE=10
  DIRSTACKFILE=~/.zdirs
  if [[ -f $DIRSTACKFILE ]] && [[ $#dirstack -eq 0 ]]; then
    dirstack=( ${(f)"$(< $DIRSTACKFILE)"} )
    [[ -d $dirstack[1] ]] && cd $dirstack[1] && cd $OLDPWD
  fi
  chpwd() {
    print -l $PWD ${(u)dirstack} >$DIRSTACKFILE
  }

#custom tab title
#title() {
#  echo -ne "\033]0;"$*"\007"
#}
#DISABLE_AUTO_TITLE="true"

setopt +o nomatch

#Vi mode
 bindkey -v

#Remove vim mode delay
 export KEYTIMEOUT=1

#Fix up and down arrow history
  autoload -U history-search-end
  zle -N history-beginning-search-backward-end history-search-end
  zle -N history-beginning-search-forward-end history-search-end
  bindkey "^[[A" history-beginning-search-backward-end
  bindkey "^[[B" history-beginning-search-forward-end

#Fix iPhone charging through disabling usbd
#`sudo killall -STOP -c usbd
