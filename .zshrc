export TYPEWRITTEN_PROMPT_LAYOUT="pure"
export TYPEWRITTEN_ARROW_SYMBOL=""
export TYPEWRITTEN_RELATIVE_PATH="home"
export TYPEWRITTEN_COLOR_MAPPINGS="primary:blue"
export TYPEWRITTEN_COLORS="arrow:yellow;symbol:yellow"

plugins=(z git web-search copypath history zsh-interactive-cd zsh-autosuggestions)

ZSH_THEME="af-magic"
export ZSH="$HOME/.oh-my-zsh"
source $ZSH/oh-my-zsh.sh

alias lla='ls -la'
alias llh='ls -lh'
alias sa="gnome-screenshot -a"
alias gb="git branch -vva"
alias gbp="git --no-pager branch -vva"
alias gl="git log"
alias glp="git --no-pager log"
alias dit='git --git-dir=$HOME/.cfg --work-tree=$HOME'
alias dss='dit status -s'

alias nv='nvim'
alias zf='zathura --fork'
alias mb=micromamba

export TERM=xterm-256color

export PATH="$HOME/.local/llvm/bin:$PATH"
export PATH="$PATH:$HOME/.local/go/bin"
export PATH="$PATH:$HOME/.cargo/bin:$HOME/.local/bin"
export PATH="$PATH:$(go env GOPATH)/bin"
export PATH="$PATH:$HOME/.fzf//bin"

export HELIX_RUNTIME="$HOME/.config/helix/runtime"
export EDITOR=nvim
export VISUAL=nvim

# Vim Mode
set -o vi
bindkey -v
export KEYTIMEOUT=2

setopt NO_AUTO_PUSHD

bindkey '^R' history-incremental-search-backward
bindkey '^ ' autosuggest-accept

# fzf
[[ -d ~/.fzf ]] && source ~/.fzf//shell/completion.zsh
[[ -d ~/.fzf ]] && source ~/.fzf//shell/key-bindings.zsh

fpath=(~/.zsh/plugins $fpath)

# before compinit
[[ -f ~/.zsh/completions.zsh ]] && source ~/.zsh/completions.zsh

# Other completions
fpath=(~/.zsh/completions $fpath)
autoload -Uz compinit && compinit
autoload -Uz bashcompinit && bashcompinit
