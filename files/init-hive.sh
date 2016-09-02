#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" <<-EOSQL
  CREATE USER hiveuser WITH PASSWORD 'hiveuser';
  CREATE DATABASE metastore;
  GRANT ALL PRIVILEGES ON DATABASE metastore TO hiveuser;

  \c metastore

  \i /hive/hive-schema.sql
  \i /hive/hive-txn-schema.sql

  \pset tuples_only
  \o /tmp/grant-privs
SELECT 'GRANT SELECT,INSERT,UPDATE,DELETE ON "' || schemaname || '"."' || tablename || '" TO hiveuser ;'
FROM pg_tables
WHERE tableowner = CURRENT_USER and schemaname = 'public';
  \o
  \i /tmp/grant-privs
EOSQL
