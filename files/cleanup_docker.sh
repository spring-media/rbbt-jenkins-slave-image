#!/bin/bash

echo "Starting Cleanup of Docker Images at $(date)"
free_space=`df -Ph / | awk 'NR==2 {print $4}'`
echo "[BEFORE] Free Disk: $free_space"

docker system prune --all --force

echo "Finished Cleanup of Docker containers, volumes and networks at $(date)"
free_space=`df -Ph / | awk 'NR==2 {print $4}'`
echo "[AFTER ] Free Disk: $free_space
