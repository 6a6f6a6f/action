#! /usr/bin/env sh

REMOTE=$(
    curl -s https://api.github.com/repos/trufflesecurity/trufflehog/releases |
        grep "browser_download_url.*linux_amd64" |
        cut -d : -f 2,3 |
        tr -d \" |
        head -n 1 |
        xargs
)

DOWNLOAD_PATH="/tmp/trufflehog.tar.gz"
wget "$REMOTE" -O "$DOWNLOAD_PATH"
tar zxf "$DOWNLOAD_PATH" -C /tmp
