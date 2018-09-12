resume = AijunBai-Resume.tex
cv = AijunBai-CV.tex
allinone = AijunBai-Resume_long.pdf

all: build
	pdftk $(resume:.tex=.pdf) $(cv:.tex=.pdf) cat output $(allinone)

build: $(cv) $(resume)
	latexmk -xelatex -pdf $(cv)
	latexmk -xelatex -pdf $(resume)

clean: 
	latexmk -c

