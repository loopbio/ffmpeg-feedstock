About ffmpeg
============

Home: http://www.ffmpeg.org/

Package license: GPL 2

Feedstock license: BSD 3-Clause

Summary: Cross-platform solution to record, convert and stream audio and video.



Current build status
====================

Linux: [![Circle CI](https://circleci.com/gh/loopbio/ffmpeg-feedstock.svg?style=shield)](https://circleci.com/gh/loopbio/ffmpeg-feedstock)
OSX: [![TravisCI](https://travis-ci.org/loopbio/ffmpeg-feedstock.svg?branch=master)](https://travis-ci.org/loopbio/ffmpeg-feedstock)
Windows: [![AppVeyor](https://ci.appveyor.com/api/projects/status/github/loopbio/ffmpeg-feedstock?svg=True)](https://ci.appveyor.com/project/loopbio/ffmpeg-feedstock/branch/master)

Current release info
====================
Version: [![Anaconda-Server Badge](https://anaconda.org/loopbio/ffmpeg/badges/version.svg)](https://anaconda.org/loopbio/ffmpeg)
Downloads: [![Anaconda-Server Badge](https://anaconda.org/loopbio/ffmpeg/badges/downloads.svg)](https://anaconda.org/loopbio/ffmpeg)

Installing ffmpeg
=================

Installing `ffmpeg` from the `loopbio` channel can be achieved by adding `loopbio` to your channels with:

```
conda config --add channels loopbio
```

Once the `loopbio` channel has been enabled, `ffmpeg` can be installed with:

```
conda install ffmpeg
```

It is possible to list all of the versions of `ffmpeg` available on your platform with:

```
conda search ffmpeg --channel loopbio
```




Updating ffmpeg-feedstock
=========================

If you would like to improve the ffmpeg recipe or build a new
package version, please fork this repository and submit a PR. Upon submission,
your changes will be run on the appropriate platforms to give the reviewer an
opportunity to confirm that the changes result in a successful build. Once
merged, the recipe will be re-built and uploaded automatically to the
`loopbio` channel, whereupon the built conda packages will be available for
everybody to install and use from the `loopbio` channel.
Note that all branches in the loopbio/ffmpeg-feedstock are
immediately built and any created packages are uploaded, so PRs should be based
on branches in forks and branches in the main repository should only be used to
build distinct package versions.

In order to produce a uniquely identifiable distribution:
 * If the version of a package **is not** being increased, please add or increase
   the [``build/number``](http://conda.pydata.org/docs/building/meta-yaml.html#build-number-and-string).
 * If the version of a package **is** being increased, please remember to return
   the [``build/number``](http://conda.pydata.org/docs/building/meta-yaml.html#build-number-and-string)
   back to 0.
