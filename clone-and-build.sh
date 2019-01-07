#!/bin/sh
git clone $1 .
/bin/sh -c "./build.sh  -N \"${ARCHISO_NAME}\" -V \"${ARCHISO_VERSION}\" -L \"${ARCHISO_LABEL}\" -P \"${ARCHISO_PUBLISHER}\" -A \"${ARCHISO_APPLICATION_NAME}\" -o \"${ARCHISO_OUTPUT_DIRECTORY}\""
