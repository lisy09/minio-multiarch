variable "TARGET_REPO" {}
variable "VERSION" {}
variable "ORIGIN_IMAGE" {}

group "default" {
    targets = ["linux-amd64", "linux-arm64", "linux-arm"]
}

target "linux-amd64" {
    tags = ["${TARGET_REPO}:${VERSION}-amd64"]
    platforms = ["linux/amd64"]
    args = {
        ORIGIN_DOCKER_IMAGE = "${ORIGIN_IMAGE}:${VERSION}"
    }
}

target "linux-arm64" {
    tags = ["${TARGET_REPO}:${VERSION}-arm64"]
    platforms = ["linux/arm64"]
    args = {
        ORIGIN_DOCKER_IMAGE = "${ORIGIN_IMAGE}:${VERSION}-arm64"
    }
}

target "linux-arm" {
    tags = ["${TARGET_REPO}:${VERSION}-arm"]
    platforms = ["linux/arm"]
    args = {
        ORIGIN_DOCKER_IMAGE = "${ORIGIN_IMAGE}:${VERSION}-arm"
    }
}
