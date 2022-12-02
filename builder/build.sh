#!/usr/bin/env bash
#
set -euo pipefail

context="$( cd -- "$( dirname -- "$(readlink -f "${BASH_SOURCE[0]}")" )" &> /dev/null && pwd )"
repo="$(readlink -f "${context}/..")"
bn="$(basename "$repo")"

if [[ $# -gt 0 && "$1" == "clean" ]]; then
    shift
    podman volume rm "${bn}-zephyr-modules" || true
    podman volume rm "${bn}-zephyr" || true
    podman volume rm "${bn}-zephyr-tools"|| true
    podman volume rm "${bn}-zephyr-bootloader" || true
fi
if [[ $# -gt 0 && "$1" == "build" ]]; then
    shift
    podman build "$context" --tag "zephyrbuilder"
fi

set -x
podman run --rm -it \
    -v "$repo:/zephyrproject/time" \
    -v "${bn}-zephyr:/zephyrproject/zephyr" \
    -v "${bn}-zephyr-modules:/zephyrproject/modules" \
    -v "${bn}-zephyr-tools:/zephyrproject/tools" \
    -v "${bn}-zephyr-bootloader:/zephyrproject/bootloader" \
    "zephyrbuilder"
