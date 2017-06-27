#
# Makefile
#
# by: zander - zand3rs@gmail.com
#
# usage:
# make deploy S3_ACCESS_KEY=<access_key> S3_SECRET_KEY=<secret_key>
#

CWD = $(shell pwd)
TMP_DIR = $(CWD)/tmp

S3_BUCKET = s3://www.rocketequities.com
S3_ACCESS_KEY = ""
S3_SECRET_KEY = ""

DIST_DIR = $(TMP_DIR)
DIST_OBJECTS = fonts images js styles favicon.png index.html 403.html 404.html 500.html

all:
	@echo 'make [build|clean|deploy]'

build: clean
	@echo 'Creating distribution packages...'
	@\
	\cp -vRPpf $(DIST_OBJECTS) $(DIST_DIR)/.

deploy: build
	@echo 'Deploying distribution packages...'
	@\
	S3_OPTIONS="--acl-public"; \
	if [ -n "$(S3_ACCESS_KEY)" ]; then \
	    S3_OPTIONS+=" --access_key=$(S3_ACCESS_KEY)"; \
	fi; \
	if [ -n "$(S3_SECRET_KEY)" ]; then \
	    S3_OPTIONS+=" --secret_key=$(S3_SECRET_KEY)"; \
	fi; \
	echo "Copying files to S3..."; \
	\s3cmd $$S3_OPTIONS sync $(DIST_DIR)/. $(S3_BUCKET)/

clean:
	@echo 'Deleting distribution packages..'
	@\rm -vRf $(DIST_DIR)/*

silent:
	@:

%: silent
	@:

.PHONY: silent clean build deploy all

