source ~/.asdf/asdf.fish

alias om="overmind"
alias ber="bundle exec ruby"

set -x ASYNC_TS_CHECK true
set -gx VOLTA_HOME "$HOME/.volta"
set -gx PATH "$VOLTA_HOME/bin" $PATH

starship init fish | source

