#!/bin/bash
echo "Hey there"
gunicorn app:app -b 0.0.0.0:5297 -w 8 -k uvicorn.workers.UvicornWorker & yarn dev