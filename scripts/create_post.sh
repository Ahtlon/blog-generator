#!/bin/bash

DATE="date +"%d.%m.%Y""

if [ ${PWD##*/} = "scripts" ]; then
cd ..
fi

if [ $# = 0 ]; then
    echo "Name fehlt!"
    exit
elif [ $# -ge 2 ]; then
    echo "Zu viele Argumente!"
    exit
else
cd ./content/
mkdir $1
cat ../template/post.md > $1/post.md

trap 'rm -f tmp.sh' 0 1 2 3 15;
(
    echo 'cat <<EOF'
    cat "../template/meta.yml"
    echo 'EOF'
) > tmp.sh
bash tmp.sh $1 >> $1/meta.yml
fi