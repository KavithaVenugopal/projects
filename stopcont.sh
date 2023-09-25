#!/bin/bash

# Docker Hub repository information
DOCKERHUB_REPO="kavitha06/prod_01"
DOCKERHUB_USERNAME="kavitha06"
DOCKERHUB_PASSWORD="dckr_pat_OvjajmTTJk4Vm16DWX9Uurclx-I"

# Log in to Docker Hub
echo "$DOCKERHUB_PASSWORD" | docker login -u "$DOCKERHUB_USERNAME" --password-stdin docker.io

# List all images in the Docker Hub repository
IMAGES=$(docker search "$DOCKERHUB_REPO" | awk '{if (NR!=1) {print $1}}')

# Loop through and remove each image
for IMAGE in $IMAGES; do
    # Remove the image
    docker rmi -f "$DOCKERHUB_REPO/$IMAGE"
done

# Log out from Docker Hub
docker logout
