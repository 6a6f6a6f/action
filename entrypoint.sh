#! /usr/bin/env bash

IFS=' ' read -r -a ARGS <<< "$*"
ARGS=("${ARGS[@]:1}")

VERSION=$(echo "$*" |cut -d " " -f 1)
./installer.sh "$VERSION"

# shellcheck disable=SC2048
# shellcheck disable=SC2086
/tmp/trufflehog "${ARGS[*]}"