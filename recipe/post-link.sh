#!/usr/bin/env bash

warn_nvidia()
{
# Easily deactivate the script
NVIDIA=${NVIDIA:-1}
if [ "${NVIDIA}" -eq "0" ]; then
  return 0
fi

# Find out currently loaded driver
if [ -f /proc/driver/nvidia/version ]; then
  CURRENT_NVIDIA_DRIVER=`cat /proc/driver/nvidia/version | head -n 1 | awk '{print $8}'`  # Guessed
else
  return 1
fi

# Tune these depending on ffmpeg driver requirements
MINIMUM_DRIVER="396.24"
MAXIMUM_DRIVER=""

# Version string comparison
# https://stackoverflow.com/questions/4023830/how-to-compare-two-strings-in-dot-separated-version-format-in-bash
# results in 0 if equal, 1 if $1 < $2, 2 if $2 > $1
vercomp () {
    if [[ $1 == $2 ]]
    then
        return 0
    fi
    local IFS=.
    local i ver1=($1) ver2=($2)
    # fill empty fields in ver1 with zeros
    for ((i=${#ver1[@]}; i<${#ver2[@]}; i++))
    do
        ver1[i]=0
    done
    for ((i=0; i<${#ver1[@]}; i++))
    do
        if [[ -z ${ver2[i]} ]]
        then
            # fill empty fields in ver2 with zeros
            ver2[i]=0
        fi
        if ((10#${ver1[i]} > 10#${ver2[i]}))
        then
            return 1
        fi
        if ((10#${ver1[i]} < 10#${ver2[i]}))
        then
            return 2
        fi
    done
    return 0
}

if [ ! -z ${MINIMUM_DRIVER} ]; then
  vercomp ${MINIMUM_DRIVER} ${CURRENT_NVIDIA_DRIVER}
  if [ $? == 1 ]; then
    echo "WARNING: CURRENT NVIDIA DRIVER IS TOO OLD (${CURRENT_NVIDIA_DRIVER} < ${MINIMUM_DRIVER})"
  fi
fi


if [ ! -z ${MAXIMUM_DRIVER} ]; then
  vercomp ${CURRENT_NVIDIA_DRIVER} ${MAXIMUM_DRIVER}
  if [ $? == 1 ]; then
    echo "WARNING: CURRENT NVIDIA DRIVER IS TOO NEW (${CURRENT_NVIDIA_DRIVER} > ${MAXIMUM_DRIVER})"
  fi
fi
}

warn_nvidia || true
