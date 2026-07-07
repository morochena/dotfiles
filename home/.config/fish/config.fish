# Homebrew — puts brew-installed tools (incl. mise) on PATH
/opt/homebrew/bin/brew shellenv fish | source

mise activate fish | source

if status is-interactive
    # Commands to run in interactive sessions can go here
end

starship init fish | source
zoxide init fish | source
direnv hook fish | source

# Machine-local secrets (NOT committed to git). See secrets.fish.example
test -f ~/.config/fish/secrets.fish; and source ~/.config/fish/secrets.fish
