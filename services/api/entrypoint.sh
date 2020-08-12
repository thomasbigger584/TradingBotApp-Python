#!/bin/sh
echo "Waiting for postgres..."

while ! nc -z "$POSTGRES_HOST" "$POSTGRES_PORT"; do
  echo "PostgreSQL not started yet..."
  sleep 1
done
echo "PostgreSQL started"

echo "Creating the database tables..."
python -m flask recreate-db
echo "Tables created"

echo "Seeding database..."
python -m flask populate-db --num_users 5
echo "Database seeded"

exec "$@"
