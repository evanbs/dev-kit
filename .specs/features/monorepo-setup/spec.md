# Spec — Monorepo dev-kit

## Requisitos

### REQ-01 Estrutura do monorepo
O repositório `dev-kit` deve conter, na raiz:
- `Dockerfile` — imagem base publicada em `ghcr.io/evanbs/devbase`
- `config/` — configs baked na imagem
- `dotfiles/` — aplicado via VSCode dotfiles feature
- `templates/` — devcontainers por stack
- `agents/` — CLAUDE.md, AGENTS.md e skills/
- `.github/workflows/` — CI de publicação da imagem
- `.specs/` — contexto do projeto (este arquivo)
- `CLAUDE.md` — symlink para `agents/CLAUDE.md`

### REQ-02 Claude Code e Kiro na imagem
O Dockerfile deve instalar globalmente via npm:
- `@anthropic-ai/claude-code`
- `@aws/kiro-cli`

Ambos devem aparecer no output do `devinfo`.

### REQ-03 Contexto de agente em três camadas
- **Global** (`~/.claude/CLAUDE.md`): perfil do dev, criado via symlink no `dotfiles/install.sh`
- **Imagem** (`agents/CLAUDE.md`): ferramentas disponíveis, nível de autonomia
- **Projeto** (`<repo>/CLAUDE.md`): convenções e contexto específico

O `AGENTS.md` espelha o `CLAUDE.md` correspondente para compatibilidade com Kiro.

### REQ-04 tlc-spec-driven como única fonte de contexto
- A skill `tlc-spec-driven` deve estar em `agents/skills/tlc-spec-driven/`
- Todo template de stack deve referenciar a skill no `.kiro/agents/dev.json`
- `CLAUDE.md` e `AGENTS.md` não devem conter documentação de projeto — apenas comportamento do agente

### REQ-05 CI automático de imagem
- Workflow em `.github/workflows/publish-image.yml`
- Trigger: push em `main` com alterações em `Dockerfile` ou `config/**`
- Ação: build e push para `ghcr.io/evanbs/devbase:latest`

### REQ-06 Dotfiles via VSCode feature
- `dotfiles/install.sh` detecta contexto (devcontainer vs host)
- Em qualquer contexto: cria symlinks para starship, gitconfig, aliases, zshrc.local, `.claude/CLAUDE.md`
- No host (WSL2): instala ferramentas (zsh, starship, fnm, eza, bat, ripgrep, fzf)
- Configuração VSCode: `dotfiles.repository: evanbs/dev-kit`, `dotfiles.installCommand: dotfiles/install.sh`

### REQ-07 Templates por stack
Cada template deve conter:
- `.devcontainer/devcontainer.json` referenciando `ghcr.io/evanbs/devbase:latest`
- `CLAUDE.md` com contexto da stack e instrução de carregar `.specs/`
- `AGENTS.md` com o mesmo conteúdo (compatibilidade Kiro)
- `.kiro/agents/dev.json` com skill `tlc-spec-driven` no resources

### REQ-08 Migração e arquivamento
- `devbase`, `dev-dotfiles` e `dev-template` devem ter notice no README apontando para `dev-kit`
- Os 3 repos devem ser arquivados no GitHub após validação
- `wsl2-dotfiles` mantém-se independente, README atualizado mencionando `dev-kit`

## Critérios de aceite

- [ ] `docker run -it ghcr.io/evanbs/devbase devinfo` mostra `claude` e `kiro` com versões
- [ ] Abrir template `node` em devcontainer: `claude --version` e `kiro --version` funcionam
- [ ] VSCode dotfiles aplicados: starship, aliases e `~/.claude/CLAUDE.md` presentes no container
- [ ] Push em `main` alterando `Dockerfile` dispara CI e publica nova imagem
- [ ] `.specs/` gerado pelo `tlc-spec-driven` no template `node` após `initialize project`
