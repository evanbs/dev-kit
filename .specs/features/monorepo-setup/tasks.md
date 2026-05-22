# Tasks — monorepo-setup

## Milestone 1 — Estrutura e migração

- [ ] **T01** Criar repo `dev-kit` no GitHub (público, sem template)
  - Done when: repo existe em `github.com/evanbs/dev-kit`

- [ ] **T02** Migrar conteúdo do `devbase` para a raiz
  - What: copiar `Dockerfile`, `config/`, `local-aws/`, `.devcontainer/`, `.github/`, `.gitignore`
  - Done when: `git log` mostra commit de migração, estrutura idêntica ao devbase

- [ ] **T03** Migrar `dev-dotfiles` → `dotfiles/`
  - What: copiar `aliases/`, `git/`, `starship/`, `zsh/`, `install.sh`, `CLAUDE.md`
  - Done when: `dotfiles/install.sh` funciona standalone

- [ ] **T04** Migrar `dev-template` → `templates/`
  - What: copiar todas as stacks (`base/`, `node/`, `bun/`, `python/`, `dotnet/`, `java/`)
  - Done when: cada stack tem `.devcontainer/devcontainer.json`

- [ ] **T05** Consolidar agents
  - What: copiar `.agents/` de devbase e dev-template → `agents/`, deduplicar
  - Done when: `agents/CLAUDE.md`, `agents/AGENTS.md` existem e são o merge dos dois originais

- [ ] **T06** Copiar skill tlc-spec-driven
  - What: copiar de `dev-template/.claude/skills/tlc-spec-driven/` → `agents/skills/tlc-spec-driven/`
  - Done when: `agents/skills/tlc-spec-driven/SKILL.md` existe

- [ ] **T07** Criar symlink CLAUDE.md na raiz
  - What: `ln -sf agents/CLAUDE.md CLAUDE.md`
  - Done when: `cat CLAUDE.md` mostra conteúdo de `agents/CLAUDE.md`

## Milestone 2 — Agentes na imagem

- [ ] **T08** Atualizar Dockerfile com Claude Code e Kiro
  - What: adicionar `npm install -g @anthropic-ai/claude-code @aws/kiro-cli`
  - Reuses: `dev-kit/Dockerfile` já gerado nesta sessão
  - Done when: build local passa sem erro

- [ ] **T09** Atualizar `devinfo` com claude e kiro
  - What: adicionar linhas de `claude --version` e `kiro --version` no script `config/devinfo`
  - Done when: `docker run -it devbase-local devinfo` mostra versões de claude e kiro

- [ ] **T10** Criar diretório `~/.claude/skills/` na imagem
  - What: adicionar `RUN mkdir -p /home/vscode/.claude/skills` no Dockerfile
  - Done when: diretório existe no container

- [ ] **T11** Testar build local
  - What: `docker build -t devbase-local . && docker run -it devbase-local devinfo`
  - Done when: output mostra todas as ferramentas incluindo claude e kiro

## Milestone 3 — CI/CD

- [ ] **T12** Criar workflow de publicação
  - What: `.github/workflows/publish-image.yml` com trigger em Dockerfile e config/**
  - Done when: arquivo existe e sintaxe válida (`act` ou push de teste)

- [ ] **T13** Configurar secret GHCR_TOKEN
  - What: documentar no README como criar e adicionar o secret
  - Done when: seção "Setup CI" no README com instruções

- [ ] **T14** Validar publicação
  - What: fazer push e verificar imagem em `ghcr.io/evanbs/devbase:latest`
  - Done when: `docker pull ghcr.io/evanbs/devbase:latest` funciona pós-push

## Milestone 4 — Templates com harness

- [ ] **T15** Atualizar template `node` com arquivos desta sessão
  - What: mover CLAUDE.md, AGENTS.md e .kiro/agents/dev.json gerados para `templates/node/`
  - Done when: arquivos presentes no template

- [ ] **T16** Criar CLAUDE.md + AGENTS.md para demais stacks (bun, python, dotnet, java)
  - What: adaptar template node para cada stack
  - Done when: cada template tem os dois arquivos

- [ ] **T17** Garantir referência à imagem correta em todos os devcontainer.json
  - What: checar e atualizar `image: ghcr.io/evanbs/devbase:latest` em todas as stacks
  - Done when: grep confirma referência correta em todos os templates

- [ ] **T18** Teste end-to-end do template node
  - What: abrir `.devcontainer` do template node no VS Code, verificar `claude --version` e `kiro --version`
  - Done when: ambos retornam versão sem erro

## Milestone 5 — Dotfiles e onboarding

- [ ] **T19** Atualizar install.sh com symlink ~/.claude/CLAUDE.md
  - What: adicionar `link "$DOTFILES_DIR/.claude/CLAUDE.md" "$HOME/.claude/CLAUDE.md"`
  - Reuses: `dotfiles/install.sh` já gerado nesta sessão
  - Done when: após rodar install.sh no container, `~/.claude/CLAUDE.md` aponta para dotfiles

- [ ] **T20** Criar `dotfiles/.claude/CLAUDE.md` (perfil global)
  - Reuses: arquivo já gerado nesta sessão
  - Done when: arquivo existe em `dotfiles/.claude/CLAUDE.md`

- [ ] **T21** Testar dotfiles em container limpo
  - What: abrir devcontainer sem dotfiles pré-aplicados, rodar install.sh, verificar starship + aliases + ~/.claude/CLAUDE.md
  - Done when: todos os symlinks criados corretamente

- [ ] **T22** Escrever README com diagrama e guia "nova máquina"
  - Done when: README tem seção de onboarding com os 3 passos: clone wsl2-dotfiles, configurar VSCode dotfiles, abrir template

## Milestone 6 — Arquivamento

- [ ] **T23** Adicionar deprecation notice em devbase, dev-dotfiles, dev-template
  - Done when: README de cada repo tem banner apontando para dev-kit

- [ ] **T24** Arquivar os 3 repos no GitHub
  - Done when: repos marcados como archived, ainda públicos e acessíveis

- [ ] **T25** Atualizar wsl2-dotfiles mencionando dev-kit
  - Done when: README de wsl2-dotfiles referencia dev-kit no contexto do ecossistema
