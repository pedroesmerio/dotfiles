#  My Personal aliases
alias fishconfig="vim ~/.config/fish/config.fish"
alias zshconfig="vim ~/.zshrc"
alias tmuxconfig="vim ~/.tmux.conf.local"
alias vimconfig="vim ~/.vimrc"
alias omzconfig="vim ~/.oh-my-zsh"
alias mongoconfig="vim /etc/mongod.conf"
alias mux="tmuxinator"
alias cl="clear"
alias cdh="clear && cd ~"
alias ks="tmux kill-server"

function on_exit --on-event fish_exit
    echo fish is now exiting
end

export EDITOR='vim'

# ~/.config/fish/config.fish

starship init fish | source
