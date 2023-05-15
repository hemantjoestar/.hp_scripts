# simple open utility
file=$(readlink -f "$1")
dir=${file%/*}
base="${file%.*}"
ext="${file##*.}"
# echo $file
# echo $dir
# echo $base
# echo $ext


case "$ext" in
  pdf) $PDFREADER $file &;;
  jpeg) $IMAGEREADER $file &;;
  png) $IMAGEREADER $file &;;
  mp4) vlc $file &> /dev/null &;;
esac
