#!/bin/bash

# unset the SUBDIR variable since it changes the behavior of make here
unset SUBDIR

./configure \
        --prefix="${PREFIX}" \
        --disable-doc \
        --enable-shared \
        --enable-static \
        --extra-cflags="-Wall -g -m64 -pipe -O3 -march=x86-64 -fPIC `pkg-config --cflags zlib`" \
        --extra-cxxflags=="-Wall -g -m64 -pipe -O3 -march=x86-64 -fPIC" \
        --extra-libs="`pkg-config --libs zlib`" \
        --enable-pic \
        --enable-gpl \
        --enable-version3 \
        --enable-hardcoded-tables \
        --enable-avresample \
        --enable-libx264 \
        --disable-cuda \
        --disable-cuvid \
        --disable-nvenc

make
make install

# See also:
#   https://trac.ffmpeg.org/wiki/CompilationGuide#PerformanceTips
#   https://www.ffmpeg.org/legal.html

# To enable freetype (drawtext filter) add:
#   --enable-libfreetype \
# And add freetype as a build + run dependency on meta.yaml
# If we do so, we are getting some nasty errors:
#
# /opt/rh/devtoolset-2/root/usr/libexec/gcc/x86_64-redhat-linux/4.8.2/ld: warning: libpng16.so.16, needed by /feedstock_root/build_artefacts/ffmpeg_1502289942638/_b_env_placehold_placehold_placehold_placehold_placehold_placehold_placehold_placehold_placehold_placehold_placehold_placehold_placehold_placehold_placehold_placehold_placehold_placehold_placehold_place/lib/lib# freetype.so, not found (try using -rpath or -rpath-link)
# /feedstock_root/build_artefacts/ffmpeg_1502289942638/_b_env_placehold_placehold_placehold_placehold_placehold_placehold_placehold_placehold_placehold_placehold_placehold_placehold_placehold_placehold_placehold_placehold_placehold_placehold_placehold_place/lib/libfreetype.so: undefined reference to `png_read_update_info@PNG16_0'
#...
#
