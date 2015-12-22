#!/usr/bin/env bash
set -e
set -x

apt-get -y update
apt-get install -y --fix-missing curl libgecode-dev=3.7.1-3 unzip wget git

git config http.sslVerify false

curl -sSL https://get.rvm.io | bash
. /etc/profile.d/rvm.sh
rvm install 2.2.3
gem install bundler

mkdir packer
cd packer
wget https://releases.hashicorp.com/packer/0.8.6/packer_0.8.6_linux_amd64.zip
unzip *.zip
ln -s /packer/packer /usr/local/bin/packer
