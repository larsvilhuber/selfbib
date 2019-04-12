#!/bin/bash
MYDIR=../web/bib
DOCS="cv-vilhuber"

# xelatex does not work
cd $(dirname $0)/$MYDIR
for arg in $DOCS
do
    [[ -f ${arg}.aux ]] && rm ${arg}.aux
    trap "pdflatex $arg" EXIT
    trap "biber $arg" EXIT
    trap "pdflatex $arg"
    trap "pdflatex $arg"
done

