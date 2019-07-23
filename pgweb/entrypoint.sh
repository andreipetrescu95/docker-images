#!/bin/sh
set -e

/usr/bin/pgweb --sessions --bind=0.0.0.0 --listen=8081 --url=${DATABSE_URL}
