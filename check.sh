#!/bin/bash

set -e

echo "Checking formatting..."
pnpm format:check

echo "Checking linting..."
pnpm lint

echo "Type checking..."
set +e
TSC_OUTPUT=$(pnpm exec tsc --noEmit 2>&1)
TSC_EXIT=$?
set -e
if [ $TSC_EXIT -ne 0 ]; then
	echo "$TSC_OUTPUT"
	echo ""
	echo "Error: TypeScript type checking failed"
	exit 1
fi

echo "Running tests..."
pnpm exec vitest run

echo "All checks passed!"

