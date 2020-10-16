#!/bin/bash

set -x

ORIGIN_IMAGE=minio/mc \
    TARGET_REPO=lisy09/minio-mc \
    VERSION=RELEASE.2020-10-03T02-54-56Z \
    ./build_and_push.sh