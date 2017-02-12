#!/bin/bash

echo "building docs for $TRAVIS_BUILD_DIR"
docker run -v $TRAVIS_BUILD_DIR:/data -w /data asprsorg/las make latexpdf


