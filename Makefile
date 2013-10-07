default: clean create_image package

clean:
	-docker rmi airdrop/testimage
	-rm web
	-rm -rf airdrop
	

create_image:
	go build web.go
	docker build -t airdrop/testimage .
	git clone https://github.com/fkautz/airdrop.git
	cd airdrop && make
	cd apt-offline && make

package:
	-rm -rf archive
	mkdir archive
	docker save airdrop/testimage > archive/testimage.tar
	cp run.sh archive/run.sh
	cp airdrop/airdrop.tar.gz archive/
	cp apt-offline/deps.zip archive/
	chmod +x archive/run.sh
	makeself archive archive.bin package ./run.sh

test:
	sshpass -p 'docker' scp -P 2222 archive.bin root@localhost:
	sshpass -p 'docker' ssh -p 2222 -l root localhost ./archive.bin
