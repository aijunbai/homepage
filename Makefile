all: header.html body.md footer.html
	sudo apt install -y pandoc bibtool texlive-full
	bibtool -KsFd publications/*.bib -o publications.bib
	cp publications.bib cv
	cd cv; make
	pandoc -f markdown -t html body.md > body.html
	cat header.html body.html footer.html > index.html
	sed -i 's|href="http|target="_blank" href="http|g' index.html
	cat status.md body.md > README.md
	cp -r images style.css publications; ./bin/list.sh publications
	cp -r images style.css slides; ./bin/list.sh slides
	python2 ./bin/google-sitemapgen --config=sitemap_config.xml
	prettier --write --ignore-unknown .

clean:
	cd cv; make clean

sync: all
	git add .
	git commit -m "updated"
	git push
