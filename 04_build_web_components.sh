#!/bin/bash

# NPM missing as dependency???
# Debian installed NPM causes issues, investigate why NPM not installed as part of source earlier

cd /opt/authentik/src/website
npm i
npm run build

cd /opt/authentik/src/web
npm i
npm run build
