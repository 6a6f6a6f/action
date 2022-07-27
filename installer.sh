#! /usr/bin/env sh

REMOTE=$(
    curl -s https://api.github.com/repos/trufflesecurity/trufflehog/releases/latest |
        grep "browser_download_url.*linux_amd64.tar.gz" |
        cut -d : -f 2,3 |
        tr -d \" |
        xargs
)

DOWNLOAD_PATH="/tmp/trufflehog.tar.gz"
wget "$REMOTE" -O "$DOWNLOAD_PATH"
tar zxf "$DOWNLOAD_PATH" -C /tmp