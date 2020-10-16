#!/bin/bash

set -x

if [[ -z "${VERSION}" ]]; then
    VERSION=RELEASE.2020-10-12T21-53-21Z
fi
if [[ -z "${TARGET_REPO}" ]]; then
    TARGET_REPO=lisy09/minio
fi
if [[ -z "${ORIGIN_IMAGE}" ]]; then
    ORIGIN_IMAGE=minio/minio
fi

TARGET_REPO=$TARGET_REPO \
    VERSION=$VERSION \
    ORIGIN_IMAGE=$ORIGIN_IMAGE \
    docker buildx bake -f docker-bake.hcl \
    --push

docker manifest create -a ${TARGET_REPO}:${VERSION} \
    ${TARGET_REPO}:${VERSION}-amd64 \
    ${TARGET_REPO}:${VERSION}-arm64 \
    ${TARGET_REPO}:${VERSION}-arm
docker manifest push ${TARGET_REPO}:${VERSION}