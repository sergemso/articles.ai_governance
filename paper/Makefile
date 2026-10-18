# Build the article.pdf from LaTeX sources
.PHONY: pdf clean quick all

all: pdf

pdf: article.pdf

article.pdf: article.tex sections/*.tex refs.bib
	pdflatex -interaction=nonstopmode article.tex
	bibtex article
	pdflatex -interaction=nonstopmode article.tex
	pdflatex -interaction=nonstopmode article.tex
	@echo "PDF built: article.pdf"

quick: article.tex sections/*.tex
	pdflatex -interaction=nonstopmode article.tex
	@echo "Quick (single-pass) PDF built - cross-refs may be wrong"

clean:
	rm -f *.aux *.bbl *.blg *.log *.out *.toc *.lof *.lot *.fls *.fdb_latexmk *.synctex.gz *.pdf
	@echo "Build artifacts cleaned"
