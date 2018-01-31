#!/bin/bash

docker run -d -p 5432:5432 \
    -v pgdir:/var/lib/postgresql \
    -v /var/lib/pgarchive:/var/lib/pgarchive \
    -v /home/vagrant/.ssh:/var/lib/pgssh \
    --name pgslave \
    --net host \
    my/postgres:9.6
