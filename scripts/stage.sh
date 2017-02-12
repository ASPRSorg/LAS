#!/bin/bash

sha=$(git rev-parse HEAD)

base="LAS-specification-$sha.pdf"

filename="build/latex/$base"

cp build/latex/LAS.pdf $filename

export AWS_ACCESS_KEY_ID="$AWS_KEY"
export AWS_SECRET_ACCESS_KEY="$AWS_SECRET"


docker run -e "AWS_SECRET_ACCESS_KEY=$AWS_SECRET" -e "AWS_ACCESS_KEY_ID=$AWS_KEY" -v $TRAVIS_BUILD_DIR:/data -w /data asprsorg/las aws s3 cp $filename s3://asprs-las/ --acl public-read --region us-east-1

echo "File uploaded to https://s3.amazonaws.com/asprs-las/$base"

