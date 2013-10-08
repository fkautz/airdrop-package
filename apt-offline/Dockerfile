from ubuntu
run	echo 'deb http://archive.ubuntu.com/ubuntu precise main universe' > /etc/apt/sources.list
run	apt-get update
run	apt-get install -y -q apt-offline
run	mkdir /offline
workdir	/offline
# eventually add docker to list of installed packages
run	apt-offline set --install-packages ruby1.9.1 ruby1.9.1-dev build-essential sqlite3 libsqlite3-dev git -- deps.sig
run	apt-offline get deps.sig --bundle deps.zip
VOLUME /package
WORKDIR /package
#run	apt-offline install deps.zip
