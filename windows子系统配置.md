# 一、打开`linux`子系统功能
 1. 打开控制面板
	![在这里插入图片描述](https://img-blog.csdnimg.cn/20200913140757982.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3dlaXhpbl80NDExOTg4MQ==,size_16,color_FFFFFF,t_70#pic_center)
![在这里插入图片描述](https://img-blog.csdnimg.cn/20200913140816199.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3dlaXhpbl80NDExOTg4MQ==,size_16,color_FFFFFF,t_70#pic_center)
![在这里插入图片描述](https://img-blog.csdnimg.cn/20200913140848610.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3dlaXhpbl80NDExOTg4MQ==,size_16,color_FFFFFF,t_70#pic_center)2. 勾选上适用于`Linux`的`windows`子系统，然后重启 ![在这里插入图片描述](https://img-blog.csdnimg.cn/20200913140915315.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3dlaXhpbl80NDExOTg4MQ==,size_16,color_FFFFFF,t_70#pic_center)

# 二、下载`Ubuntu`
1. 打开微软商店
	![在这里插入图片描述](https://img-blog.csdnimg.cn/20200913141116665.png#pic_center)
2. 搜索`Linux`![在这里插入图片描述](https://img-blog.csdnimg.cn/20200913141143547.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3dlaXhpbl80NDExOTg4MQ==,size_16,color_FFFFFF,t_70#pic_center)
3. 下载 `ubuntu`
![在这里插入图片描述](https://img-blog.csdnimg.cn/20200913141345183.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3dlaXhpbl80NDExOTg4MQ==,size_16,color_FFFFFF,t_70#pic_center)
`400`多`M`，下载完，直接启动, 这里装的是20.04
4. 启动进入这个界面，等待一会，然后让你输入一个用户名(创建用户, 假设为`user`)，
	再输入俩次密码，用户创建成功
5. 修改`root`的密码`sudo passwd root`
	测试一下：`su - root`、`su - user` 查看是否切换成功
![在这里插入图片描述](https://img-blog.csdnimg.cn/20200913141555717.png#pic_center)
# 三、配置`Ubuntu`
安装好`ubuntu`,创建完用户，接下来就是`Ubuntu`的一些配置
1. 换源, 这里换清华源
	- 先备份 `cp /etc/apt/sources.list /etc/apt/sources.list.bak `
	- 把[清华源](https://mirror.tuna.tsinghua.edu.cn/help/ubuntu/)的配置内容拷贝到`/etc/apt/sources.list`中(要把原来的内容全部覆盖掉)
		```shell
		# 默认注释了源码镜像以提高 apt update 速度，如有需要可自行取消注释
		deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ focal main restricted universe multiverse
		# deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ focal main restricted universe multiverse
		deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ focal-updates main restricted universe multiverse
		# deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ focal-updates main restricted universe multiverse
		deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ focal-backports main restricted universe multiverse
		# deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ focal-backports main restricted universe multiverse
		deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ focal-security main restricted universe multiverse
		# deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ focal-security main restricted universe multiverse
		
		# 预发布软件源，不建议启用
		# deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ focal-proposed main restricted universe multiverse
		# deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ focal-proposed main restricted universe multiverse
		```
2. `sudo apt update`、 `sudo apt upgrade`
	如果这两步出错，做如下操作，无错，进行第三步:
	`rm /etc/resolv.conf ` #必须删除,因为这是一个链接文件
	`sudo vim /etc/resolv.conf ` #再把下面内容写入这个文件，**一定要确保真正写进去了！**
	```shell
	# Add the lines 
	nameserver 8.8.8.8
	nameserver 8.8.4.4
	```
	`sudo vim /etc/wsl.conf` #在这个文件中写入下面内容
	```shell
	root = /
	options = "metadata"
	[network]
	generateResolvConf = false
	```
	[参考链接](https://www.cnblogs.com/matt1985/p/13435912.html)
		`cat /etc/resolv.conf` 、`cat /etc/wsl.conf`查看一下俩文件的内容是否都写入
		都写入后再执行
		 `sudo apt update`、 
		 `sudo apt upgrade`

3. 安装`gcc`、`g++`
	`sudo apt install gcc`
	`sudo apt install g++`
4. 配置`vim`
	可以在网上搜索教程配置(如`ma6174`的)
	也可以用我的配置文件:
	[Vim配置压缩包](https://kxo.lanzous.com/iOaX5gfjeva)
	因为`c、d、e`等盘都放在`/mnt/`下，假设把压缩包下载到了`windows`桌面：
	执行`cp /mnt/c/Users/***/Desktop/vim.zip .   ` 拷贝到 `~/`下
	然后解压`unzip vim.zip`,如果没有`unzip`, 安装一下：`sudo apt install unzip`
	解压后即配置完毕！![在这里插入图片描述](https://img-blog.csdnimg.cn/20200913150540743.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3dlaXhpbl80NDExOTg4MQ==,size_16,color_FFFFFF,t_70#pic_center)
	5. 修改字体、光标等
		右键打开`ubuntu`的属性和默认值（属性和默认值都设置成一样的）
![在这里插入图片描述](https://img-blog.csdnimg.cn/20200913151825756.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3dlaXhpbl80NDExOTg4MQ==,size_16,color_FFFFFF,t_70#pic_center)

![在这里插入图片描述](https://img-blog.csdnimg.cn/20200913151044213.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3dlaXhpbl80NDExOTg4MQ==,size_16,color_FFFFFF,t_70#pic_center)![在这里插入图片描述](https://img-blog.csdnimg.cn/20200913151123882.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3dlaXhpbl80NDExOTg4MQ==,size_16,color_FFFFFF,t_70#pic_center)
	根据自己的喜好设置字体什么的
	但是`vim`写一个文件时，里面的字体还会变为宋体也就是我们的设置不生效，这时要修改一下注册表
![在这里插入图片描述](https://img-blog.csdnimg.cn/20200913152133125.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3dlaXhpbl80NDExOTg4MQ==,size_16,color_FFFFFF,t_70#pic_center)
找到`计算机\HKEY_CURRENT_USER\Console\C:_Program Files_WindowsApps_CanonicalGroupLimited.UbuntuonWindows_2004.2020.812.0_x64__79rhkp1fndgsc_ubuntu.exe`
![在这里插入图片描述](https://img-blog.csdnimg.cn/20200913152215121.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3dlaXhpbl80NDExOTg4MQ==,size_16,color_FFFFFF,t_70#pic_center)
在里面新建`CodePage`，右键编辑
![在这里插入图片描述](https://img-blog.csdnimg.cn/20200913152411666.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3dlaXhpbl80NDExOTg4MQ==,size_16,color_FFFFFF,t_70#pic_center)
![在这里插入图片描述](https://img-blog.csdnimg.cn/20200913152514545.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3dlaXhpbl80NDExOTg4MQ==,size_16,color_FFFFFF,t_70#pic_center)
重新打开`ubuntu`

6. `ls` 去掉目录的背景色
	[参考文章](https://blog.csdn.net/weixin_44119881/article/details/108431593)
7. 修改主机名
	这个得修改`windows`的主机名、这个不写了，有`sqlserver`的谨慎修改
8. 免密登录云主机
	` ssh-keygen`
	`ssh-copy-id   username@ip`

.... 基本完事，有问题留言。
