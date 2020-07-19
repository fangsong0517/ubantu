#!/bin/bash
git status
 
while true;
do
	read -r -p "是否继续提交? [Y/n] " input
 
	case $input in
	    [yY][eE][sS]|[yY])
			echo "继续提交"
			git add -A
			git commit -m $1
			git push origin $2
                        exit 1
			;;
 
	    [nN][oO]|[nN])
			echo "中断提交"
			exit 1
	       		;;
 
	    *)
		echo "输入错误，请重新输入"
		;;
	esac
done
