#!/usr/bin/env sh

set -euo pipefail

cd "$(dirname "$0")"
ZEPHYR_BASE="$(pwd)"
west init -l app || true
west update
