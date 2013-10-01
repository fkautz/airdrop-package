default: create_image package

clean:
	-docker rmi airdrop/testimage
	-rm web
	

create_image: clean
	go build web.go
	docker build -t airdrop/testimage .

package:
	-rm -rf archive
	mkdir archive
	docker save airdrop/testimage > archive/testimage.tar
	cp run.sh archive/run.sh
	chmod +x archive/run.sh
	makeself archive archive.bin package ./run.sh

test:
	sshpass -p 'docker' scp -P 2222 archive.bin root@localhost:
	sshpass -p 'docker' ssh -p 2222 -l root localhost ./archive.bin
