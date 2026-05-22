# Agent Context — {{PROJECT_NAME}}

## Stack

Node.js + TypeScript. Versão do Node gerenciada por `.node-version` via fnm.

## Contexto e docs do projeto

Toda documentação, specs e contexto vivem em `.specs/` — gerado e mantido
pela skill `tlc-spec-driven`. Carregue sempre antes de planejar ou implementar:

```
.specs/
├── project/PROJECT.md     # visão e objetivos
├── project/ROADMAP.md     # features e milestones
├── project/STATE.md       # decisões, blockers, todos
└── features/<nome>/       # specs de features
```

Se `.specs/` não existir: `initialize project` para criar.

## Autonomia

Semi-autônomo. Execute tasks definidas em `.specs/`, revise antes de
commitar ou fazer alterações destrutivas.

## Convenções (atualize conforme o projeto)

- TypeScript strict
- pnpm como package manager (ou o definido no projeto)
- Conventional commits
- Verifique `.specs/codebase/CONVENTIONS.md` após mapeamento brownfield
