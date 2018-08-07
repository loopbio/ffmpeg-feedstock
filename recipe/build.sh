#!/bin/bash

# unset the SUBDIR variable since it changes the behavior of make here
unset SUBDIR

# When the new compilers come, we might need this:
#   --cc="${CC}" \
# (as seen in the anaconda recipe)

./configure \
        --prefix="${PREFIX}" \
        --disable-doc \
        --disable-openssl \
        --enable-shared \
        --enable-static \
        --enable-pic \
        --enable-pthreads \
        --extra-cflags="-Wall -g -m64 -pipe -O3 -march=x86-64 -fPIC" \
        --extra-cxxflags="-Wall -g -m64 -pipe -O3 -march=x86-64 -fPIC" \
        --extra-libs="-lpthread -lm -lz" \
        --enable-gpl \
        --enable-version3 \
        --disable-nonfree \
        --enable-postproc \
        --enable-avresample \
        --enable-hardcoded-tables \
        --enable-gnutls \
        --enable-zlib \
        --enable-libfreetype \
        --enable-libx264 \
        --enable-libopenh264 \
        --enable-libx265 \
        --enable-libaom \
        --enable-libvpx \
        --disable-cuda \
        --disable-cuvid \
        --disable-nvenc

make -j${CPU_COUNT}
make install -j${CPU_COUNT}
