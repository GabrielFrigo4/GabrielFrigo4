.POSIX:
.SILENT:

MAKEFLAGS += --no-print-directory -s

# ----------------------------------------------------------------
# Makefile: GitHub Institutional Profile & BIOS
# ----------------------------------------------------------------

.PHONY: all help format prettier lint hooks ci

all: help

### ================================
### HELP & DOCUMENTATION
### ================================
help:
	_e=$$'\e'; \
	cmd() { printf "    $${_e}[36mmake %-22s$${_e}[0m %s\n" "$$1" "$$2"; }; \
	sec() { printf "\n  $${_e}[1;33m%s$${_e}[0m\n" "$$1"; }; \
	printf "\n  $${_e}[1;37mGabriel Frigo — Perfil Institucional & README BIOS$${_e}[0m\n"; \
	printf "  ============================================================\n"; \
	sec "Qualidade & Governança:"; \
	cmd "format"         "Formata todo o Markdown com Prettier"; \
	cmd "prettier"       "Formata arquivos Markdown com Prettier"; \
	cmd "lint"           "Valida conformidade de formatação com Prettier"; \
	cmd "hooks"          "Configura e ativa os quality gates locais (.githooks)"; \
	cmd "ci"             "Executa pipeline local de validação de qualidade"; \
	echo ""

### ================================
### FORMATTING & LINTING
### ================================
format: prettier
	echo "✅ Formatação concluída!"

prettier:
	echo "🎨 Formatando arquivos Markdown com Prettier..."
	if command -v prettier > "/dev/null" 2>&1; then \
		prettier --write "**/*.md" 2> "/dev/null" || true; \
	elif command -v npx > "/dev/null" 2>&1; then \
		npx prettier --write "**/*.md" 2> "/dev/null" || true; \
	fi

lint:
	echo "🔍 Validando formatação com Prettier..."
	if command -v prettier > "/dev/null" 2>&1; then \
		prettier --check "**/*.md"; \
	elif command -v npx > "/dev/null" 2>&1; then \
		npx prettier --check "**/*.md"; \
	fi

### ================================
### GIT HOOKS & PERMISSIONS
### ================================
hooks:
	echo "⚓ Configurando permissões e ativando .githooks..."
	chmod 0755 .githooks/* 2> "/dev/null" || true
	git config core.hooksPath .githooks 2> "/dev/null" || true
	echo "  ✅ Profile: core.hooksPath -> .githooks"

### ================================
### CI PIPELINE
### ================================
ci: lint
	echo "✅ Quality Gate CI concluído com sucesso!"
