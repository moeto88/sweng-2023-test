#!/bin/bash
until ncat -z -v -w30 db 5432
do
echo "Waiting for database connection for 5 seconds..."

## Wait for 5 seconds before check again. test
sleep 5
done
echo "Database server ready..."
gunicorn app:app -b 0.0.0.0:5297 -w 8 -k uvicorn.workers.UvicornWorker & yarn dev