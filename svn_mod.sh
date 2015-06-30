#!/bin/sh
if [ $# -gt 0 ];  then
    dest_dir=$1
else
    dest_dir="~/test/svnmod"
fi
echo   " the default dest dir is $dest_dir"
if [ -e $dest_dir ]; then
    echo "the dest dir exist!"
    yes="n"
    read  -p "delete the exist dir ? [y/n]" yes;
    if [ "$yes" = "" ]; then
        yes="n"
    fi

    if [ $yes = "y" ] || [ $yes = "Y" ]; then 
        rm -rf "$dest_dir"
    else 
        echo "the dest dir is not reachable, exit "
        exit 1
    fi
fi

mkdir -p "$dest_dir"

if [ $? -ne 0 ]; then
    echo "create dir failed! exit "
fi

echo  "dest dir is $dest_dir"
svn status  | grep M | awk '{print "cp --parents -i  " $2  " $1" > "svnmod"}'
bash svnmod $dest_dir
if [ $? -eq 0 ]; then
    echo "sucessfull to copy modify files to dest dir , the changed file is fellow "
    cat  svnmod | awk '{print $4}'
fi
#add something for test
