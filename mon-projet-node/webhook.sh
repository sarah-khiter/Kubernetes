#!/bin/bash

# Exposer le service avec ngrok
./ngrok http 80 &
sleep 5
NGROK_URL=$(curl -s http://localhost:4040/api/tunnels | jq -r .tunnels[0].public_url)

# Créer un webhook GitHub
curl -u "USERNAME:TOKEN" \
  -H "Content-Type: application/json" \
  -X POST \
  -d '{
    "name": "web",
    "active": true,
    "events": ["push"],
    "config": {
      "url": "'"$NGROK_URL"'",
      "content_type": "json"
    }
  }' \
  https://api.github.com/repos/USERNAME/REPO/hooks
