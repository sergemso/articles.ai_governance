.PHONY: pdf docx clean all

PAPER_DIR = paper

all: pdf

pdf:
        cd $(PAPER_DIR) && latexmk -pdf -interaction=nonstopmode -file-line-error article.tex
        @echo "PDF built: $(PAPER_DIR)/article.pdf"

docx:
        pandoc \
                --output=manuscript.docx \
                --from=latex \
                --to=docx \
                --citeproc \
                --bibliography=$(PAPER_DIR)/refs.bib \
                $(PAPER_DIR)/article.tex
        @echo "DOCX built: manuscript.docx"

quick:
        cd $(PAPER_DIR) && pdflatex -interaction=nonstopmode article.tex

clean:
        cd $(PAPER_DIR) && latexmk -C || rm -f *.aux *.bbl *.blg *.log *.out *.toc *.lof *.lot *.fls *.fdb_latexmk *.synctex.gz *.pdf
        rm -f manuscript.docx manuscript.pdf
        @echo "Build artifacts cleaned"
