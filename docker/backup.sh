#!/bin/bash

docker run --rm -it \
    --volumes-from pgslave \
    --name pgbackup \
    --net host \
    postgres:9.6 bash
