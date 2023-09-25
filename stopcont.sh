#!/bin/bash

# Define the port you need for your application
PORT=80

# List all running containers
CONTAINERS=$(docker ps -q)

for CONTAINER in $CONTAINERS; do
  # Check if the container is using the specified port
  if docker port $CONTAINER | grep -qE "[0-9]+/tcp.*:$PORT"; then
    # Stop the container
    echo "Stopping container $CONTAINER to free up port $PORT"
    docker stop $CONTAINER
  fi
done

# Run your deployment command here (e.g., docker-compose up)
./deploy.sh
