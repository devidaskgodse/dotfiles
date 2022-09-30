# Created for zsh version 5.8
# Dependancies for this config
# sudo apt install fzf lf 
# git clone https://github.com/zdharma-continuum/fast-syntax-highlighting
# git clone --depth=1 https://github.com/wting/autojump/ ~/.zsh/autojump/
# git clone --depth=1 https://github.com/zsh-users/zsh-autosuggestions/ ~/.zsh/zsh-autosuggestions/
# touch "$HOME/.cache/zshhistory

# Enable colors and change prompt:
autoload -U colors && colors
PS1="%B%{$fg[red]%}%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$reset_color%} >%b "
#PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "

setopt autocd		# Automatically cd into typed directory.
setopt interactive_comments

# Custom Variables
EDITOR='nvim'
READER='evince'
VISUAL='subl'
alias grep='grep --color=auto'
alias ls='ls -a --color=always'
alias v='nvim'
# import aliases when available
[ -f ~/.aliasrc ] && source ~/.aliasrc

# History in cache directory:
HISTSIZE=10000000
SAVEHIST=10000000
HISTFILE=~/.cache/zshhistory
setopt appendhistory

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)               # Include hidden files.

[ -f ~/.funcrc ] && source ~/.funcrc

# Use lf to switch directories and bind it to ctrl-o
# require lf: A terminal file manager
lfcd () {
    tmp="$(mktemp)"
    lf -last-dir-path="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        rm -f "$tmp" >/dev/null
        [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
    fi
}
bindkey -s '^o' 'lfcd\n'

# open file by searching for text in it
# require silversearcher-ag neovim fzf
egf() {
    local file
    local line
    read -r file line <<<"$(ag $ | fzf -0 -1 | awk -F: '{print $1, $2}')"
    if [[ -n $file ]]
    then
    vim +$line $file
    fi
}
bindkey -s '^e' 'egf\n'

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/devidas/conda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "$HOME/conda3/etc/profile.d/conda.sh" ]; then
        . "$HOME/conda3/etc/profile.d/conda.sh"
    else
        export PATH="$HOME/conda3/bin:$PATH"
    fi
fi
#unset __conda_setup
# <<< conda initialize <<<
# exports
export FZF_DEFAULT_OPTS="--layout=reverse --height=40% --preview='less {}'"
export PATH=$PATH:$HOME/bin
#export PATH=$PATH:/usr/local/MATLAB/R2021a/bin
export PATH=$PATH:$HOME/miniconda3/bin
# sourcing fuzzy file finder if exists
#[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# source plugins; should be last
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
