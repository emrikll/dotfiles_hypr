#!/usr/bin/env bash

if [ "$#" -eq 0 ] ; then
  IFS=$'\n'; set -f # changes file delimiter to newline instead of space
  for pdf in $(find ~/pdfs/ -name '*.pdf'); do 
    echo "${pdf}" | sed 's/\/home\/emrik\/pdfs\///g' | sed 's/\.pdf//g'
  done
  unset IFS; set +f
else
    hyprctl dispatch exec "zathura ~/pdfs/$1.pdf" &>/dev/null
fi

exit 0
