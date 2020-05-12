SHELL := /bin/bash

.PHONY: docs

menu:
	@perl -ne 'printf("%10s: %s\n","$$1","$$2") if m{^([\w+-]+):[^#]+#\s(.+)$$}' Makefile

all: # Run everything except build
	$(MAKE) fmt
	$(MAKE) lint
	$(MAKE) docs

fmt: # Format drone fmt
	@echo
	drone exec --pipeline $@

lint: # Run drone lint
	@echo
	drone exec --pipeline $@

docs: # Build docs
	@echo
	drone exec --pipeline $@

build: # Build container
	@echo
	drone exec --pipeline $@

edit:
	docker-compose -f docker-compose.docs.yml up --quiet-pull

requirements:
	@echo
	drone exec --pipeline $@

pkg:
	@echo
	drone exec --pipeline $@

main: target/main.js # Compile release
	true

clean:
	rm -rf target .shadow-cljs node_modules main

install:
	npm install

watch:
	./node_modules/.bin/shadow-cljs watch app

repl:
	./node_modules/.bin/shadow-cljs cljs-repl app

release: ./node_modules/.bin/shadow-cljs
	./node_modules/.bin/shadow-cljs release app

node_modules/.bin/shadow-cljs:
	$(MAKE) install

target/main.js:
	$(MAKE) release
