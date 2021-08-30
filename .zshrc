export ZSH=$HOME/.oh-my-zsh
eval "$(/opt/homebrew/bin/brew shellenv)"

#ZSH_THEME="pygmalion"
ZSH_THEME="agnoster"
# Agnoster Theme Variables
DEFAULT_USER="jeremy_shapiro"

HYPHEN_INSENSITIVE="true"
#ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"
plugins=(git git-open docker tmux brew ruby rails)

# User configuration

export HOMEBREW_NO_ANALYTICS=1
export EJSON_KEYDIR=$HOME/.ssh
export KUBECONFIG=~/.kube/config

## Alias'
alias pgstart='pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start'
alias pgstop='pg_ctl -D /usr/local/var/postgres stop -s -m fast'
alias mode='stat -f %Mp%Lp'
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias icloud='cd ~/Library/Mobile\ Documents/com~apple~CloudDocs/'

## Functions
showcert() {
  openssl s_client -showcerts -servername $1 -connect $1:443
}

source $ZSH/oh-my-zsh.sh

## Fix Num-pad mapping on full-size keyboard
# 0 . Enter
bindkey -s "^[Op" "0"
bindkey -s "^[On" "."
bindkey -s "^[OM" "^M"
# 1 2 3
bindkey -s "^[Oq" "1"
bindkey -s "^[Or" "2"
bindkey -s "^[Os" "3"
# 4 5 6
bindkey -s "^[Ot" "4"
bindkey -s "^[Ou" "5"
bindkey -s "^[Ov" "6"
# 7 8 9
bindkey -s "^[Ow" "7"
bindkey -s "^[Ox" "8"
bindkey -s "^[Oy" "9"
# + -  * /
bindkey -s "^[Ol" "+"
bindkey -s "^[Om" "-"
bindkey -s "^[Oj" "*"
bindkey -s "^[Oo" "/"

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
export HISTTIMEFORMAT="%d.%m.%y %T "

# export NVM_DIR="$HOME/.nvm"
# . "/usr/local/opt/nvm/nvm.sh"
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
export PATH="/usr/local/opt/python/libexec/bin:$PATH"
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# GO Config
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:/usr/local/opt/go/libexec/bin

# Pyenv
eval "$(pyenv init -)"
export PATH="/usr/local/opt/openssl/bin:$PATH"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
