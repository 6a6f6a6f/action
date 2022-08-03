#! /usr/bin/env sh

ARGS="$*"

echo "Running on version $(/tmp/trufflehog --version)"
echo "Arguments: $ARGS"

/tmp/trufflehog git "$ARGS"