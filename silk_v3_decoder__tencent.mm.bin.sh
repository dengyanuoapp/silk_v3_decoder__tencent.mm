#!/bin/bash

usage(){
    echo
    echo
    echo
    echo
    echo
    exit
}

[ -z "${1}" ] && usage

echo "silk_v3_decoder__tencent.mm.bin $1"
      silk_v3_decoder__tencent.mm.bin $1

echo "ffmpeg -f s16le -ar 24000 -ac 1 -i tmp.s16le.24000.ac1.pcm  $1.wav"
      ffmpeg -f s16le -ar 24000 -ac 1 -i tmp.s16le.24000.ac1.pcm  $1.wav
