#!/bin/bash

# update packages
$(dirname $0)/update.sh

MYDIR=../web/bib
DOCS="cv-vilhuber cv-vilhuber-sshrc"

# xelatex does not work
cd $(dirname $0)/$MYDIR
for arg in $DOCS
do
    [[ -f ${arg}.aux ]] && rm ${arg}.aux
    pdflatex $arg 
    biber $arg
    pdflatex $arg
    pdflatex $arg
done

