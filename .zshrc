export PATH=$PATH:/usr/local/bin
export EDITOR=nvim

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

if [[ -o interactive ]] && [ -z "$TMUX" ]; then
  tmux attach || tmux new
fi
alias tn='tmux new-session -s'
alias tl='tmux ls'
alias ta='tmux a'
alias tk='tmux kill-ses -t'
alias tks='tmux kill-server'
