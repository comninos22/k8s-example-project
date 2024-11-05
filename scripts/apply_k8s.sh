#!/bin/bash

# Source the environment variables
source ./local.env

# Check if IP is set
if [ -z "$IP" ]; then
  echo "Error: IP environment variable is not set, create a local environment file named local.env and set the local IP variable"
  exit 1
fi

# Find all YAML files and replace environment variables using sed
find k8s -name '*.yml' -o -name '*.yaml' | while read -r file; do
  echo "Processing file: $file"
  sed "s/\${IP}/$IP/g" "$file" | kubectl apply -f -
done