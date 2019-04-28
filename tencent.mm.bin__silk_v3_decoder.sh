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

outPut=$(basename $1).wav
lameBin=$(which lame)

echo "silk_v3_decoder__tencent.mm.bin $1"
      silk_v3_decoder__tencent.mm.bin $1

      if  [ 2 = 3 ]
      then

          echo "ffmpeg -f s16le -ar 24000 -ac 1 -i tmp.s16le.24000.ac1.pcm  ${outPut}"
          ffmpeg -f s16le -ar 24000 -ac 1 -i tmp.s16le.24000.ac1.pcm  ${outPut}

          echo "rm -f tmp.s16le.24000.ac1.pcm"
          rm -f tmp.s16le.24000.ac1.pcm

          if [ -n "${lameBin}" ]
          then

              echo "${lameBin}     ${outPut}    ${outPut}.mp3"
                    ${lameBin}     ${outPut}    ${outPut}.mp3

              echo "rm -f      ${outPut}    "
              rm -f      ${outPut}    
          fi
      else
          if [ -n "${lameBin}" ]
          then

              echo "${lameBin}     -r -s 24 -m mono --bitwidth 16 --signed --little-endian  tmp.s16le.24000.ac1.pcm    ${outPut}.mp3"
                    ${lameBin}     -r -s 24 -m mono --bitwidth 16 --signed --little-endian  tmp.s16le.24000.ac1.pcm    ${outPut}.mp3

              echo "rm -f      tmp.s16le.24000.ac1.pcm    "
                    rm -f      tmp.s16le.24000.ac1.pcm    

              echo
              echo "AUDIODEV=plughw:1 ffplay   -autoexit   ${outPut}.mp3    "
              echo
          fi
      fi
