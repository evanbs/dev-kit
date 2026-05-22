FROM mcr.microsoft.com/devcontainers/base:debian

ARG DEBIAN_FRONTEND=noninteractive

# Core tools + Node.js (via NodeSource) para httpyac, claude e kiro no build
RUN apt-get update && apt-get install -y --no-install-recommends \
    curl \
    wget \
    git \
    jq \
    ripgrep \
    fzf \
    bat \
    unzip \
    ca-certificates \
    gnupg \
    lsb-release \
    xclip \
    git-delta \
    p7zip-full \
    && curl -fsSL https://deb.nodesource.com/setup_lts.x | bash - \
    && apt-get install -y --no-install-recommends nodejs \
    && rm -rf /var/lib/apt/lists/*

# bat: symlink resiliente — Debian instala como batcat em algumas versões
RUN command -v bat >/dev/null 2>&1 || ln -sf /usr/bin/batcat /usr/local/bin/bat

# eza — binário direto do release
RUN curl -fsSL \
    "https://github.com/eza-community/eza/releases/latest/download/eza_x86_64-unknown-linux-gnu.tar.gz" \
    | tar xz -C /tmp \
    && mv /tmp/eza /usr/local/bin/eza \
    && chmod +x /usr/local/bin/eza

# AI agents — Claude Code
RUN npm install -g @anthropic-ai/claude-code
# TODO: adicionar Kiro CLI quando disponível no npm (@aws/kiro-cli não existe ainda)

# httpyac
RUN npm install -g httpyac

# starship prompt
RUN curl -sS https://starship.rs/install.sh | sh -s -- --yes

# fnm — gerenciar versões de Node nos projetos
USER vscode
RUN curl -fsSL https://fnm.vercel.app/install | bash -s -- --install-dir "$HOME/.fnm" --skip-shell

# Copiar configs do ambiente
USER root
COPY config/.aliases /etc/profile.d/devbase_aliases.sh
COPY config/.functions /etc/profile.d/devbase_functions.sh
COPY config/.zshrc.append /tmp/.zshrc.append
COPY config/devinfo /usr/local/bin/devinfo
COPY config/devbase-setup /usr/local/bin/devbase-setup
RUN chmod +x /usr/local/bin/devinfo /usr/local/bin/devbase-setup

RUN cat /tmp/.zshrc.append >> /home/vscode/.zshrc \
    && chown vscode:vscode /home/vscode/.zshrc

# starship config (Catppuccin Frappé)
RUN mkdir -p /home/vscode/.config
COPY config/starship.toml /home/vscode/.config/starship.toml
RUN chown -R vscode:vscode /home/vscode/.config

# Diretório para skills compartilhadas (skill tlc-spec-driven e outras)
RUN mkdir -p /home/vscode/.claude/skills \
    && chown -R vscode:vscode /home/vscode/.claude

USER vscode
