#!/bin/bash

CHECK_DIRECTORIES=" /var/log /home*"
DATE=$(date +%m%d%y)
exec > disk_space_$DATE.rpt

echo "Top ten Disk Space Usage"
echo "For $CHECK_DIRECTORIES Directories"

for DIR_CHECK in $CHECK_DIRECTORIES 
do 
	echo ""
	echo "The $DIR_CHECK Directory:"
	du -S $DIR_CHECK 2>/dev/null | 
	sort -rn |
	sed '{11,$D; =}' |
	sed 'N; s/\n/ /' |
	gawk '{printf $1":" "\t" $2 "\t" $3 "\n" }'
done
exit




