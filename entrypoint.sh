#! /usr/bin/env sh

ARGS="$*"
echo "Arguments: $ARGS"

/tmp/trufflehog git "$ARGS"