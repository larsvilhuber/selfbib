#!/bin/bash
MYDIR=../web/bib
DOCS="cv-vilhuber"

# xelatex does not work
cd $(dirname $0)/$MYDIR
for arg in $DOCS
do
    [[ -f ${arg}.aux ]] && rm ${arg}.aux
    pdflatex $arg || true
    biber $arg || true
    pdflatex $arg || true
    pdflatex $arg
done

