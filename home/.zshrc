PROMPT="%n %# "
RPROMPT="%~"

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

setopt AUTO_CD

setopt AUTO_PUSHD
setopt PUSHD_IGNORE_DUPS

setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_reduce_blanks

HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000

DIRSTACKSIZE=10
zstyle ':completion:*' menu select
zstyle ':completion:*:cd:*' ignore-parents parent pwd
zstyle ':completion:*:descriptions' format '%BCompleting%b %U%d%u'

# -----------------------------------------------------------------------------

source "$HOME/.homesick/repos/homeshick/homeshick.sh"
fpath=($HOME/.homesick/repos/homeshick/completions $fpath)

[ -f ~/.zshrc.exports ] && source ~/.zshrc.exports

[ -f ~/.zshrc.aliases ] && source ~/.zshrc.aliases

[ -f ~/.zshrc.local ] && source ~/.zshrc.local
