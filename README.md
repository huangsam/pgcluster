# Postgres Cluster

This is a playground for all things Postgres-related.

In particular, this repository covers the intricacies of deploying a master-slave configuration into production.

## Vagrant Setup

What was provided by `vboxnet`:

    172.28.128.3 pgmaster
    172.28.128.4 pgslave

Feel free to change the IPs in the `Vagrantfile` as necessary, but note that certain configuration will need to modified accordingly.

## VM Method

Here are links to help you install Postgres:

- [Setup: Debian](https://www.postgresql.org/download/linux/debian/)
- [Setup: Ubuntu](https://www.postgresql.org/download/linux/ubuntu/)
- [Setup: Red Hat](https://www.postgresql.org/download/linux/redhat/)

### Postgres Master

Here are the instructions:

    # install postgres
    passwd postgres
    su - postgres
    psql
    # create sample data
    # ssh-keygen
    # ssh-copy-id postgres@172.28.128.4
    # modify pg_hba.conf
    # modify postgresql.conf
    systemctl restart postgresql

### Postgres Slave

Here are the instructions:

    # install postgres
    passwd postgres
    systemctl stop postgresql
    # modify pg_hba.conf
    # modify postgresql.conf
    cd /var/lib/postgresql/9.6
    pg_basebackup -R -h 172.28.128.3 -U replicator -D replica
    mv main main.old
    mv replica main
    # modify main/recovery.conf
    systemctl start postgresql

## Container Method

Here are links to help you install Docker:

- [Setup: Debian](https://docs.docker.com/install/linux/docker-ce/debian/)
- [Setup: Ubuntu](https://docs.docker.com/install/linux/docker-ce/ubuntu/)
- [Setup: CentOS](https://docs.docker.com/install/linux/docker-ce/centos/)

### Postgres Master

    # install docker
    docker pull postgres:9.6
    # build custom postgres
    # create pgmaster container
    docker exec -it pgmaster bash
    gosu postgres psql
    # create sample data
    # modify pg_hba.conf
    # modify postgresql.conf
    docker restart pgmaster
    docker exec -it pgmaster bash
    gosu postgres psql

### Postgres Slave

    # install docker
    docker pull postgres:9.6
    # build custom postgres
    # create pgslave container
    docker stop pgslave
    # create pgbackup container
    cd /var/lib/postgresql
    pg_basebackup -R -h 172.28.128.3 -U replicator -D replica
    chown -R postgres:postgres replica
    rm -rf data/*
    mv replica/* data/
    rmdir replica
    # modify pg_hba.conf
    docker start pgslave
    docker exec -it pgslave bash
    gosu postgres psql
