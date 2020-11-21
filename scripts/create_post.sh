#!/bin/bash -exu

DATE="date +"%d.%m.%Y""

if [ ${PWD##*/} = "scripts" ]; then
    cd ..
fi

if [ $# = 0 ]; then
    echo "Name fehlt!"
    exit 1
elif [ $# -gt 3 ]; then
    echo "Zu viele Argumente!"
    exit 1
else

cd ./content/
mkdir -v $1
cat ../template/post.md > $1/post.md

trap 'rm -f tmp.sh' 0 1 2 3 15;
(
    echo 'cat <<EOF'
    cat "../template/meta.yml"
    echo 'EOF'
) > tmp.sh
bash tmp.sh $1 >> $1/meta.yml

if [ $2 = -i ]; then
    mkdir -p $1/images/

    if [ $# = 3 ]; then
    (
    echo 'cat <<EOF'
    echo '<center>'
    echo '    <a href="images/$1.png" target="_blank"><img src="images/thmb.$1.png" /></a>'
    echo '</center>'
    echo 'EOF'
    ) > tmp.sh
    bash tmp.sh $3 >> $1/post.md
    fi

fi

fi