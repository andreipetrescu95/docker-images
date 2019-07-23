#!/bin/sh
set -e

/usr/bin/pgweb --bind=0.0.0.0 --listen=8081 --host=${DB_HOST} --port=${DB_PORT} \
      --user=${DB_USER} \
      --pass=${DB_PASSWORD} \
      --db=${DB_NAME} \
      --ssl=disable
