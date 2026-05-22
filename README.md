# dev-kit

Monorepo de infraestrutura de desenvolvimento pessoal.
Centraliza imagem base Docker, dotfiles e templates de devcontainer por stack —
com Claude Code e Kiro CLI integrados por padrão.

## Ecossistema

```
dev-kit/               ← este repo
├── Dockerfile         → ghcr.io/evanbs/devbase:latest
├── config/            → configs baked na imagem (aliases, functions, starship, devinfo)
├── dotfiles/          → aplicado via VSCode dotfiles feature
├── agents/            → CLAUDE.md, AGENTS.md e skill tlc-spec-driven
└── templates/         → devcontainers prontos por stack

wsl2-dotfiles/         ← repo separado (host WSL2)
```

## Templates disponíveis

| Stack | Diretório |
|-------|-----------|
| Node.js + TypeScript | `templates/node/` |
| Bun + TypeScript | `templates/bun/` |
| Python | `templates/python/` |
| .NET (C#) | `templates/dotnet/` |
| Java | `templates/java/` |

Cada template inclui: `.devcontainer/devcontainer.json`, `CLAUDE.md`, `AGENTS.md` e `.kiro/agents/dev.json`.

## Nova máquina

### 1. Host WSL2

```bash
git clone https://github.com/evanbs/wsl2-dotfiles ~/.wsl2-dotfiles
~/.wsl2-dotfiles/install.sh
```

### 2. VSCode dotfiles

Em **Settings → Dotfiles**:
- **Repository:** `evanbs/dev-kit`
- **Install Command:** `dotfiles/install.sh`

Isso cria automaticamente `~/.claude/CLAUDE.md` (perfil global do Claude Code),
symlinks do starship, gitconfig e aliases em qualquer devcontainer.

### 3. Novo projeto

Copie o template da stack desejada para o repositório do projeto:

```bash
cp -r templates/node/ ~/projetos/meu-projeto
cd ~/projetos/meu-projeto
# Abra no VS Code → "Reopen in Container"
```

Dentro do container, `claude` e `kiro-cli` já estão disponíveis.
Rode `initialize project` no Claude Code para criar o `.specs/` com a skill `tlc-spec-driven`.

## Imagem base

A imagem `ghcr.io/evanbs/devbase:latest` é publicada automaticamente via GitHub Actions
a cada push em `main` que altere `Dockerfile` ou `config/**`.

Ferramentas incluídas: `zsh`, `git`, `node`, `eza`, `bat`, `ripgrep`, `fzf`, `jq`, `delta`,
`httpyac`, `starship`, `fnm`, `claude`, `kiro-cli`.

```bash
docker run --rm ghcr.io/evanbs/devbase:latest devinfo
```

## Contexto de agente — três camadas

| Camada | Arquivo | Criado por |
|--------|---------|------------|
| Global | `~/.claude/CLAUDE.md` | `dotfiles/install.sh` via symlink |
| Imagem | `agents/CLAUDE.md` | este repo |
| Projeto | `<repo>/CLAUDE.md` | template de stack |

A skill `tlc-spec-driven` (em `agents/skills/`) é a fonte de verdade para
specs, roadmap, tasks e estado de sessão de cada projeto.
