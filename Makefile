workspace = /home/baj/Dropbox/Workspace/github/

all: head.html body.md footer.html
	cd ${workspace}/cv; make dist
	cd ${workspace}/resume; make dist
	cd ${workspace}/research-statement; make dist
	cat body.md > README.md
	markdown body.md > body.html
	cat head.html body.html footer.html > index.html

clean:
	cd ${workspace}/cv; make clean
	cd ${workspace}/resume; make clean
	cd ${workspace}/research-statement; make clean

sync: all
	rsync -avz ./ ec2:~/Public/

