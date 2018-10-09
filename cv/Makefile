resume = AijunBai-Resume.tex
cv = AijunBai-CV.tex
allinone = AijunBai-Resume_long.pdf

all: $(cv) $(resume)
	latexmk -pdf $(cv)
	latexmk -pdf $(resume)

clean: 
	latexmk -c

