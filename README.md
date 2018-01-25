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
    CREATE TABLE guestbook (visitor_email text, vistor_id serial, date timestamp, message text);
    INSERT INTO guestbook (visitor_email, date, message) VALUES ( 'jim@gmail.com', current_date, 'This is a test.');
    SELECT * FROM guestbook;
    CREATE ROLE replicator PASSWORD 'replicate' LOGIN REPLICATION;
    \q
    # modify pg_hba.conf
    # modify postgresql.conf
    systemctl restart postgresql

Database 2:

    init postgres
    systemctl stop postgresql
    # modify pg_hba.conf
    # modify postgresql.conf
    # create recovery.conf
    systemctl restart postgresql

## Container method

Still unsure...TBD.
