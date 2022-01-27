# Setup fzf
# ---------
if [[ ! "$PATH" == */opt/homebrew/opt/fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/opt/homebrew/opt/fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/opt/homebrew/opt/fzf/shell/completion.zsh" 2> /dev/null

# Color scheme
# ------------
#export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS' --color=fg:-1,bg:-1,hl: --color=fg+:,bg+:,hl+: --color=info:#ebbf46,prompt:#9021ff,pointer:#9021ff --color=marker:,spinner:#9021ff,header:'

export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS' --color=bg+:#f0f0f0,bg:#fafafa,border:#383a42,spinner:#a626a4,hl:#a0a1a7,fg:#383a42,header:#a0a1a7,info:#c18401,pointer:#a626a4,marker:#e45649,fg+:#383a42,prompt:#a626a4,hl+:#a626a4'

# Key bindings
# ------------
source "/opt/homebrew/opt/fzf/shell/key-bindings.zsh"
