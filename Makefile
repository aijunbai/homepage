all: header.html body.md footer.html
	#sudo apt-get install -y pandoc bibtool google-sitemapgen pdftk
	bibtool -KsFd publications/*.bib -o publications.bib
	cp publications.bib cv
	cd cv; make
	cp cv/*.pdf .
	pandoc -f markdown -t html body.md > body.html
	cat header.html body.html footer.html > index.html
	sed -i 's|href="http|target="_blank" href="http|g' index.html
	cat status.md body.md > README.md
	cp -r images style.css publications; ./list.sh publications
	cp -r images style.css slides; ./list.sh slides
	google-sitemapgen --config=sitemap_config.xml

clean:
	cd cv; make clean

sync: all
	git add .
	git commit -m "updated"
	git push

