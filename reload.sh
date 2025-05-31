# !/bin/bash
echo "Pulling latest changes from the repository..."
git pull origin main

echo "Syncing Alloy configuration..."
sudo cp ./configs/config.alloy /etc/alloy/config.alloy

echo "Reloading Alloy service..."
curl -X POST http://localhost:12345/-/reload

echo "Reloading docker containers..."
sudo docker compose -f ./docker-compose.yaml up -d