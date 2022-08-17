#! /usr/bin/env sh

trufflehog --version
echo "Arguments: $*" 

# shellcheck disable=SC2048
# shellcheck disable=SC2086
trufflehog $*