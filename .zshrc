# Luke's config for the Zoomer Shell

# Enable colors and change prompt:
autoload -U colors && colors
# PS1="%B%{$fgwhite]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[indigo]%}%~%{$fg[white%}]%{$reset_color%}$%b "
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
    # echo "Hi" $(pwd) "HI"
}
setopt PROMPT_SUBST

# PS1="%{%F{yellow}%}%n%{%f%}@%{%F{blue}%}%m %{%F{white}%}%~%{%F{green}%}$%f%}%  "
PROMPT='%(?.%F{green}√.%F{red}?%?)%f %F{cyan}%n@%m%f %F{white}%~%f%F{green}$(parse_git_branch)%f $ '

# autoload -Uz vcs_info
# precmd() { vcs_info }
# Format the vcs_info_msg_0_ variable
# zstyle ':vcs_info:git:*' formats '(%b)'
 
# Set up the prompt (with git branch name)
# setopt PROMPT_SUBST
# PROMPT='%n@%m ${PWD/#$HOME/~} ${vcs_info_msg_0_} $ '
# History in cache directory:
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

# Use lf to switch directories and bind it to ctrl-o
lfcd () {
    tmp="$(mktemp)"
    lf -last-dir-path="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        rm -f "$tmp"
        [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
    fi
}
bindkey -s '^o' 'lfcd\n'

# Load aliases and shortcuts if existent.

source ~/.fzf/shell/completion.zsh
source ~/.fzf/shell/key-bindings.zsh
alias gll="git log --graph --all --decorate"

export PATH=/usr/local/lib/node-v14.17.6-linux-x64/bin:$PATH

alias vi=nvim
alias pb="cd /home/ashfaq/work/platform-service"
alias pf="cd /home/ashfaq/work/platform-web"
alias ebs="vi ~/.bashrc"
alias ezs="vi ~/.zshrc"
alias cal="vi ~/.config/alacritty/alacritty.yml"
alias caw="vi ~/.config/awesome/rc.lua"
alias tm="tmux attach || tmux"
# export FZF_DEFAULT_COMMAND='rg --files --follow --no-ignore-vcs --hidden -g "!{node_modules/*,.git/*}"'
#

cd_fzf() {
    _cd=$(find ~ -type d -iname '*' | fzf)
    if [[ ${#_cd} -ne 0 ]] then
        cd $_cd
        # if [[ $? -eq 0 ]] then
        #     sed -i "$ s/cd_fzf/cd_fzf->$_cd/" ~/.zsh_history
        # fi
    fi
}

# bind '"\C-p": "cd $(find ~ -type d | fzf)"'
bindkey -s '\C-p' 'cd_fzf\n'

# . "$HOME/.cargo/env"
# source ~/.bash_completion/alacritty
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'
autoload -Uz compinit && compinit

# android
export ANDROID_HOME=$HOME/android
export PATH=$ANDROID_HOME/cmdline-tools/tools/bin/:$PATH
export PATH=$ANDROID_HOME/emulator/:$PATH
export PATH=$ANDROID_HOME/platform-tools/:$PATH
# Load zsh-syntax-highlighting; should be last.
source /usr/local/lib/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null

