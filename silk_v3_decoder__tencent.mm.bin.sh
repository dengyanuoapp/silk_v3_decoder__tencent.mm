#!/bin/bash

usage(){
    echo
    echo
    echo "$0 <input.amr>"
    echo
    echo
    exit
}

[ -z "${1}" ] && usage

echo "silk_v3_decoder__tencent.mm.bin $1"
      silk_v3_decoder__tencent.mm.bin $1

outPut=$(basename $1).wav

echo "ffmpeg -f s16le -ar 24000 -ac 1 -i tmp.s16le.24000.ac1.pcm  ${outPut}"
      ffmpeg -f s16le -ar 24000 -ac 1 -i tmp.s16le.24000.ac1.pcm  ${outPut}

echo "rm -f tmp.s16le.24000.ac1.pcm"
      rm -f tmp.s16le.24000.ac1.pcm

lameBin=$(which lame)
if [ -n "${lameBin}" ]
then

    echo "${lameBin}     ${outPut}    ${outPut}.mp3"
          ${lameBin}     ${outPut}    ${outPut}.mp3

    echo "rm -f      ${outPut}    "
          rm -f      ${outPut}    
fi
