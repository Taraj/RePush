#!/bin/sh
set -e

if [ "$1" = 'REPUSH' ]; then
    mkdir repo
    cd repo
    git clone ${SOURCE_REPO}
    cd *
    git remote set-url --push origin ${TARGET_REPO}
    echo "done"
    node /app/app.js
fi

exec "$@"