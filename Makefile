workspace = /home/baj/Dropbox/Workspace/github/

all: header.html README.md footer.html
	cat publications/*.bib > publications.bib
	cp publications.bib ${workspace}/cv
	cd ${workspace}/cv; make dist
	cd ${workspace}/research-statement; make dist
	pandoc -f markdown -t html README.md > README.html
	cat header.html README.html footer.html > index.html

clean:
	cd ${workspace}/cv; make clean
	cd ${workspace}/research-statement; make clean

sync: all
	git add .
	git commit -m "updated"
	git push
