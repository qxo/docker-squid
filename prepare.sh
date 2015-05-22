#!/bin/sh
# script for generate Dockerfile $1=baseimage $2=apt-mirror-url $3=output Dockerfile
echo '$@:'$@
echo 'baseimage:$1=>':$1
echo 'apt-mirror:$2=>':$2
echo 'output:$3 =>' : $3

export BASE_IMAGE="$1"
if [ -n "$2" ] ; then
  mirrorUpdate=" cp  /etc/apt/sources.list  /etc/apt/sources.list.bak && \\ 
   sed -i 's#http[:]//[^/]*/#$2/#g' /etc/apt/sources.list  && "
 export MIRROR_UPDATE="$mirrorUpdate"
 export MIRROR_RESTORE=" \ \n cat /etc/apt/sources.list.bak >  /etc/apt/sources.list  && rm -f  /etc/apt/sources.list.bak && \ \n"
fi
env
if [ -n "$3" ] ; then
  ./renderShellTpl.sh ./Dockerfile.tpl > $3
  cat $3
else 
 ./renderShellTpl.sh ./Dockerfile.tpl
fi

