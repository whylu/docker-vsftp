#!/bin/bash

echo '== Now start setup ftp =='
echo 'PASV_ADDRESS='$PASV_ADDRESS

echo 'install vsftpd...'
yum clean all
yum install -y vsftpd

if [ -f "$CUSTOMIZED_CONFIG" ]; then
  echo 'use customized ftp config: '$CUSTOMIZED_CONFIG
  vsftpd $CUSTOMIZED_CONFIG

else 
  echo "customized ftp config not exit, use default."
  service vsftpd start
fi

/bin/bash

