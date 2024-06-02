useradd --create-home --home-dir /opt/authentik --user-group --system --shell /bin/bash authentik
chown -R authentik:authentik /opt/authentik

cd /opt/authentik

apt install -y python3-pip python3-virtualenv
