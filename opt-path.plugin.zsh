# Copyright 2015 John Reese
# Licensed under the MIT license
#
# Automatically add subdirectories from ~/opt to the user's path.

function push_path() {
    echo $PATH | grep -q "\(^$1:\|:$1:\|:$1$\)" || export PATH=$1:$PATH
}

if [ -d ~/opt ]
then
	for optdir in `ls ~/opt/`
	do
		optdirpath=~/opt/$optdir
		if [ -d "$optdirpath" ]
		then
			optdirsubpath=$optdirpath/bin
			if [ -d "$optdirsubpath" ]
			then
				push_path $optdirsubpath
			else
				push_path $optdirpath
			fi
		fi
	done
fi

