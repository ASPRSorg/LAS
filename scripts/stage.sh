#!/bin/bash

sha=$(git rev-parse HEAD)

base="LAS-specification-$sha.pdf"

filename="build/latex/$base"



docker run -e "AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY" -e "AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID" -v $TRAVIS_BUILD_DIR:/data -w /data asprsorg/las aws s3 cp /data/build/latex/LAS.pdf s3://asprs-las/$base --acl public-read --region us-east-1

echo "File uploaded to https://s3.amazonaws.com/asprs-las/$base"

