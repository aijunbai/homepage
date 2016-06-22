workspace = /home/baj/Dropbox/Workspace/github/

all: header.html body.md footer.html
	cat publications/*.bib > publications.bib
	cp publications.bib ${workspace}/cv
	cd ${workspace}/cv; make dist
	cd ${workspace}/research-statement; make dist
	pandoc -f markdown -t html body.md > body.html
	cat header.html body.html footer.html > index.html
	sed -i 's|href="http|target="_blank" href="http|g' index.html
	cat status.md body.md > README.md
	cp -r images style.css publications; ./list.sh publications
	cp -r images style.css slides; ./list.sh slides

clean:
	cd ${workspace}/cv; make clean
	cd ${workspace}/research-statement; make clean

sync: all
	git add .
	git commit -m "updated"
	git push

