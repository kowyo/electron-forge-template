.PHONY: check prepare build lint format type-check test knip

check: lint format type-check test knip

prepare:
	pnpm install

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
