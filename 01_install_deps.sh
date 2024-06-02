STARTING_DIR=$(pwd)

apt update && apt upgrade -yqq # Ensure up-to-date system
apt install -yqq curl wget git build-essential libncursesw5-dev libssl-dev \
     libsqlite3-dev tk-dev libgdbm-dev libc6-dev libbz2-dev pkg-config libffi-dev zlib1g-dev libxmlsec1 libxmlsec1-dev libxmlsec1-openssl libmaxminddb0 postgresql postgresql-contrib redis # Install build dependencies

wget https://github.com/mikefarah/yq/releases/download/v4.30.8/yq_linux_amd64 -O /usr/bin/yq
chmod +x /usr/bin/yq

wget https://www.python.org/ftp/python/3.12.3/Python-3.12.3.tgz
tar xzf Python-3.12.3.tgz 
cd Python-3.12.3
./configure --enable-optimizations
make altinstall # Install Python 3.12.3

cd $STARTING_DIR
rm -rf Python-3.12.3.tgz Python-3.12.3

# Install NodeJS 20
curl -fsSL https://deb.nodesource.com/setup_20.x | bash -
apt install -y nodejs

# Install Go 1.22
wget https://go.dev/dl/go1.22.3.linux-amd64.tar.gz
tar -C /usr/local -xzf go1.22.3.linux-amd64.tar.gz
rm -rf go1.22.3.linux-amd64.tar.gz
