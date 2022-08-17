#! /usr/bin/env sh

echo "Arguments: $*"
exit 1

REMOTES=$(
    curl -s https://api.github.com/repos/trufflesecurity/trufflehog/releases |
        grep "browser_download_url.*linux_amd64" |
        cut -d : -f 2,3 |
        tr -d \"
)

TARGET=""
for REMOTE in $REMOTES; do
  echo "Target: $REMOTE"
done

DOWNLOAD_PATH="/tmp/trufflehog.tar.gz"
wget "$TARGET" -O "$DOWNLOAD_PATH"
tar zxf "$DOWNLOAD_PATH" -C /tmp
echo "/tmp" >> "$GITHUB_PATH"