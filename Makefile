.PHONY: check fix prepare build lint lint-fix format format-check type-check test knip

check: lint format-check type-check test knip

fix: lint-fix format

prepare:
	pnpm install

build:
	pnpm make

lint:
	pnpm lint

lint-fix:
	pnpm run lint:fix

format:
	pnpm run fmt

format-check:
	pnpm run fmt:check

type-check:
	pnpm run types:check

test:
	pnpm test

knip:
	pnpm knip
