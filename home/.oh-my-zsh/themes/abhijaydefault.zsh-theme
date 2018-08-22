local ret_status="%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ )"
PROMPT='%{$fg[cyan]%}%c$(git_prompt_info) ${ret_status}%{$reset_color%}'
RPROMPT='%F{240}[%*]%{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX=" %{$fg[blue]%}[%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}]%{$fg_bold[yellow]%}*"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%}]"
