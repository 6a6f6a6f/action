#! /usr/bin/env sh

VERSION="$(/tmp/trufflehog --version)"
echo "Running on $VERSION"
echo "Arguments: $*" 

# shellcheck disable=SC2048
# shellcheck disable=SC2086
/tmp/trufflehog $*