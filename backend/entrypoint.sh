#!/bin/bash

# Set database configuration variables

DB_ENGINE=$DB_ENGINE
DB_NAME=$DB_NAME
DB_USER=$DB_USER
DB_PASSWORD=$DB_PASSWORD
DB_HOST=$DB_HOST
DB_PORT=$DB_PORT

# Activate virtual environment
source /app/venv/bin/activate

# Run database migrations
cd /app/fundoo
python3 manage.py makemigrations
python3 manage.py migrate

sleep 60
# Start Gunicorn server
exec gunicorn --workers 3 --bind 0.0.0.0:8000 fundoo.wsgi:application
