#
# Copyright (c) 2019 Nordic Semiconductor ASA
#
# SPDX-License-Identifier: Apache-2.0
#

cmake_minimum_required(VERSION 3.20.0)

set(BOARD xiao_ble)

find_package(Zephyr REQUIRED HINTS ../zephyr)
project(timething)

FILE(GLOB app_sources src/*.c)
target_sources(app PRIVATE ${app_sources})
