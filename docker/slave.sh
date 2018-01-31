#!/bin/bash

docker run -d -p 5432:5432 \
    -v pgdir:/var/lib/postgresql \
    --name pgslave \
    --net host \
    my/postgres:9.6
