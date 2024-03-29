#!/bin/sh
set -eu

LOG_DIRECTORY="/data/backup_logs"
TIMESTAMP=`date +%Y%m%d%H%M`
BACKUP_LOG_STDERR="${LOG_DIRECTORY}/backup_${TIMESTAMP}.stderr.log"
BACKUP_LOG_STDOUT="${LOG_DIRECTORY}/backup_${TIMESTAMP}.stdout.log"

mkdir -p "${LOG_DIRECTORY}"
echo "### START backup from: ${TIMESTAMP} ###" >> ${BACKUP_LOG_STDOUT}

(PGPASSWORD=${POSTGRES_PASSWORD} pg_dumpall -h nextcloud-postgres -U ${POSTGRES_USER} | gzip) \
    > /data/backup_postgres/postgresql_backup_nextcloud.sql.gz 2>> ${BACKUP_LOG_STDERR}

(PGPASSWORD=${DB_PASSWORD} pg_dumpall -h immich-database -U ${DB_USERNAME} | gzip) \
    > /data/backup_postgres/postgresql_backup_immich.sql.gz 2>> ${BACKUP_LOG_STDERR}

restic snapshots 2>> ${BACKUP_LOG_STDERR} 1>> ${BACKUP_LOG_STDOUT} \
    || restic init 2>> ${BACKUP_LOG_STDERR} 1>> ${BACKUP_LOG_STDOUT}

restic backup \
    /data \
    2>> ${BACKUP_LOG_STDERR} 1>> ${BACKUP_LOG_STDOUT}

restic forget \
    --keep-daily 7 \
    --keep-weekly 5 \
    --keep-monthly 12 \
    --keep-yearly 10 \
    2>> ${BACKUP_LOG_STDERR} 1>> ${BACKUP_LOG_STDOUT}

restic prune --max-unused="10%" \
    2>> ${BACKUP_LOG_STDERR} 1>> ${BACKUP_LOG_STDOUT}

echo "### STOP backup from: ${TIMESTAMP} ###" >> ${BACKUP_LOG_STDOUT}
