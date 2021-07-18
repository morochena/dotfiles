source ~/.asdf/asdf.fish

alias om="overmind"
alias ber="bundle exec ruby"
alias vim="nvim"

set -x ASYNC_TS_CHECK true

starship init fish | source

set -gx VOLTA_HOME "$HOME/.volta"
set -gx PATH "$VOLTA_HOME/bin" $PATH
