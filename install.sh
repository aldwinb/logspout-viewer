#!/usr/bin/env bash

# get current directory
curr_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# install script
cp -f ${curr_dir}/run-logspout.sh /usr/local/bin/run-logspout
chmod +x /usr/local/bin/run-logspout

# ensure installation directory is in PATH
if ! echo $PATH | egrep /usr/local/bin 1> /dev/null; then
  export PATH=$PATH:/usr/local/bin
fi
