# dotfiles

Personal config, managed with [GNU stow](https://www.gnu.org/software/stow/) via
a small wrapper script (`dot`). Each top-level directory is a **package** whose
contents mirror your home directory. For example:

```
fish/.config/fish/config.fish   ->   ~/.config/fish/config.fish
git/.gitconfig                  ->   ~/.gitconfig
zsh/.zshrc                      ->   ~/.zshrc
```

`dot install` symlinks these into place, so editing a file here or at its
home-directory location is editing the same file.

## Packages

| Package    | What it configures                                  |
|------------|-----------------------------------------------------|
| `fish`     | Fish shell (`config.fish`)                           |
| `zsh`      | Zsh login/interactive (`.zprofile`, `.zshrc`)       |
| `git`      | Git (`.gitconfig`, global `ignore`)                 |
| `nvim`     | Neovim (LazyVim)                                     |
| `cmux`     | cmux terminal multiplexer                           |
| `btop`     | btop system monitor                                 |
| `mise`     | mise tool/runtime versions                          |
| `gh`       | GitHub CLI (`config.yml` only)                      |
| `opencode` | opencode skills + package manifest                  |

## Setup on a new machine

```sh
git clone git@github.com:morochena/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
./dot install            # installs stow if missing, then symlinks everything
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
dot install [pkg...]     # symlink packages into $HOME (default: all)
dot uninstall [pkg...]   # remove a package's symlinks
dot restow [pkg...]      # re-link after adding/moving files
dot list                 # list packages
```

## Secrets & machine-local files

Nothing sensitive is committed. These live only on each machine and are
gitignored: `secrets.fish`, `fish_variables`, `gh/hosts.yml`,
`containers/auth.json`, and `opencode/node_modules`.

To track a new secret, add it to `~/.config/fish/secrets.fish` (sourced
automatically by `config.fish` if present) and document it in
`secrets.fish.example`.
