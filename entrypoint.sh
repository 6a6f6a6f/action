#! /usr/bin/env sh

ARGS="$*"

VERSION=$(/tmp/trufflehog --version)
echo "Running on $VERSION"
echo "Arguments: $ARGS"

/tmp/trufflehog git "$ARGS"