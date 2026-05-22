#!/usr/bin/env bash
set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

link() {
    local src="$1"
    local dst="$2"
    local dst_dir
    dst_dir="$(dirname "$dst")"

    mkdir -p "$dst_dir"

    if [ -e "$dst" ] && [ ! -L "$dst" ]; then
        echo "  backup: $dst → $dst.bak"
        mv "$dst" "$dst.bak"
    fi

    ln -sf "$src" "$dst"
    echo "  linked: $dst"
}

is_devcontainer() {
    [ -f "/.dockerenv" ] || [ -n "${REMOTE_CONTAINERS:-}" ] || [ -n "${CODESPACES:-}" ]
}

echo "→ applying dotfiles from $DOTFILES_DIR"

# Sempre aplica (host + container)
link "$DOTFILES_DIR/starship/starship.toml"  "$HOME/.config/starship.toml"
link "$DOTFILES_DIR/git/.gitconfig"           "$HOME/.gitconfig"
link "$DOTFILES_DIR/aliases/.aliases.local"   "$HOME/.aliases.local"
link "$DOTFILES_DIR/zsh/.zshrc.local"         "$HOME/.zshrc.local"

# Perfil global do Claude Code — vai para ~/.claude/CLAUDE.md
link "$DOTFILES_DIR/.claude/CLAUDE.md"        "$HOME/.claude/CLAUDE.md"

# Scripts de dev — new-project e futuros utilitários
link "$DOTFILES_DIR/bin/new-project"          "$HOME/.local/bin/new-project"

# Só instala ferramentas fora do devcontainer (WSL2 / máquina física)
if ! is_devcontainer; then
    echo "→ host environment detected, installing tools..."

    # zsh + oh-my-zsh
    if [ ! -d "$HOME/.oh-my-zsh" ]; then
        sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
    fi

    # starship
    if ! command -v starship &>/dev/null; then
        curl -sS https://starship.rs/install.sh | sh -s -- --yes
    fi

    # fnm
    if ! command -v fnm &>/dev/null; then
        curl -fsSL https://fnm.vercel.app/install | bash -s -- --install-dir "$HOME/.fnm" --skip-shell
    fi

    echo "→ host tools installed"
fi

echo "✓ dotfiles applied"
