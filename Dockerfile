# Dockerfile for running PostgreSQL as Metastore in Hive.
# Based on the official Postgres image.

FROM postgres

COPY files/hive-schema-1.2.0.postgres.sql /hive/hive-schema.sql
COPY files/hive-txn-schema-0.13.0.postgres.sql /hive/hive-txn-schema.sql
COPY files/init-hive.sh /docker-entrypoint-initdb.d/init-hive.sh

EXPOSE 5432

CMD ["postgres"]
