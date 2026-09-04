#!/usr/bin/env bash
# Sync all dotfiles packages in this repo into a target directory (default: $HOME)
# using GNU Stow. Safe to re-run at any time.
#
# Usage:
#   ./sync.sh              # stow everything into $HOME
#   ./sync.sh /some/dir     # stow everything into /some/dir instead

set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TARGET="${1:-$HOME}"

if ! command -v stow >/dev/null 2>&1; then
  echo "Error: GNU Stow is not installed." >&2
  echo "Refer to README.md for installation instructions." >&2
  exit 1
fi

cd "$DOTFILES_DIR"

packages=()
for dir in */; do
  pkg="${dir%/}"
  case "$pkg" in
    .git) continue ;;
  esac
  packages+=("$pkg")
done

if [[ ${#packages[@]} -eq 0 ]]; then
  echo "No packages found in $DOTFILES_DIR" >&2
  exit 1
fi

echo "Syncing packages [${packages[*]}] -> $TARGET"
stow -R -v -t "$TARGET" "${packages[@]}"
echo "Done."
