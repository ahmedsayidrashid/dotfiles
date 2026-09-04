# Dotfiles

Personal dotfiles, managed with [GNU Stow](https://www.gnu.org/software/stow/).

Each top-level directory is a Stow "package" whose internal path mirrors
`$HOME`, so stowing a package symlinks its files into place:

| Package  | Symlinked to                    |
| -------- | -------------------------------- |
| `bash`   | `~/.bashrc`                       |
| `cursor` | `~/.cursor/...`                   |
| `git`    | `~/.gitconfig`                    |
| `kitty`  | `~/.config/kitty/...`             |
| `zsh`    | `~/.zshrc`                         |

## Installation

1. Install GNU Stow:

   ```sh
   sudo apt install stow      # Debian/Ubuntu
   brew install stow          # macOS
   ```

2. Clone this repo:

   ```sh
   git clone <repo-url> ~/gitwork/dotfiles
   cd ~/gitwork/dotfiles
   ```

3. Symlink the dotfiles into your home directory with Stow. The `-t ~`
   flag tells Stow to create the symlinks relative to your home directory:

   ```sh
   # Stow a single package
   stow -t ~ zsh

   # Stow everything at once
   stow -t ~ bash cursor git kitty zsh
   ```

   Useful variations:

   ```sh
   stow -n -v -t ~ zsh     # dry run: show what would be linked, without doing it
   stow -R -t ~ zsh        # re-stow: refresh symlinks after adding/removing files
   stow -D -t ~ zsh        # unstow: remove the symlinks for a package
   ```

## Usage

Instead of stowing packages by hand, run the bundled sync script from the
repo root. It auto-discovers every package directory and (re-)stows all of
them into `$HOME` in one go, so it's safe to re-run any time you add,
remove, or change a dotfile:

```sh
./sync.sh
```

To sync into a different target directory (e.g. for testing), pass it as
an argument:

```sh
./sync.sh /path/to/target
```
