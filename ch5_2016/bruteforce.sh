#!/bin/sh

# this is the current timestamp
#prev=1474166371
#cur=1474166371

# this was the timestamp used to generate master key, and thus generate the secret
cur=1473014616
prev=1473014616

while true
do
	sed -i 's/set $eax='$prev'/set $eax='$cur'/g' gdbcmds
	gdb < gdbcmds
	if cmp -s "1563276313.key.target" "1563276313.key" > /dev/null; then
		echo "Found it!"
		echo $cur
		break
	fi
	prev=$cur
	cur=`expr $cur - 1`
done
