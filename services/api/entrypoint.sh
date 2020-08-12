#!/bin/sh

echo "Waiting for postgres..."

while ! nc -z $POSTGRES_HOST $POSTGRES_PORT; do
  echo "PostgreSQL not started yet..."
  sleep 1
done

echo "PostgreSQL started"

# echo "Creating the database tables..."
# python manage.py create_db || exit 1
# echo "Tables created"

# echo "Seeding database..."
# python manage.py seed_db || exit 1
# echo "Database seeded"

exec "$@"
