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
    su - postgres
    psql
    # create sample data
    CREATE ROLE replicator PASSWORD 'replicate' LOGIN REPLICATION;
    # modify pg_hba.conf
    # modify postgresql.conf
    systemctl restart postgresql

### Postgres Slave

Here are the instructions:

    # install postgres
    systemctl stop postgresql
    # modify pg_hba.conf
    # modify postgresql.conf
    cd /var/lib/postgresql/9.6
    pg_basebackup -R -h 172.28.128.3 -U replicator -D replica
    rm -rf main
    mv replica main
    systemctl start postgresql

## Container Method

Still unsure...TBD.
