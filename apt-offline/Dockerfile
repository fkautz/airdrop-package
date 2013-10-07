from ubuntu
run	echo 'deb http://archive.ubuntu.com/ubuntu precise main universe' > /etc/apt/sources.list
run	apt-get update
run	apt-get install -y -q apt-offline
run	mkdir /offline
workdir	/offline
run	apt-offline set --install-packages ruby1.9.1 build-essential sqlite3 libsqlite3-dev -- airdrop.sig
run	apt-offline get airdrop.sig --bundle airdrop.zip
