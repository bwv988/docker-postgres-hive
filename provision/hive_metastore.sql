CREATE USER hiveuser WITH PASSWORD 'hiveuser';
CREATE DATABASE metastore;
\c metastore;
\i /hive-schema-0.13.0.postgres.sql
