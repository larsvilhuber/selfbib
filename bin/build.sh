#!/bin/bash
MYDIR=../web/bib
DOCS="cv-vilhuber"

# xelatex does not work
cd $(dirname $0)/$MYDIR
for arg in $DOCS
do
    rm ${arg}.aux
    pdflatex $arg
    biber $arg
    pdflatex $arg
    pdflatex $arg
done

