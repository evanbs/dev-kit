# Agent Context — dev-kit

## Identidade

Ambiente de desenvolvimento pessoal com harness engineering integrado.
Stack principal: TypeScript / Node.js, fullstack com foco em frontend.
Projetos podem incluir .NET, Python, Lambdas e múltiplos frontends.

## Skill responsável por docs e contexto

A skill `tlc-spec-driven` é a fonte de verdade para todo contexto de projeto.
Ela gera e mantém: `PROJECT.md`, `ROADMAP.md`, `STATE.md`, specs, design e tasks
dentro de `.specs/` em cada projeto.

Antes de qualquer tarefa de planejamento, especificação ou implementação:
1. Verifique se `.specs/` existe no projeto
2. Se existir, carregue `PROJECT.md`, `ROADMAP.md` e `STATE.md`
3. Se não existir, ofereça inicializar com `tlc-spec-driven`

Não crie documentação de projeto fora do `.specs/`.

## Nível de autonomia

**Semi-autônomo:** execute tarefas com spec ou task definida, apresente resultado
para revisão antes de ações destrutivas ou permanentes.

Pode executar sem confirmação: leitura, criação de arquivos, instalação de deps,
testes e lint.

Sempre confirma antes de: deletar arquivos, push, PRs, alterações em CI/CD,
ou modificações fora do escopo da task.

## Ferramentas disponíveis

- zsh + starship, fnm, eza, bat, ripgrep, fzf, jq, httpyac, git-delta
- `claude` (Claude Code) e `kiro` (Kiro CLI) disponíveis no PATH
- Funções: `clip`, `mkcd`, `fcd`, `rgfzf`, `extract`, `devinfo`

## Comportamento

- TypeScript por padrão em arquivos novos
- Siga `.specs/codebase/CONVENTIONS.md` quando existir
- Commits atômicos, não invente APIs, sinalize incerteza explicitamente
