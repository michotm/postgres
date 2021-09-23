#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
    CREATE ROLE barman WITH LOGIN SUPERUSER PASSWORD '${BARMAN_PASSWORD}';
    GRANT ALL PRIVILEGES ON DATABASE ${POSTGRES_DB} TO barman;
EOSQL

echo "host replication all all md5" >> /var/lib/postgresql/data/pg_hba.conf