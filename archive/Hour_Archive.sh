#!/bin/bash
CONFIG_FILE=/archive/File_To_Back
BASEDEST=/archive/hourly
DAY=$(date +%d)
MONTH=$(date +%m)
TIME=$(date +%k%M)

mkdir -p $BASEDEST/$MONTH/$DAY

DESTINATION=$BASEDEST/$MONTH/$DAY/archive$TIME.tar.gz

if [ -f $CONFIG_FILE ]
then
	echo
else 
	echo
	echo "$CONFIG_FILE dose not exits"
	echo "Backup not completed due to missing Configuration File" 
	echo
	exit
fi

FILE_NO=1
exec < $CONFIG_FILE
read FILE_NAME
while [ $? -eq 0 ]
do
	if [ -f $FILE_NAME -o -d $FILE_NAME ]
	then
		FILE_LIST="$FILE_LIST $FILE_NAME"

	else
		echo
		echo "$FILE_NAME doesn't exit"
		echo "Obviously, I will not include it in this archive."
		echo "It is listed on line $FILE_NO of the config file."
		echo "Continuing to build archive list..."
		echo
	fi
	FILE_NO=$[ $FILE_NO + 1 ]
	read FILE_NAME
done

echo "Starting archive..."
echo 
tar -czf $DESTINATION $FILE_LIST 2> /dev/null
echo "$FILE_LIST"
echo "Archive complete"
echo "Resulting archive file is: $DESTINATION"
echo
exit 




