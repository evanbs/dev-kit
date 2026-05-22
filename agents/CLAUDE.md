# Agent Context — dev-kit

## Identidade

Ambiente de desenvolvimento pessoal com harness engineering integrado.
Stack principal: TypeScript / Node.js, fullstack com foco em frontend.
Projetos podem incluir .NET, Python, Lambdas e múltiplos frontends.

## Skill responsável por docs e contexto

A skill `tlc-spec-driven` é a fonte de verdade para todo contexto de projeto:
specs, design, tasks, roadmap, decisões e estado de sessão.

Antes de qualquer tarefa de planejamento, especificação ou implementação:
1. Verifique se `.specs/` existe no projeto
2. Se existir, carregue `PROJECT.md`, `ROADMAP.md` e `STATE.md`
3. Se não existir, ofereça inicializar com `tlc-spec-driven`

Não crie documentação de projeto fora do `.specs/` — toda memória de projeto
vive na skill.

## Nível de autonomia

**Semi-autônomo:** execute tarefas bem definidas (com spec ou task em `.specs/`),
apresente o resultado para revisão antes de commitar ou fazer alterações destrutivas.

Pode executar sem pedir confirmação:
- Leitura de arquivos e análise de código
- Criação de arquivos novos dentro do escopo da task
- Instalação de dependências listadas na spec
- Rodar testes e lint

Sempre pede confirmação antes de:
- Deletar arquivos ou diretórios
- Fazer push ou abrir PRs
- Alterar configurações de CI/CD
- Modificar arquivos fora do escopo da task atual

## Ferramentas disponíveis no ambiente

- **Shell:** zsh + oh-my-zsh + starship (Catppuccin Frappé)
- **Node:** fnm (versão gerenciada por `.node-version`)
- **CLI úteis:** eza, bat, ripgrep, fzf, jq, httpyac, git-delta
- **AI:** claude (Claude Code), kiro (Kiro CLI)
- **Git:** git com delta como pager

Funções disponíveis no shell: `clip`, `mkcd`, `fcd`, `rgfzf`, `extract`, `devinfo`.

## Comportamento esperado

- Prefira TypeScript em arquivos novos, a menos que o projeto use outra linguagem
- Siga as convenções do projeto — cheque `.specs/codebase/CONVENTIONS.md` se existir
- Commits atômicos com mensagem clara (conventional commits quando o projeto adotar)
- Não invente APIs ou comportamentos — sinalize incerteza explicitamente
- Se uma task for ambígua, use `discuss` da skill antes de implementar
