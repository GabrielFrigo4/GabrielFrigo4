# 🤖 AGENTS.md — Diretrizes para Agentes de IA no Perfil GitHub

Bem-vindo ao repositório **Profile** (`Personal/Identity/Profile` / `GabrielFrigo4/GabrielFrigo4`). Este documento é a constituição soberana e instrução mandatória para agentes de Inteligência Artificial operando nesta base de código.

---

## 1. Identidade e Papel

Este repositório é o **perfil institucional oficial e BIOS do ecossistema** de Gabriel Frigo no GitHub. Ele expõe a arquitetura dos 6 Hubs de Engenharia, a Tríade Canônica, a filosofia UNIX perto do metal e a stack de competências.

- **Formato:** Markdown enriquecido, diagramas Mermaid nativos e badges vetoriais estáveis.
- **Foco:** Narrativa autoral, sobriedade técnica, diagramação elegante e precisão arquitetural.

---

## 2. Regras Críticas Soberanas

1. **Tipografia Reader-First:** Priorizar clareza visual absoluta. Textos devem ser fluidos, envolventes e sem jargões corporativos vazios.
2. **Badges Vetoriais vs. Emojis:** Preferir badges SVG estilizados (shields.io) e vetores limpos. Evitar poluição excessiva de emojis em títulos.
3. **Invariante Hermetismo de Produção:** O repositório e suas renderizações nunca dependem de `.agents/`. A deleção de `.agents/` deixa o README 100% perfeito.
4. **Invariante Out-of-the-Box:** Modos octais canônicos no Git Index (`0644` para Markdown, SVG e imagens; `0755` para githooks).
5. **Diagramas Mermaid Estritos:** Todo diagrama Mermaid deve compilar sem erros de sintaxe ou nós órfãos.
6. **Commits Semânticos:** Mensagens no formato `docs(profile): <descrição>` ou verbos autorizados.

---

## 3. Boy Scout Rule

Sempre deixe o acampamento mais limpo do que encontrou:

- [ ] Valide a renderização de links quebrados ou âncoras órfãs.
- [ ] Mantenha tabelas Markdown e listas alinhadas.
- [ ] Execute `make lint` e `make format` antes de concluir.

---

## 4. Comandos de Verificação Rápidos

| Comando       | Descrição                                      |
| :------------ | :--------------------------------------------- |
| `make help`   | Exibe o menu interativo com alvos disponíveis  |
| `make format` | Formata todo o Markdown com Prettier           |
| `make lint`   | Valida conformidade de formatação com Prettier |
| `make hooks`  | Ativa os githooks locais com permissões 0755   |
| `make ci`     | Executa pipeline de validação de qualidade     |

---

## 5. Referências Obrigatórias

- [README Principal](README.md)
- [Regras de Agentes](.agents/rules/principles.md)
