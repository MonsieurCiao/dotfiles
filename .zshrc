export PATH=$PATH:/usr/local/bin
export EDITOR=nvim
export XDG_CONFIG_HOME="$HOME/dotfiles/.config"

# zoxide config
eval "$(zoxide init zsh)"


function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	command yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ "$cwd" != "$PWD" ] && [ -d "$cwd" ] && builtin cd -- "$cwd"
	rm -f -- "$tmp"
}
fpath=(~/.zsh/completions $fpath)
autoload -U compinit && compinit

# automatically attach to tmux
# if [[ -o interactive ]] && [ -z "$TMUX" ]; then
#   tmux attach || tmux new
# fi
alias tn='tmux new-session -s'
alias tl='tmux ls'
alias ta='tmux a'
alias tk='tmux kill-ses -t'
alias tks='tmux kill-server'

alias gst='git status'
alias lg='lazygit'
alias ls="eza --icons=auto"
alias tt="taskwarrior-tui"


#history setup
HISTFILE=$HOME/.zhistory
SAVEHIST=1000
HISTSIZE=999
setopt share_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_verify
# completion using arrow keys (based on history)
bindkey '^[[A' history-search-backward
bindkey '^[[B' history-search-forward
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

#ohmyposh
if [ "$TERM_PROGRAM" != "Apple_Terminal" ]; then
  eval "$(oh-my-posh init zsh --config ~/.config/ohmyposh/omp.toml)"
fi
