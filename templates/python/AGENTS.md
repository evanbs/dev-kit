# Agent Context — {{PROJECT_NAME}}

## Stack

Python. Versão gerenciada por `.python-version` via pyenv ou uv.

## Contexto do projeto

Documentação e specs vivem em `.specs/` (skill `tlc-spec-driven`).
Carregue `PROJECT.md`, `ROADMAP.md` e `STATE.md` antes de qualquer tarefa.
Se não existir, ofereça `initialize project`.

## Autonomia

Semi-autônomo. Tasks definidas em `.specs/features/`, revisão antes de
ações permanentes (push, delete, CI/CD).

## Convenções

- uv como package manager, ruff para lint/format
- Conventional commits
- Cheque `.specs/codebase/CONVENTIONS.md` após mapeamento brownfield
