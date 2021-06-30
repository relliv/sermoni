#!/usr/bin/env bash

echo 'Creating application user and db'

mongo ${MONGO_DATABASE} \
        --host localhost \
        --port ${MONGO_PORT} \
        -u ${MONGO_INITDB_ROOT_USERNAME} \
        -p ${MONGO_INITDB_ROOT_PASSWORD} \
        --authenticationDatabase admin \
        --eval "db.createUser({user: '${MONGO_USERNAME}', pwd: '${MONGO_PASSWORD}', roles:[{role:'dbOwner', db: '${MONGO_INITDB_DATABASE}'}]});"