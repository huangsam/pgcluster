# Before replication
CREATE TABLE guestbook (visitor_email text, vistor_id serial, date timestamp, message text);
INSERT INTO guestbook (visitor_email, date, message) VALUES ( 'jim@gmail.com', current_date, 'This is a test.');
SELECT visitor_email FROM guestbook;

# After replication
SELECT * FROM pg_stat_replication;
SELECT pg_is_in_recovery();
