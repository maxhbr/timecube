#!/usr/bin/env bash
#
set -euo pipefail

repo="$(pwd)"
context="$( cd -- "$( dirname -- "$(readlink -f "${BASH_SOURCE[0]}")" )" &> /dev/null && pwd )"

podman build "$context" --tag "zephyrbuilder"
set -x
podman run --rm -it \
    -v "$repo:/workspace" \
    -v "$(basename "$repo")-zephyr:/workspace/zephyr" \
    -v "$(basename "$repo")-zephyr-modules:/workspace/modules" \
    -v "$(basename "$repo")-zephyr-tools:/workspace/tools" \
    -v "$(basename "$repo")-zephyr-bootloader:/workspace/bootloader" \
    "zephyrbuilder"
