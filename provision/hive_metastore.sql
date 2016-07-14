CREATE USER hiveuser WITH PASSWORD 'hiveuser';
CREATE DATABASE metastore;
\c metastore;
\i /hive-schema-2.0.0.postgres.sql
