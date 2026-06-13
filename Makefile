.PHONY: check prepare build lint format type-check knip

check: lint format type-check knip

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

knip:
	pnpm knip
