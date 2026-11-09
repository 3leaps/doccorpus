# doccorpus developer targets. Structure gate needs only POSIX tools;
# goneat covers format and lint until corpus tooling lands.
.PHONY: all help check structure fmt fmt-check lint clean

GONEAT ?= goneat

all: check

help: ## Show available targets
	@grep -E '^[a-z-]+:.*## ' $(MAKEFILE_LIST) | sed 's/:.*## /\t/'

check: structure fmt-check lint ## Run every non-mutating check

structure: ## Prove required root files and placeholder layout exist
	test -f README.md
	test -f AGENTS.md
	test -f LICENSE-MIT
	test -f LICENSE-APACHE
	test -f Makefile
	test -d fixtures
	test -d expected
	test -d manifests

fmt: ## Apply formatting (fixtures and expected are excluded)
	$(GONEAT) assess --categories format --fix --ci-summary

fmt-check: ## Verify formatting without modifying files
	$(GONEAT) assess --categories format --mode check --fail-on low --ci-summary

lint: ## Run goneat lint (ruff, yamllint, actionlint, shfmt, checkmake)
	$(GONEAT) assess --categories lint --mode check --fail-on low --ci-summary

clean: ## Remove Python and tool caches
	find . -name __pycache__ -type d -prune -exec rm -rf {} +
	rm -rf .ruff_cache
