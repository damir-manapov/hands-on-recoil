#!/bin/bash

set -e

echo "Checking formatting..."
pnpm format:check

echo "Checking linting..."
pnpm lint

echo "Type checking..."
pnpm exec tsc --noEmit

echo "Running tests..."
pnpm exec vitest run

echo "All checks passed!"

