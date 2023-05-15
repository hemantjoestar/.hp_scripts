# parse incoming foldr name
if [ -z "$1"  ]
then
  echo "No argument supplied"
  exit
fi
folder_name=$1
echo $folder_name
# delete folder, used when testing script
# rm -rf $folder_name
# call cargo new <arg1>
cargo new $folder_name
# cd into project
cd $folder_name
# create gdbinit
touch .gdbinit
printf \
  '%s\n' \
  'set startup-with-shell off' \
  'set pagination off' \
  '# set logging file gdb.output' \
  '# set logging on' \
  'set print pretty on' \
  '# Breakpoints Start' \
  'b main' \
  '# Insert comamnds between to display var names, compute expressions, etc. ' \
  '# b main.rs:linenumber' \
  '# commands' \
  '# display <var-name>' \
  '# print  <var-name>' \
  '# end' \
  '# Breakpoints End' \
  '# Run Start till first bp' \
  '# Pass command line args after r if required' \
  'r' \
  '# c if multi breakpoints and want to move to them directly' \
  '# c' \
  '# Run End' \
  > .gdbinit  

printf \
  '%s\n' \
  ' ' \
  '[profile.dev]' \
  'opt-level = 0' \
  'debug = true' \
  ' ' \
  '[profile.release]' \
  'opt-level = 3' \
  'debug = false' \
  >> Cargo.toml
