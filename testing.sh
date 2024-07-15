#!/bin/sh

#  https://boxmatrix.info/wiki/Property:sendmail
sendmail -v -S$SMTPSERVER -f$FROM -au$USER -ap$PASSWORD $TO < ./message.txt

ping google.com