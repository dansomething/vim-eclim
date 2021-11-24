#!/usr/bin/env sh

V="2.21.0"

__download() {
  url="$1"
  dest="$2"
  if command -v wget >& /dev/null; then
    wget -c \
      --no-check-certificate \
      -O "$filename" \
      "$url"
  elif command -v curl >& /dev/null; then
    curl --silent \
      --output "$filename" \
      -L "$url"
  else
    return 1
  fi
}

__main() {
  version=$1
  url="https://github.com/ervandew/eclim/releases/download/$V/eclim_$V.bin"
  shift
  filename=eclim_$V.bin
  if [ ! -f $filename ]; then
    __download $url $filename
  fi
  if [ -f $filename ]; then
    $SHELL $filename --yes --vimfiles=skip "$@"
  fi
}

__main $V $@
