#!/bin/bash
set -euo pipefail


#https://stackoverflow.com/a/57111010
# % !TeX program = latexmk -pdf -pdflatex="pdflatex -synctex=1 -interaction=nonstopmode -shell-escape" -jobname=% -pretex="\newcommand{\version}{noanswer}" -usepretex % | latexmk -pdf -pdflatex="pdflatex -synctex=1 -interaction=nonstopmode -shell-escape" -jobname=%_solution -pretex="\newcommand{\version}{}" -usepretex % | txs:///view-pdf "?am)_solution.pdf"

latexmk -gg -bibtex -pdflatex=xelatex -pdf resume.tex
latexmk -bibtex -pdflatex=xelatex -pdf coverletter.tex
latexmk -bibtex -pdflatex=xelatex -pdf cv.tex

rm -rf examples
mkdir -p examples
for file in *.pdf; do
	gm convert $file "examples/$file.png"
done

mv *.pdf documents/

latexmk -C
rm -f *.bbl *.xml