# Agent Context — {{PROJECT_NAME}}

## Stack

.NET (C#). Versão do SDK fixada no `global.json`.

## Contexto do projeto

Documentação e specs vivem em `.specs/` (skill `tlc-spec-driven`).
Carregue `PROJECT.md`, `ROADMAP.md` e `STATE.md` antes de qualquer tarefa.
Se não existir, ofereça `initialize project`.

## Autonomia

Semi-autônomo. Tasks definidas em `.specs/features/`, revisão antes de
ações permanentes (push, delete, CI/CD).

## Convenções

- Nullable reference types habilitado, minimal APIs preferidos
- Conventional commits
- Cheque `.specs/codebase/CONVENTIONS.md` após mapeamento brownfield
