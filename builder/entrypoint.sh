#!/usr/bin/env bash

set -euo pipefail
set -x

west init -l time || true
west update #-f always
west config -l
west build \
    -s time \
    -p always \
    -b xiao_ble \
    -d ./build
