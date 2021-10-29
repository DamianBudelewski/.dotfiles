# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
DISABLE_MAGIC_FUNCTIONS=true
export ZSH=$HOME/.oh-my-zsh
export DOTFILES=$HOME/.dotfiles
#
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

ZSH_THEME="robbyrussell"

plugins=(git docker zsh-autosuggestions kubectl)

source $ZSH/oh-my-zsh.sh

eval "$(zoxide init zsh)"

# Aliases
alias k=kubectl
alias d=docker
alias s=ssh

# blank aliases
typeset -a baliases
baliases=()
balias() {
  alias $@
  args="$@"
  args=${args%%\=*}
  baliases+=(${args##* })
}

# ignored aliases
alias -g L='| less'
alias -g G='| grep'
expand-alias-space() {
  [[ $LBUFFER =~ "\<(${(j:|:)baliases})\$" ]]; insertBlank=$?
  if [[ ! $LBUFFER =~ "ls" && ! $LBUFFER =~ "l" && ! $LBUFFER =~ "grep" && ! $LBUFFER =~ "curl" ]]; then
    zle _expand_alias
  fi
  zle self-insert
  if [[ "$insertBlank" = "0" ]]; then
    zle backward-delete-char
  fi
}

zle -N expand-alias-space

bindkey " " expand-alias-space
bindkey -M isearch " " magic-space
bindkey '^ ' forward-word

# pyenv
export PATH="$HOME/.pyenv/bin:$PATH"
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

export PATH=/opt/homebrew/bin:$PATH
autoload bashcompinit && bashcompinit
complete -C '/opt/homebrew/bin/aws_completer' aws

source <(kubectl completion zsh)



# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/damian/opt/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/damian/opt/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/damian/opt/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/damian/opt/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

source /opt/homebrew/opt/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /opt/homebrew/bin/terraform terraform

eval "$(direnv hook zsh)"
export PATH="/opt/homebrew/opt/node@14/bin:$PATH"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

autoload -U +X bashcompinit && bashcompinit
source ~/.azure/az.completion

source $HOME/.zsh_profile
