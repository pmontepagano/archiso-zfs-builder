#!/bin/sh
if [[ -z "${ARCHISO_SOURCE_REPOSITORY}" ]]; then
  echo "ARCHISO_SOURCE_REPOSITORY variable is required. Check README for more information."
  exit 1
fi

git clone ${ARCHISO_SOURCE_REPOSITORY} .
source build_vars
/bin/sh -c "./build.sh  -N \"${ARCHISO_NAME}\" -V \"${ARCHISO_VERSION}\" -L \"${ARCHISO_LABEL}\" -P \"${ARCHISO_PUBLISHER}\" -A \"${ARCHISO_APPLICATION_NAME}\" -o \"${ARCHISO_OUTPUT_DIRECTORY}\""
