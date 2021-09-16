#!/bin/bash
set -x -e
cd ${SRC_DIR}/build
make install
cd $PREFIX
rm -rf lib/cmake include lib/lib*.a libexec share
MAJOR_VERSION=$(echo ${PKG_VERSION} | cut -f1 -d".")
mv bin bin2
mkdir -p bin
cp bin2/clang-format bin/clang-format-${MAJOR_VERSION}
rm -rf bin
if [[ "$PKG_NAME" == "clang-format" ]]; then
  ln -sf clang-format-${MAJOR_VERSION} clang-format
fi
