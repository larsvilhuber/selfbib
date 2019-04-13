#!/bin/bash
MYDIR=../web/bib
DOCS="cv-vilhuber"

# 
cd $(dirname $0)/$MYDIR
ssh -i  /tmp/sftp_rsa -o "StrictHostKeyChecking=no" vilhuber10@administrator.dreamhost.com "rm /home/vilhuber10/www.vilhuber.com/lars/wp-content/uploads/c/cv-vilhuber.pdf"
scp -i  /tmp/sftp_rsa cv-vilhuber.pdf vilhuber10@administrator.dreamhost.com:/home/vilhuber10/www.vilhuber.com/lars/wp-content/uploads/c/
ssh -i  /tmp/sftp_rsa vilhuber10@administrator.dreamhost.com "cd /home/vilhuber10/www.vilhuber.com/lars/wp-content/papercite-data && svn up"
