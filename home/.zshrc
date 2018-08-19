PROMPT="%n %# " RPROMPT="%~"

autoload -Uz vcs_info
setopt prompt_subst
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "%F{yellow}!"
zstyle ':vcs_info:git:*' unstagedstr "%F{red}+"
zstyle ':vcs_info:*' formats "%F{green}%c%u[%b]%f"
zstyle ':vcs_info:*' actionformats '[%b|%a]'
precmd () { vcs_info }
RPROMPT=$RPROMPT'${vcs_info_msg_0_}'

autoload -Uz compinit
compinit

bindkey -v
bindkey -M viins 'jj' vi-cmd-mode

setopt auto_cd

setopt auto_pushd
setopt pushd_ignore_dups

setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_ignore_all_dups
setopt hist_reduce_blanks
setopt inc_append_history

HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000

zshaddhistory() {
    local line=${1%%$'\n'}
    local cmd=${line%% *}
    [[ ${cmd} != ls
        && ${cmd} != cd
        && ${cmd} != man
        && ${cmd} != rm
		&& ${cmd} != clear
    ]]
}

DIRSTACKSIZE=10
zstyle ':completion:*' menu select
zstyle ':completion:*:cd:*' ignore-parents parent pwd
zstyle ':completion:*:descriptions' format '%BCompleting%b %U%d%u'
zstyle ':completion:*' matcher-list '' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}'

# -----------------------------------------------------------------------------

source "$HOME/.homesick/repos/homeshick/homeshick.sh"
fpath=($HOME/.homesick/repos/homeshick/completions $fpath)

source /usr/local/opt/asdf/asdf.sh
source /usr/local/opt/asdf/etc/bash_completion.d/asdf.bash

[ -f ~/.zshrc.exports ] && source ~/.zshrc.exports

[ -f ~/.zshrc.aliases ] && source ~/.zshrc.aliases

[ -f ~/.zshrc.local ] && source ~/.zshrc.local
