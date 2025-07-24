#!/bin/sh
echo "Using PORT=${PORT}"

# Start actions server op vaste poort 5055
rasa run actions --port 5055 &

# Start Rasa server op poort uit environment variable PORT of fallback 5005
rasa run --enable-api --cors "*" --port ${PORT:-5005} --host 0.0.0.0
