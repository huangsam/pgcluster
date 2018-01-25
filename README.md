# Database hosts

What was provided by DHCP:

    172.28.128.3 pgmaster
    172.28.128.4 pgslave

## VM method

- [Setup: Debian](https://www.postgresql.org/download/linux/debian/)
- [Setup: Ubuntu](https://www.postgresql.org/download/linux/ubuntu/)
- [Setup: Red Hat](https://www.postgresql.org/download/linux/redhat/)

Database 1:

    init postgres
    start postgres
    su - postgres
    psql
    # create sample data
    CREATE ROLE replicator PASSWORD 'replicate' LOGIN REPLICATION;
    # modify pg_hba.conf
    # modify postgresql.conf
    systemctl restart postgresql

Database 2:

    init postgres
    systemctl stop postgresql
    # modify pg_hba.conf
    # modify postgresql.conf
    cd /var/lib/postgresql/9.6
    pg_basebackup -R -h 172.28.128.3 -U replicator -D replica
    rm -rf main
    mv replica main
    systemctl start postgresql

## Container method

Still unsure...TBD.
