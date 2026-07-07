# dotfiles

Personal config, managed with [GNU stow](https://www.gnu.org/software/stow/) via
a small wrapper script (`dot`).

Everything tracked lives under **`home/`**, which mirrors your home directory
one-to-one:

```
home/.config/fish/config.fish   ->   ~/.config/fish/config.fish
home/.config/nvim/              ->   ~/.config/nvim/
home/.gitconfig                 ->   ~/.gitconfig
home/.zshrc                     ->   ~/.zshrc
```

`dot install` symlinks these into place, so editing a file here or at its
home-directory location is editing the same file. To add something new (e.g.
`~/.agents`), drop it under `home/` at the matching path and run `dot restow`.

Stow runs with `--no-folding`, so it creates real directories and symlinks only
the tracked files. Untracked local files (secrets, caches, machine state) stay
put alongside the symlinks.

## What's tracked

| Path under `home/`       | What it configures                        |
|--------------------------|-------------------------------------------|
| `.config/fish/`          | Fish shell (`config.fish`)                |
| `.zprofile`, `.zshrc`    | Zsh login / interactive                   |
| `.gitconfig`, `.config/git/` | Git config + global ignore            |
| `.config/nvim/`          | Neovim (LazyVim)                          |
| `.config/cmux/`          | cmux terminal multiplexer                 |
| `.config/btop/`          | btop system monitor                       |
| `.config/mise/`          | mise tool/runtime versions               |
| `.config/gh/`            | GitHub CLI (`config.yml` only)           |
| `.config/opencode/`      | opencode skills + package manifest       |

## Setup on a new machine

```sh
git clone git@github.com:morochena/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
brew bundle --file=packages/Brewfile   # install all packages (see below)
./dot install                          # symlink everything into $HOME
```

Then create machine-local secrets (never committed):

```sh
cp ~/.config/fish/secrets.fish.example ~/.config/fish/secrets.fish
$EDITOR ~/.config/fish/secrets.fish
```

Optionally put `dot` on your PATH:

```sh
ln -s ~/.dotfiles/dot ~/.local/bin/dot
```

## Usage

```sh
dot install     # symlink everything under home/ into $HOME
dot uninstall   # remove those symlinks
dot restow      # re-link after adding or moving files
```

## Packages (Homebrew)

`packages/Brewfile` is a [Homebrew Bundle](https://github.com/Homebrew/homebrew-bundle)
manifest of installed taps, formulae, casks, and global npm packages. It is a
manifest, not a dotfile — it is not symlinked.

```sh
brew bundle --file=packages/Brewfile          # install everything listed
brew bundle dump --file=packages/Brewfile --force  # refresh from current system
brew bundle cleanup --file=packages/Brewfile  # (preview) uninstall anything not listed
```

After installing or removing Homebrew packages, re-run the `dump` command and
commit the updated Brewfile.

## Secrets & machine-local files

Nothing sensitive is committed. These live only on each machine and are
gitignored / never moved into the repo: `secrets.fish`, `fish_variables`,
`gh/hosts.yml`, `containers/auth.json`, and `opencode/node_modules`.

To track a new secret, add it to `~/.config/fish/secrets.fish` (sourced
automatically by `config.fish` if present) and document it in
`secrets.fish.example`.
