#!/bin/bash
MYDIR=../web/bib
DOCS="cv-vilhuber"
SSHOPTS='-o StrictHostKeyChecking=no'

case $(whoami) in
  larsvilhuber|lars|vilhuber)
    KEY=$HOME/.ssh/id_lars2016_rsa
    ;;
  *)
    KEY="/tmp/sftp_rsa"
    ;;
esac

# 
cd $(dirname $0)/$MYDIR
ssh -i $KEY $SSHOPTS vilhuber10@administrator.dreamhost.com "rm /home/vilhuber10/www.vilhuber.com/lars/wp-content/uploads/c/cv-vilhuber.pdf"
scp -i $KEY $SSHOPTS cv-vilhuber.pdf vilhuber10@administrator.dreamhost.com:/home/vilhuber10/www.vilhuber.com/lars/wp-content/uploads/c/
ssh -i $KEY $SSHOPTS vilhuber10@administrator.dreamhost.com "cd /home/vilhuber10/www.vilhuber.com/lars/wp-content/papercite-data && svn up"
