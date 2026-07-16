.PHONY: check prepare build lint format type-check test knip

check: lint format type-check test knip

prepare:
	pnpm install
	bash scripts/setup-signing.sh

build:
	pnpm make

lint:
	pnpm lint

format:
	pnpm run fmt

type-check:
	pnpm run types:check

test:
	pnpm test

knip:
	pnpm knip
