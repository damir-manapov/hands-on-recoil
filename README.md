# Hands-on Recoil

A research project for exploring and working with Recoil state management library in React.

## Tech Stack

- **TypeScript** - Type-safe JavaScript
- **React** - UI library
- **Recoil** - State management
- **Vite** - Build tool and dev server
- **Vitest** - Testing framework
- **ESLint** - Code linting (with strict rules for `any` usage and deprecations)
- **Prettier** - Code formatting
- **pnpm** - Package manager

## Getting Started

### Prerequisites

- Node.js (v18 or higher)
- pnpm (v10.20.0 or higher)
- gitleaks (for secret scanning in health checks)

### Setup

1. **Install dependencies:**

```bash
pnpm install
```

2. **Install gitleaks (required for health checks):**

   Visit [gitleaks releases](https://github.com/gitleaks/gitleaks/releases) for the latest version, or use one of these methods:

   ```bash
   # Using Homebrew (macOS/Linux)
   brew install gitleaks

   # Manual installation (Linux x64)
   # Replace v8.29.0 with the latest version from https://github.com/gitleaks/gitleaks/releases
   TMPDIR=$(mktemp -d)
   cd "$TMPDIR"
   wget https://github.com/gitleaks/gitleaks/releases/download/v8.29.0/gitleaks_8.29.0_linux_x64.tar.gz
   tar -xzf gitleaks_8.29.0_linux_x64.tar.gz
   sudo mv gitleaks /usr/local/bin/
   cd -
   rm -rf "$TMPDIR"

   # Verify installation
   gitleaks version
   ```

   **Windows:** Download from [gitleaks releases](https://github.com/gitleaks/gitleaks/releases) and add to PATH

3. **Verify setup:**

```bash
# Run all checks (formatting, linting, type checking, tests)
./check.sh

# Run health checks (vulnerabilities, outdated packages, secrets)
./health.sh
```

### Development

Start the development server:

```bash
pnpm dev
```

The app will be available at `http://localhost:5173`

### Building

Create a production build:

```bash
pnpm build
```

Preview the production build:

```bash
pnpm preview
```

### Testing

Run tests:

```bash
pnpm test
```

Run tests with UI:

```bash
pnpm test:ui
```

### Linting

Check for linting errors:

```bash
pnpm lint
```

Fix linting errors automatically:

```bash
pnpm lint:fix
```

### Formatting

Format code with Prettier:

```bash
pnpm format
```

Check formatting:

```bash
pnpm format:check
```

### Scripts

**check.sh** - Runs all code quality checks:

- Formatting check
- Linting
- Type checking (without emitting)
- Tests

```bash
./check.sh
```

**health.sh** - Runs health and security checks:

- Vulnerability scan
- Outdated packages check
- Secret leak detection (gitleaks)

```bash
./health.sh
```

## Project Structure

```
hands-on-recoil/
├── src/
│   ├── atoms/          # Recoil atoms
│   ├── test/           # Test setup and utilities
│   ├── App.tsx         # Main app component
│   ├── main.tsx        # Entry point
│   └── ...
├── index.html
├── vite.config.ts
├── vitest.config.ts
├── tsconfig.json
├── eslint.config.js
├── .prettierrc.json
├── check.sh          # Code quality checks
└── health.sh          # Health and security checks
```

## ESLint Rules

This project enforces strict TypeScript rules:

- **No `any` type usage** - All `any` types are treated as errors
- **No unsafe operations** - Unsafe assignments, member access, calls, and returns are disallowed
- **No deprecated APIs** - Usage of deprecated APIs triggers errors

## License

ISC
