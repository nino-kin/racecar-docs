.PHONY : help build serve
.DEFAULT_GOAL := help

SHELL := /bin/bash

help: ## Display this help message
	@echo -e "\nUsage: make TARGET\n\nTargets:"
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) \
	| sort \
	| awk 'BEGIN {FS = ":.*?## "}; {print "  %-20s %s\n", $$1, $$2}'

build: ## Build documentation for MkDocs
	@docker run --rm -it -v ${PWD}:/docs squidfunk/mkdocs-material build

serve: ## Serve documentation for MkDocs
	@docker run --rm -it -p 8000:8000 -v ${PWD}:/docs squidfunk/mkdocs-material
