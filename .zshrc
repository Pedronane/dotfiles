## menu-style
zstyle ':completion:*' menu select
autoload -Uz compinit && compinit
zstyle ':completion:*' special-dirs true
# case insensitive
zstyle ':completion:*' matcher-list 'm:{a-zA-Z-_}={A-Za-z_-}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
# Tab completion colors monochrome
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS} 'ma=fg=242'
# add new installed packages into completions
zstyle ':completion:*' rehash true
# use completion cache
zstyle ':completion::complete:*' use-cache true

bindkey '^[[Z' reverse-menu-complete
bindkey '^[[A' up-line-or-search
bindkey '^[[B' down-line-or-search
bindkey "^P" up-line-or-search
bindkey "^N" down-line-or-search

setopt PROMPT_PERCENT
setopt PROMPT_SUBST
# history config
HISTSIZE=1000
SAVEHIST=1000
export HISTFILE="$XDG_DATA_HOME"/zsh/history
# share history across multiple zsh sessions
setopt SHARE_HISTORY
# append to history
setopt APPEND_HISTORY
# expire duplicates first
setopt HIST_EXPIRE_DUPS_FIRST
# do not store duplications
setopt HIST_IGNORE_DUPS
#ignore duplicates when searching
setopt HIST_FIND_NO_DUPS
# removes blank lines from history
setopt HIST_REDUCE_BLANKS
# use emacs bindings
set -o vi

PROMPT='%b%F{242}%~ %f
%? %(!.#.>) %f'
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )

zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' stagedstr '%F{250}●%f'
zstyle ':vcs_info:*' unstagedstr '%F{250}●%f'
zstyle ':vcs_info:git:*' formats '[%F{242}%b%f%c%u]'
zstyle ':vcs_info:git:*' actionformats '[%F{242}%b (%a)%f%c%u]'

RPROMPT='$vcs_info_msg_0_'

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# Syntax highlighting monochrome
ZSH_HIGHLIGHT_STYLES[default]='fg=242'
ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=242'
ZSH_HIGHLIGHT_STYLES[reserved-word]='fg=242'
ZSH_HIGHLIGHT_STYLES[alias]='fg=242'
ZSH_HIGHLIGHT_STYLES[context]='fg=242'
ZSH_HIGHLIGHT_STYLES[assign]='fg=242'
ZSH_HIGHLIGHT_STYLES[builtin]='fg=242'
ZSH_HIGHLIGHT_STYLES[command]='fg=242'
ZSH_HIGHLIGHT_STYLES[commandseparator]='fg=242'
ZSH_HIGHLIGHT_STYLES[function]='fg=242'
ZSH_HIGHLIGHT_STYLES[globbing]='fg=242'
ZSH_HIGHLIGHT_STYLES[hash]='fg=242'
ZSH_HIGHLIGHT_STYLES[history-expansion]='fg=242'
ZSH_HIGHLIGHT_STYLES[options]='fg=242'
ZSH_HIGHLIGHT_STYLES[path]='fg=242'
ZSH_HIGHLIGHT_STYLES[path_prefix]='fg=242'
ZSH_HIGHLIGHT_STYLES[path_separator]='fg=242'
ZSH_HIGHLIGHT_STYLES[single-hyphen-option]='fg=242'
ZSH_HIGHLIGHT_STYLES[double-hyphen-option]='fg=242'
ZSH_HIGHLIGHT_STYLES[back-quoted-argument]='fg=242'
ZSH_HIGHLIGHT_STYLES[single-quoted-argument]='fg=242'
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]='fg=242'
ZSH_HIGHLIGHT_STYLES[dollar-double-quoted-argument]='fg=242'
ZSH_HIGHLIGHT_STYLES[command-substitution]='fg=242'
ZSH_HIGHLIGHT_STYLES[back-quoted-argument-unreached]='fg=242'
ZSH_HIGHLIGHT_STYLES[process-substitution]='fg=242'
ZSH_HIGHLIGHT_STYLES[parameter]='fg=242'
ZSH_HIGHLIGHT_STYLES[redirection]='fg=242'
ZSH_HIGHLIGHT_STYLES[comment]='fg=242'

source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
set ZSH_AUTOSUGGEST_USE_ASYNC=true
# Autosuggestions monochrome
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=250'
