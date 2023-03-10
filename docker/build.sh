#!/bin/bash

VERSION="v1.0.0"
IMAGE_NAME="jmeet-jicofo"

DIR_OF_ROOT=../../
DIR_OF_JICOFO=../

# jicofo工程编译
pushd $DIR_OF_JICOFO > /dev/null
    echo ""
    echo "start to compile jicofo.."
    echo ""
    cd resources && bash build_deb_package.sh
popd

if [ ! -d build ]; then
    mkdir build
fi

# -f 如果已存在deb包，则强制覆盖
mv -f $DIR_OF_ROOT/*.deb build

# 删除无关文件
rm -r $DIR_OF_ROOT/*.buildinfo
rm -r $DIR_OF_ROOT/*.changes

docker build -t doudou/${IMAGE_NAME}:${VERSION} .