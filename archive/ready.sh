# 创建对应的陌路
cp -r ../archive /archive
# 创建对应的组
if $(grep Archivers /etc/group 1> /dev/null)
then
	echo "Group is all ready there"
else 
	groupadd Archivers
fi
chgrp Archivers /archive
# ls -ld /archive
# 添加用户到相应的组中
read -p "你想自动添加用户到组中吗？[Y/n]" select

if [ $select = Y -o $select = y -o $select = yes ] 
then 
	read -p "请输入你要添加的用户名： " MYSELF
	echo "add user yo the group"
	usermod -aG Archivers $MYSELF
else
	echo
fi	

#/archive/Hour_Archive.sh





