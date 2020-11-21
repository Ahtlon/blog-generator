#!/bin/bash -x

if [ ${PWD##*/} = "scripts" ]; then
cd ..
fi

if [ $# = 0 ]; then
    echo "Name fehlt!"
    exit 1
fi


cd  content/$1*/images/
#find . -maxdepth 1 -type f \( -iname '*.png' -or -iname '*.jpg' -and -not -iname 'thmb.*' \) -exec convert \{} -verbose -resize 1024 \> thmb.\{} \;
IFS=$'\n' PIC=( $(find . -maxdepth 1 -type f \( -iname '*.png' -or -iname '*.jpg' -and -not -iname 'thmb.*' \) -printf %P ) )

for i in "${PIC[@]}" ; do
    echo "$i"
    convert $i -verbose -thumbnail 1024x thmb.$i
done
