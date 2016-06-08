workspace = /home/baj/Dropbox/Workspace/github/

all: header.html body.md footer.html
	cd ${workspace}/cv; make dist
	cd ${workspace}/research-statement; make dist
	cat body.md > README.md
	markdown body.md > body.html
	cat header.html body.html footer.html > index.html

clean:
	cd ${workspace}/cv; make clean
	cd ${workspace}/research-statement; make clean

sync: all
	git add .
	git commit -m "updated"
	git push
