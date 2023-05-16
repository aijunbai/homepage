all: clean cv header.html body.md footer.html
	sudo apt install -y pandoc bibtool texlive-full python2
	npm install --save-dev --save-exact prettier
	bibtool -KsFd publications/*.bib -o publications.bib
	pandoc -f markdown -t html body.md > body.html
	cat header.html body.html footer.html > index.html
	sed -i 's|href="http|target="_blank" href="http|g' index.html
	cat status.md body.md > README.md
	cp -r images style.css publications; ./bin/list.sh publications
	cp -r images style.css slides; ./bin/list.sh slides
	python2 ./bin/google-sitemapgen --config=sitemap_config.xml
	npx prettier --write --ignore-unknown .

cv: cv/AijunBai-CV.tex cv/publications.bib cv/Makefile
	cp publications.bib cv
	cd cv; make

clean:
	cd cv; make clean

update: all
	git add .
	git commit -m "updated"
	git push
