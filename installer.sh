#! /usr/bin/env bash

VERSION="$1"
if [ ! "$VERSION" ]; then
    VERSION="latest"
fi

REMOTES=$(
    curl -s https://api.github.com/repos/trufflesecurity/trufflehog/releases |
        grep "browser_download_url.*linux_amd64" |
        cut -d : -f 2,3 |
        tr -d \"
)

TARGET=""
for REMOTE in $REMOTES; do
    if [ "$VERSION" = "latest" ]; then
        TARGET="$REMOTE"
        break
    fi

    REMOTE_VERSION=$(
        echo "$REMOTE" |
            cut -d "/" -f 8
    )
    if [ "$VERSION" = "$REMOTE_VERSION" ]; then
        TARGET="$REMOTE"
        break
    fi
done

if [ ! "$TARGET" ]; then
    echo "The version \"$VERSION\" is not available as a target on the TruffleHog release history."
    exit 1
fi

DOWNLOAD_PATH="/tmp/trufflehog.tar.gz"
wget "$TARGET" -O "$DOWNLOAD_PATH"
tar zxf "$DOWNLOAD_PATH" -C /tmp
