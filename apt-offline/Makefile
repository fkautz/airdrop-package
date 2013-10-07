default: clean build

clean:
	-rm -rf deps.zip

build:
	docker build -t airdrop/offline .
	docker run -v `pwd`:/package airdrop/offline cp /offline/deps.zip /package
