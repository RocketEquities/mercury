#!/bin/bash

VERSION=`git describe --tags`

tar -cvf - favicon.png fonts images index.html js styles | gzip -c9 > mercury-$VERSION.tar.gz

