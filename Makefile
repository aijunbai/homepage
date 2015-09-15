all: head.html body.md footer.html
	markdown body.md > body.html
	cat head.html body.html footer.html > index.html

sync: all
	scp -r AijunBai-CV.pdf AijunBai-RS.pdf \
		favicon.ico images index.html \
		publications style.css ec2:~/Public/

