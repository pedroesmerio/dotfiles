#  My Personal aliases

alias fishconfig="nvim ~/.config/fish/config.fish"
alias zshconfig="nvim ~/.zshrc"
alias vimconfig="nvim ~/.vimrc"
alias tmuxconfig="nvim ~/.tmux.conf"
alias omzconfig="nvim ~/.oh-my-zsh"
alias mongoconfig="nvim /etc/mongod.conf"
alias mux="tmuxinator"
alias cl="clear"
alias nv="nvim"
alias lv="lvim"
alias cdh="clear && cd ~"
alias ks="tmux kill-server"
alias lg="lazygit"

function on_exit --on-event fish_exit

    echo fish is now exiting
end

export EDITOR='lvim'

starship init fish | source
