#!/bin/bash

set -e

echo "Checking for vulnerabilities..."
pnpm audit --audit-level=moderate || exit 1

echo "Checking for outdated packages..."
OUTDATED=$(pnpm outdated 2>&1)
if [ -n "$OUTDATED" ] && echo "$OUTDATED" | grep -qE "(Package|packages).*outdated|Wanted|Latest"; then
	echo "$OUTDATED"
	echo "Error: Outdated packages found"
	exit 1
fi

echo "Checking for leaked secrets..."
if ! command -v gitleaks &> /dev/null; then
	echo "Error: gitleaks is not installed"
	echo "Install it with: pnpm add -D gitleaks or visit https://github.com/gitleaks/gitleaks"
	exit 1
fi

gitleaks detect --no-banner --exit-code 1 || exit 1

echo "All health checks passed!"

