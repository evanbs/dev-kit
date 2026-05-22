# dev-kit

## Visão

Monorepo que centraliza toda a infraestrutura de desenvolvimento pessoal:
imagem base Docker (`devbase`), dotfiles do container, e templates de devcontainer
por stack — com Claude Code e Kiro CLI integrados por padrão.

O objetivo é harness engineering pronto: qualquer projeto novo começa em segundos,
com shell configurado, agentes de AI, skill `tlc-spec-driven` e contexto já presentes.

## Problema resolvido

Quatro repos separados (`devbase`, `dev-dotfiles`, `dev-template`, `wsl2-dotfiles`)
com acoplamento implícito, sem CI, CLAUDE.md duplicado e sem suporte a agentes.

## Estrutura

```
dev-kit/
├── Dockerfile              # imagem base — ghcr.io/evanbs/devbase
├── config/                 # configs baked na imagem (aliases, functions, zshrc, starship)
├── dotfiles/               # aplicado via VSCode dotfiles feature
│   ├── install.sh
│   ├── .claude/CLAUDE.md   # perfil global do Claude Code (~/.claude/CLAUDE.md)
│   ├── aliases/
│   ├── git/
│   ├── starship/
│   └── zsh/
├── templates/              # devcontainers por stack
│   ├── base/
│   ├── node/               # CLAUDE.md + AGENTS.md + .kiro/agents/dev.json
│   ├── bun/
│   ├── python/
│   ├── dotnet/
│   └── java/
├── agents/                 # contexto canônico de agente
│   ├── CLAUDE.md           # lido pelo Claude Code
│   ├── AGENTS.md           # lido pelo Kiro automaticamente
│   └── skills/
│       └── tlc-spec-driven/ # responsável por docs e contexto de projeto
└── .github/workflows/
    └── publish-image.yml   # build + push automático para ghcr.io
```

## Repos relacionados

| Repo | Status | Descrição |
|------|--------|-----------|
| `devbase` | arquivar após migração | substituído pela raiz do dev-kit |
| `dev-dotfiles` | arquivar após migração | substituído por `dotfiles/` |
| `dev-template` | arquivar após migração | substituído por `templates/` |
| `wsl2-dotfiles` | **mantém separado** | ciclo de vida distinto — host WSL2 |

## Decisões

- `tlc-spec-driven` é a única fonte de verdade para docs e contexto de projeto
- `CLAUDE.md` e `AGENTS.md` descrevem apenas comportamento do agente (autonomia, ferramentas)
- Claude Code e Kiro CLI instalados globalmente na imagem via npm
- VSCode dotfiles feature aponta para `evanbs/dev-kit` com `installCommand: dotfiles/install.sh`
