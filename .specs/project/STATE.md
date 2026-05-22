# STATE — dev-kit

## Decisões

| ID | Decisão | Motivo |
|----|---------|--------|
| D01 | `wsl2-dotfiles` fica separado | Ciclo de vida distinto — configs de host WSL2, não de container |
| D02 | `tlc-spec-driven` é a única fonte de verdade para docs/contexto | Evita duplicação entre steering files, CLAUDE.md e docs avulsos |
| D03 | `CLAUDE.md` e `AGENTS.md` descrevem apenas comportamento de agente | Separação clara: comportamento vs contexto de projeto |
| D04 | Claude Code e Kiro instalados globalmente na imagem | Disponíveis em qualquer devcontainer sem configuração adicional |
| D05 | `dotfiles/` entra no monorepo para uso pessoal | `dev-dotfiles` original mantido como template público forkável para times |
| D06 | VSCode dotfiles: `evanbs/dev-kit` + `installCommand: dotfiles/install.sh` | Um repo único para configurar tudo |
| D07 | `~/.claude/CLAUDE.md` global criado via symlink no install.sh | Perfil do dev disponível em qualquer container sem reconfiguração |

## Contexto de sessão

### O que foi feito
- Análise dos 4 repos existentes (devbase, wsl2-dotfiles, dev-dotfiles, dev-template)
- Definição da arquitetura do monorepo dev-kit
- Refinamento do modelo de contexto de agente (3 camadas: global, imagem, projeto)
- Decisão sobre responsabilidades: tlc-spec-driven para docs, CLAUDE.md/AGENTS.md para comportamento
- Geração dos arquivos canônicos: Dockerfile (com Claude Code + Kiro), agents/CLAUDE.md, agents/AGENTS.md, dotfiles/.claude/CLAUDE.md, templates/node/

### Próximo passo
Milestone 1 — criar repo `dev-kit` no GitHub e migrar conteúdo dos repos existentes.

## Preferências

- Feedback de tarefas leves (validation, state): modelos mais rápidos funcionam bem
- Implementação e design: usar contexto completo da skill

## Bloqueadores

Nenhum no momento.

## Ideias deferidas

- OPT01: `dotfiles-template` repo público forkável para times
- OPT02: Template `android`
- OPT03: Script `new-project.sh`
- OPT04: Versionamento semântico da imagem
