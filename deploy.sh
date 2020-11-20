#!/bin/bash

echo "Schiebe zu git"
cd content/
git add .
git commit -m  "`date +"%d.%m.%Y"`"
git push
cd ..

echo "HTML generieren"
/home/atlan/go/bin/blog-generator
echo "Zum server schieben"
rsync -vr --delete ./blog/ admin@v4web:/var/www/blog