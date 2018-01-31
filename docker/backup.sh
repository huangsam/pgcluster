#!/bin/bash

docker run --rm -it \
    --volumes-from pgslave \
    --name pgbackup \
    --net host \
    my/postgres:9.6 bash
