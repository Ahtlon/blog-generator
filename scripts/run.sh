#!/bin/bash -e

if [ ${PWD##*/} = "scripts" ]; then
cd ..
fi

pushd blog/;python -m http.server; popd