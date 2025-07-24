#!/bin/sh
# Start Rasa actions server op achtergrond
rasa run actions --port 5055 &

# Start Rasa server
rasa run --enable-api --cors "*" --port 5005 --host 0.0.0.0
