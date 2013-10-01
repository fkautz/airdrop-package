#!/bin/sh
docker load < testimage.tar
cd /root/airdrop
# backup fails if these don't exist, need to fix. workaround for now
mkdir -p /docker/airdrop/testimage/data
mkdir -p /docker/airdrop/testimage/logs

/root/airdrop/airdrop.rb stop airdrop/testimage
/root/airdrop/airdrop.rb backup airdrop/testimage
/root/airdrop/airdrop.rb start airdrop/testimage "-p 80:80"
