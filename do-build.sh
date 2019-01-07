#!/bin/sh
if [ -n "${ARCHISO_SOURCE_REPOSITORY}" ]; then
  if [ -d "./source" ]; then
    if [ -d .git ]; then
      cd source
      git reset --hard origin/master
      git pull
    else
      echo "Source directory already exists and isn't a git repository when ARCHISO_SOURCE_REPOSITORY is defined. Read README for more details on this issue. Exiting..."
      exit 1
    fi
  fi
  git clone ${ARCHISO_SOURCE_REPOSITORY} source
  echo ""
elif [ ! -d "./source" ]; then
  echo "Copying current archiso releng template..."
  cp -r /usr/share/archiso/configs/releng/ source
  echo "Applying default build_vars..."
  cp /root/default_build_vars source/build_vars
  echo ""
fi

cd source
source ./build_vars

echo "Starting archiso build..."
echo "Build details ============================"
echo "ISO Filename: ${ARCHISO_NAME}"
echo "ISO Version: ${ARCHISO_VERSION}"
echo "Disk Label: ${ARCHISO_LABEL}"
echo "Publisher: ${ARCHISO_PUBLISHER}"
echo "Application Name: ${ARCHISO_APPLICATION_NAME}"
echo ""
echo "Directories =============================="
echo "Install: arch"
echo "Work: work"
echo "Output: ${ARCHISO_OUTPUT_DIRECTORY}"
echo ""

build_command="./build.sh -N ${ARCHISO_NAME} -V ${ARCHISO_VERSION} -L '${ARCHISO_LABEL}' -P '${ARCHISO_PUBLISHER}' -A '${ARCHISO_APPLICATION_NAME}' -o ${ARCHISO_OUTPUT_DIRECTORY}"
echo "Executing build using \"${build_command}\"..."
eval "${build_command}"
