#! /usr/bin/env sh

VERSION=$(echo "$*" |cut -d " " -f 6)
# ./installer.sh "$VERSION"

IFS=' ' read -r -a ARGS <<< "$*"
ARGS=("${ARGS[@]:1}")
echo "${ARGS[*]}"
# shellcheck disable=SC2048
# shellcheck disable=SC2086
# trufflehog $*
