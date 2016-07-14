FROM postgres

ENV HIVE_SCHEMA_VER 2.0.0
ENV HIVE_SCHEMA_FILE hive-schema-$HIVE_SCHEMA_VER.postgres.sql
ENV HIVE_TXN_SCHEMA_FILE hive-txn-schema-$HIVE_SCHEMA_VER.postgres.sql

# Add SQL scripts for provisioning.
ADD provision/$HIVE_SCHEMA_FILE /$HIVE_SCHEMA_FILE
ADD provision/$HIVE_TXN_SCHEMA_FILE /$HIVE_TXN_SCHEMA_FILE
ADD provision/hive_metastore.sql /docker-entrypoint-initdb.d/hive_metastore.sql
ADD provision/hive_permission_metastore.sql /docker-entrypoint-initdb.d/hive_permission_metastore.sql

ENTRYPOINT ["/docker-entrypoint.sh"]

EXPOSE 5432
CMD ["postgres"]
