#!/bin/sh
set -e

if [ "$1" = 'REPUSH' ]; then
    if [ ${PUSH_FORCE} = 'TRUE' ]; then
        echo " --force" >> push.sh
    fi
    mkdir repo
    cd repo
    git clone ${SOURCE_REPO}
    cd *
    git remote set-url --push origin ${TARGET_REPO}
    echo "done"
    node /app/app.js
fi

exec "$@"