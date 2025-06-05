#!/bin/bash

echo "Installing system dependencies..."
sudo apt update && sudo apt install -y \
  python3.12 \
  python3.12-venv \
  python3.12-dev \
  build-essential \
  libpq-dev \
  curl \
  git \
  docker.io \
  docker-compose

sudo update-alternatives --install /usr/bin/python python /user/bin/python3.12 1

echo "Installing Poetry..."
curl -sSL https://install.python-poetry.org | python -
export PATH="$HOME/.local/bin:$PATH"

echo "Setting up the project..."
cp .env.example .env

echo "Installing Python dependencies"
poetry install

echo "Running migrations"
poetry run python manage.py migrate