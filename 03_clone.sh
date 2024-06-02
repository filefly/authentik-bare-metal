#!/bin/bash

cd /opt/authentik

# Remove pre-existing git clones
rm -rf ./src

# Clone specific version of Authentik source
git clone --depth 1 https://github.com/goauthentik/authentik.git src

cd /opt/authentik/src/

# Create Python virtual environment
python3.12 -m venv ./.venv
source .venv/bin/activate

# Create export of PIP compatible dependencies
pip install --no-cache-dir poetry
poetry export -f requirements.txt --output requirements.txt
poetry export -f requirements.txt --with dev --output requirements-dev.txt

# Install dependencies
# Error to investigate
# ERROR: pip's dependency resolver does not currently take into account all the packages that are installed. This behaviour is the source of the following dependency conflicts.
# virtualenv 20.23.1 requires platformdirs<4,>=3.5.1, but you have platformdirs 2.5.4 which is incompatible.
# poetry 1.5.1 requires platformdirs<4.0.0,>=3.0.0, but you have platformdirs 2.5.4 which is incompatible.
pip install --no-cache-dir -r requirements.txt -r requirements-dev.txt
