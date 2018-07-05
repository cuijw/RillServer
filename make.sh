#!/bin/sh

dir=$(cd `dirname $0`; pwd)
echo $dir
echo $1

if [ ! $1 ]; then  
       cmd='help' 
else
		cmd=$1
fi  

if [ $cmd = "all" ];then
	echo -e "\n make skynet"
    cd $dir/skynet && pwd
	make linux 
	
	echo -e "\n make luaclib"
	cd $dir/lualib-src  && pwd
	make linux
	
	echo -e "\n make pbc"
	cd $dir/lualib-src/pbc && pwd
	make  
    cd $dir/lualib-src/pbc/binding/lua53 && pwd
    make
    cp protobuf.so $dir/luaclib
	
elif [ $cmd = "clean" ];then
	echo -e "\n clean skynet"
	cd $dir/skynet && pwd
	make clean
	
	echo -e "\n clean luaclib"
	cd $dir/lualib-src && pwd
	make clean
	
	echo -e "\n clean pbc"
	cd $dir/lualib-src/pbc && pwd
	make clean
    cd $dir/lualib-src/pbc/binding/lua53 && pwd
    make clean
else
	echo "make help"
	echo "make.sh all"
	echo "make.sh clean"
fi



