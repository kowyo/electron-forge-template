<h1 align="center">Electron Forge Template</h1>

<p align="center">
  <a href="https://github.com/kowyo/electron-forge-template/actions"><img src="https://img.shields.io/github/actions/workflow/status/kowyo/electron-forge-template/ci.yml?branch=main&label=CI&logo=github&style=flat-square" alt="CI"></a>
  <a href="https://github.com/kowyo/electron-forge-template/releases"><img src="https://img.shields.io/github/v/release/kowyo/electron-forge-template?label=Release&logo=github&style=flat-square" alt="Release"></a>
  <a href="LICENSE"><img src="https://img.shields.io/github/license/kowyo/electron-forge-template?label=License&style=flat-square" alt="License"></a>
</p>

A modern Electron Forge starter with best practices baked in.

## Stack

- **Electron 42** + **Electron Forge 8** + **Vite 8**
- **React 19** + **TailwindCSS 4** + **shadcn/ui**
- **oxlint** + **oxfmt** (fast Rust-based linting/formatting)
- **husky** + **lint-staged** (pre-commit checks)
- **GitHub Actions** (CI + automated releases)

## Getting started

```sh
pnpm install
pnpm start
```

## Scripts

| Command            | Description                 |
| ------------------ | --------------------------- |
| `pnpm start`       | Run in dev mode             |
| `pnpm make`        | Package the app             |
| `pnpm lint`        | Run oxlint                  |
| `pnpm fmt`         | Format with oxfmt           |
| `pnpm types:check` | TypeScript type check       |
| `pnpm knip`        | Check for unused files/deps |

## License

MIT
