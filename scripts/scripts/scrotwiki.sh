#!/bin/bash

shot_name=$(echo $(od -An -N3 -i /dev/random))'_scrot.png'
path_to_append="~/vimwiki/screen-grabs/"
scrot $shot_name -e 'mv $f '$path_to_append -s
# $ <command> && echo SUCCESS || echo FAIL
if [ $? -eq 0 ]; then
  echo OK
  # TODO: dumps newline to xclip, to fix
  echo $path_to_append$shot_name | xclip -sel clip
  echo $path_to_append$shot_name" to system clipboard using xclip"
else
  echo "Screen not grabbed"
fi
