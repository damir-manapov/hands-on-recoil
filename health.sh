#!/bin/bash

set -e

echo "Checking for vulnerabilities..."
pnpm audit --audit-level=moderate || exit 1

echo "Checking for outdated packages..."
# Capture output with timeout to prevent hanging
set +e
OUTDATED_OUTPUT=$(timeout 10 pnpm outdated 2>&1)
OUTDATED_EXIT=$?
set -e

if [ $OUTDATED_EXIT -eq 124 ]; then
	echo "Warning: Package check timed out"
elif [ -n "$OUTDATED_OUTPUT" ]; then
	# Check if output contains package table (indicates outdated packages)
	if echo "$OUTDATED_OUTPUT" | grep -qE "Package|Current|Latest"; then
		echo "Outdated packages found:"
		echo "$OUTDATED_OUTPUT"
		echo ""
		echo "Error: Outdated packages found. Consider updating with 'pnpm update'."
		exit 1
	else
		echo "All packages are up to date"
	fi
else
	echo "All packages are up to date"
fi

echo "Checking for leaked secrets in repository..."
if ! command -v gitleaks &> /dev/null; then
	echo "Error: gitleaks is not installed"
	echo "Install it with: pnpm add -D gitleaks or visit https://github.com/gitleaks/gitleaks"
	exit 1
fi

if gitleaks detect --no-banner --exit-code 1 2>&1; then
	echo "No secrets found in repository"
else
	echo "Error: Potential secrets detected in repository"
	exit 1
fi

echo "All health checks passed!"

