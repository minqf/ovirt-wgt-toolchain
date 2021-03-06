#!/bin/sh

NAME="python-windows"

SCRIPTDIR="$(dir="$(readlink -f "$(dirname "$0")")" && cd "${dir}" && pwd)"
rm -rf "${SCRIPTDIR}/noarch" "${SCRIPTDIR}"/*.rpm "${SCRIPTDIR}"/*.msi

spectool --all --get-files --directory "${SCRIPTDIR}" "${SCRIPTDIR}/${NAME}.spec"

rpmbuild \
	-bs \
	--define="_sourcedir ${SCRIPTDIR}" \
	--define="_srcrpmdir ${SCRIPTDIR}" \
	--define="_rpmdir ${SCRIPTDIR}" \
	"${SCRIPTDIR}/${NAME}.spec"
