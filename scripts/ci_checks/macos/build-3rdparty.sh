#!/usr/bin/env bash

set -euxo pipefail

brew install --quiet --force --overwrite \
     automake scons

# debug build
scons -Q \
      --enable-werror \
      --enable-tests \
      --enable-benchmarks \
      --enable-examples \
      --enable-debug \
      --sanitizers=all \
      --enable-static \
      --build-3rdparty=all \
      test

# release build
scons -Q \
      --enable-werror \
      --enable-tests \
      --enable-benchmarks \
      --enable-examples \
      --enable-static \
      --build-3rdparty=all \
      test
