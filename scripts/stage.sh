#!/bin/bash

sha=$(git rev-parse HEAD)

basetex="LAS-specification-$sha.tex"
basepdf="LAS-specification-$sha.pdf"

filename="build/latex/$basepdf"



docker run -e "AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY" -e "AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID" -v $TRAVIS_BUILD_DIR:/data -w /data asprsorg/las aws s3 cp /data/build/latex/LAS.tex s3://asprs-las/$basetex --acl public-read --region us-east-1

echo "Raw TEX uploaded to https://s3.amazonaws.com/asprs-las/$basetex"

docker run -e "AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY" -e "AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID" -v $TRAVIS_BUILD_DIR:/data -w /data asprsorg/las aws s3 cp /data/build/latex/LAS.pdf s3://asprs-las/$basepdf --acl public-read --region us-east-1

echo "Compiled PDF uploaded to https://s3.amazonaws.com/asprs-las/$basepdf"

