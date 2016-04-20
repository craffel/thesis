SRC = thesis
SUPPORT_FILES = preamble.tex

all: $(SRC).tex $(SUPPORT_FILES)
	pdflatex $< 2>&1 | grep --color -E "Warning|Missing|$$"
	bibtex $(SRC) 2>&1 | grep --color -E "Warning|Missing|$$"
	pdflatex $< 2>&1 | grep --color -E "Warning|Missing|$$"
	pdflatex $< 2>&1 | grep --color -E "Warning|Missing|$$"

gray: $(SRC).pdf
	pdf2ps -sDEVICE=psgray $(SRC).pdf - |ps2pdf - $(SRC)-gray.pdf

clean:
	rm -f *.aux *.log

spotless: clean
	rm -f *.dvi *.bak *.bbl *.blg *.brf *.lof *.lot *.out *.toc
