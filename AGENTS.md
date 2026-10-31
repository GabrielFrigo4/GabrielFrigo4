# 🤖 Profile — AI Agent Briefing

> Perfil institucional oficial e BIOS do ecossistema de Gabriel Frigo no GitHub (`GabrielFrigo4/GabrielFrigo4`).

---

## 🧭 Identidade e Papel

Este repositório é o **perfil institucional oficial e BIOS do ecossistema** de Gabriel Frigo no GitHub. Ele expõe a arquitetura dos 6 Hubs de Engenharia, a Tríade Canônica, a filosofia UNIX perto do metal e a matriz de competências.

- **Formato:** Markdown enriquecido, diagramas Mermaid nativos e badges vetoriais estáveis
- **Foco:** Narrativa autoral, sobriedade técnica, diagramação elegante e precisão arquitetural

---

## 📁 Estrutura Canônica de Arquivos

```text
Profile/
├── assets/                    # Diagramas, logos e imagens institucionais
├── .agents/                   # Governança e runbooks locais de IA
├── AGENTS.md                  # Constituição e briefing para agentes de IA
├── Makefile                   # Orquestrador POSIX silencioso
├── PRINCIPLES.md              # 22 Princípios de Engenharia aplicados
├── README.md                  # Perfil institucional e BIOS do GitHub
└── TODO.md                    # Roadmap e planejamento do perfil
```

---

## ⚠️ Regras Críticas para Agentes de IA

1. **Tipografia Reader-First:** Priorizar clareza visual absoluta. Textos devem ser fluidos, envolventes e sem jargões corporativos vazios.
2. **Badges Vetoriais vs. Emojis:** Preferir badges SVG estilizados (shields.io) e vetores limpos. Evitar poluição excessiva de emojis em títulos.
3. **Invariante Hermetismo de Produção:** O repositório e suas renderizações nunca dependem de `.agents/`. A deleção de `.agents/` deixa o README 100% perfeito.
4. **Invariante Out-of-the-Box:** Modos octais canônicos no Git Index (`0644` para Markdown, SVG e imagens; `0755` para githooks).
5. **Diagramas Mermaid Estritos:** Todo diagrama Mermaid deve compilar sem erros de sintaxe ou nós órfãos.
6. **Commits Semânticos:** Mensagens no formato `docs(profile): <descrição>` ou verbos autorizados.

---

## 🛡️ Regra da Proatividade e Correção Contínua (Boy Scout Rule)

O agente de IA atua de forma proativa na manutenção e aplicação dos padrões canônicos deste repositório.

Ao identificar linhas ou artefatos fora dos padrões estabelecidos:

1. **Notificar concisamente** o usuário sobre o ajuste realizado.
2. **Corrigir a inconformidade**, aplicando o padrão correspondente:
    - **Comentários Narrativos:** Eliminar comentários óbvios que apenas narram código executável.
    - **Banners Estruturais:** Ajustar réguas para exatamente 64 hífens no topo ou 32 caracteres com `### ` no corpo (ou 64 `=` em `.gitignore`), com títulos sempre em MAIÚSCULO.
    - **Portabilidade POSIX:** Substituir bashismos (`[[ ]]`, `&>`, arrays, `source`) por sintaxe estrita POSIX `/bin/sh`.
    - **Shebang Universal:** Garantir sempre `#!/usr/bin/env sh` ou `#!/usr/bin/env python3`.
    - **Sequências ANSI & Escapes:** Não use octais (`\033`, `\001`) para caracteres ou escapes. Use `[ -t 1 ] && echo -n $'\e...'` ou notação hexadecimal (`\x01`, `\x1b`). Octal é exclusivo para permissões POSIX (`chmod 0755`, `chmod 0644`, `umask`).
    - **Redirecionamento Seguro:** Envolver destinos em aspas duplas (ex: `> "/dev/null" 2>&1`).
    - **Makefiles:** Assegurar cabeçalho `.POSIX: .SILENT:`, `MAKEFLAGS += --no-print-directory -s`, alinhamento estético de variáveis e zero `@` redundante.
    - **Permissões Canônicas:** Aplicar 4 dígitos octais (`chmod 0755`, `chmod 0644`, `chmod 0700`, `chmod 0600`).
    - **Invariante Out-of-the-Box:** Garantir modos octais corretos no Git Index e auto-cura em tempo de execução sem requerer intervenção manual pós-clone.
    - **Emissão Semântica de UI:** Substituir `echo` avulsos com emojis pelas rotinas canônicas `_ui_*`.
    - **Antifragilidade & Resiliência:** Resolução ativa de caminhos em cascata, auto-cura de permissões (0600 em chaves/segredos) e validação defensiva de pré-requisitos.
    - **Curadoria Cognitiva:** Capturar decisões estruturais e regras tácitas em skills locais compactas (`.agents/skills/`), mantendo-as atualizadas e expurgando ruído obsoleto.
    - **Refatoração Sem Legado:** Expurgar aliases obsoletos, variáveis mortas e shims de compatibilidade em renomeações.
    - **Elevação Antifrágil & Shift Seguro:** Usar o bloco explícito `if [ "$(id -u)" -ne 0 ]` para resolução de `ELEVATE` (evitando término fatal sob `set -e` como root) e proteger todo comando `shift` com validação prévia de parâmetros (`[ "$#" -ge N ] && shift N`).
    - **Simetria de Documentação:** Mover regras ou invariantes universais documentadas erroneamente em sub-membros específicos para o documento de arquitetura do grupo correspondente, eliminando falsas assimetrias.

---

## 🚀 Comandos de Verificação Rápida (Quality Gates)

| Comando         | Finalidade Operacional                                     |
| :-------------- | :--------------------------------------------------------- |
| `make help`     | Exibe o menu interativo com alvos disponíveis              |
| `make format`   | Formata todo o Markdown com Prettier                       |
| `make prettier` | Formata arquivos Markdown com Prettier                     |
| `make lint`     | Valida conformidade de formatação com Prettier sem alterar |
| `make hooks`    | Ativa os githooks locais com permissões `0755`             |
| `make ci`       | Executa pipeline de validação de qualidade                 |

---

## 📖 Referências Obrigatórias

Antes de qualquer modificação neste ecossistema, consulte:

- [README.md](README.md) — Perfil institucional oficial e BIOS
- [PRINCIPLES.md](PRINCIPLES.md) — Os 22 Princípios de Engenharia Soberanos
- [TODO.md](TODO.md) — Roadmap e planejamento do perfil
- [.agents/rules/principles.md](.agents/rules/principles.md) — Regra de Princípios
