# On Mac:
# brew install gnu-sed
# brew install pandoc

NAME="DeepSEA language reference"

pdf: tex clean

tex:
	pandoc -s -o ${NAME}.tex ${NAME}.md
	gsed -i 's/.*newenvironment{Shaded}.*/ \
		\\newenvironment{Shaded}{\\small}{\\normalsize}/' \
		${NAME}.tex
	gsed -i '/.*hypertarget{introduction}.*/i \
		\\\tableofcontents' \
		${NAME}.tex
	gsed -i 's/:exclamation:/ \
		{\\fontencoding{U}\\fontfamily{futs}\\selectfont\\char 66\\relax}/' \
		${NAME}.tex
	pdflatex ${NAME}.tex
	pdflatex ${NAME}.tex

clean:
	rm -f *.aux *.fdb_latexmk *.fls *.log *.toc *.tex

.PHONY: tex pdf clean 
