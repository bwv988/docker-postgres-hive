# Dockerfile for running PostgreSQL as Metastore in Hive.
# Based on the official Postgres image.
# FIXME: Hard-coded Hive schema.

FROM postgres

ENV HIVE_SCHEMA_VER 2.0.0
ENV HIVE_SCHEMA_FILE hive-schema-$HIVE_SCHEMA_VER.postgres.sql
ENV HIVE_TXN_SCHEMA_FILE hive-txn-schema-$HIVE_SCHEMA_VER.postgres.sql

# Add SQL scripts for provisioning.
COPY provision/$HIVE_SCHEMA_FILE /$HIVE_SCHEMA_FILE
COPY provision/$HIVE_TXN_SCHEMA_FILE /$HIVE_TXN_SCHEMA_FILE
COPY provision/hive_metastore.sql /docker-entrypoint-initdb.d/hive_metastore.sql
COPY provision/hive_permission_metastore.sql /docker-entrypoint-initdb.d/hive_permission_metastore.sql

EXPOSE 5432
CMD ["postgres"]
