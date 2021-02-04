#!/usr/bin/env bash

/app/aserto-one version

src=$INPUT_SOURCE
opt=$INPUT_OPTIONS
dst=$INPUT_TARGET

mkdir -p ${INPUT_TARGET%/*}

cwd=$PWD
cmd="/app/aserto-one build . --bundle --output $cwd/$dst $opt"

e_code=0
cd $src
echo "cdw  [$cdw]"
echo "exec [$cmd]"
printf "\n"
eval "$cmd" || e_code=1
cd $cwd

exit $e_code