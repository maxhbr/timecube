#!/usr/bin/env bash
#
set -euo pipefail

repo="$(pwd)"
context="$( cd -- "$( dirname -- "$(readlink -f "${BASH_SOURCE[0]}")" )" &> /dev/null && pwd )"
bn="$(basename "$repo")"

podman build "$context" --tag "zephyrbuilder"
set -x
podman run --rm -it \
    -v "$repo:/workspace" \
    -v "${bn}-zephyr:/workspace/zephyr" \
    -v "${bn}-zephyr-modules:/workspace/modules" \
    -v "${bn}-zephyr-tools:/workspace/tools" \
    -v "${bn}-zephyr-bootloader:/workspace/bootloader" \
    "zephyrbuilder"
