# Roadmap — dev-kit

## Milestone 1 — Migração e estrutura base
**Objetivo:** monorepo funcional substituindo os 3 repos antigos.

- [ ] Criar repo `dev-kit` no GitHub
- [ ] Migrar `devbase` → raiz (Dockerfile, config/, local-aws/, .devcontainer/, .github/)
- [ ] Migrar `dev-dotfiles` → `dotfiles/`
- [ ] Migrar `dev-template` → `templates/`
- [ ] Consolidar `.agents/` de devbase e dev-template → `agents/`
- [ ] Criar symlink `CLAUDE.md` na raiz → `agents/CLAUDE.md`
- [ ] Copiar `tlc-spec-driven` → `agents/skills/tlc-spec-driven/`

## Milestone 2 — Agentes integrados na imagem
**Objetivo:** Claude Code e Kiro disponíveis em qualquer devcontainer.

- [ ] Adicionar `@anthropic-ai/claude-code` e `@aws/kiro-cli` no Dockerfile
- [ ] Adicionar `claude` e `kiro` no `devinfo`
- [ ] Criar diretório `~/.claude/skills/` na imagem
- [ ] Testar build local: `docker build -t devbase-local . && docker run -it devbase-local devinfo`

## Milestone 3 — CI/CD automático
**Objetivo:** imagem publicada automaticamente ao alterar Dockerfile ou config/.

- [ ] Criar `.github/workflows/publish-image.yml`
- [ ] Documentar configuração do secret `GHCR_TOKEN`
- [ ] Validar push para `ghcr.io/evanbs/devbase:latest`

## Milestone 4 — Templates com harness completo
**Objetivo:** qualquer template novo tem agentes e skill prontos.

- [ ] Template `node`: CLAUDE.md + AGENTS.md + .kiro/agents/dev.json
- [ ] Templates restantes (bun, python, dotnet, java): CLAUDE.md + AGENTS.md
- [ ] Garantir que todos referenciam `ghcr.io/evanbs/devbase:latest`
- [ ] Testar `node` do zero: abrir devcontainer, `claude --version`, `kiro --version`

## Milestone 5 — Dotfiles e onboarding
**Objetivo:** nova máquina configurada em um comando.

- [ ] `dotfiles/install.sh` cria symlink `~/.claude/CLAUDE.md` → perfil global
- [ ] Atualizar VSCode settings: `dotfiles.repository: evanbs/dev-kit`, `installCommand: dotfiles/install.sh`
- [ ] Testar em container limpo: starship + aliases + claude funcionando
- [ ] README com diagrama do ecossistema e guia "nova máquina"

## Milestone 6 — Arquivamento
**Objetivo:** repos antigos aposentados sem quebrar referências existentes.

- [ ] Adicionar notice nos READMEs de devbase, dev-dotfiles, dev-template → dev-kit
- [ ] Arquivar os 3 repos no GitHub
- [ ] Atualizar wsl2-dotfiles README mencionando dev-kit

## Futuro / Opcional

- `dotfiles-template` repo público forkável para times
- Template `android`
- Script `new-project.sh` — inicializa projeto copiando template de stack
- Versionamento semântico da imagem (`v1.0.0` além de `latest`)
