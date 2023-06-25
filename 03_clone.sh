#!/bin/bash

# Specify version to clone instead of "master"
authentik_version="version/2023.5.4"

cd /opt/authentik

# Remove pre-existing git clones
rm -rf ./src

# Clone specific version of Authentik source
git clone --depth 1 --branch version/2023.5.4 https://github.com/goauthentik/authentik.git src

cd /opt/authentik/src/

# Create Python virtual environment
python3.11 -m virtualenv ./.venv
source .venv/bin/activate

# Create export of PIP compatible dependencies
pip install --no-cache-dir poetry
poetry export -f requirements.txt --output requirements.txt
poetry export -f requirements.txt --with dev --output requirements-dev.txt

# Install dependencies
pip install --no-cache-dir -r requirements.txt -r requirements-dev.txt
