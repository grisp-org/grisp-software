#!/usr/bin/env sh

# Exit on errors
set -e -u

SCRIPTDIR="$( cd "$(dirname "$0")" ; pwd -P )"
PROJECTDIR="${SCRIPTDIR}/../"
source "${SCRIPTDIR}/configuration.sh"

PLATFORM=$(uname)

case "$PLATFORM" in
    Darwin)
        full=$(defaults read loginwindow SystemVersionStampAsString)
        VERSION=$(echo "${full}" | sed -E 's:([0-9]*.[0-9]*).*:\1:')
        ;;
    *)
        VERSION=unknown
        ;;
esac

PACKAGE_OS="${PLATFORM}-${VERSION}"

PACKAGE_NAME="grisp_toolchain_${TARGET}_${PACKAGE_OS}.tar.gz"

tar -czf "${PACKAGE_NAME}" -C "${PREFIX}" .
