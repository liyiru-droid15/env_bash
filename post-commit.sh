#!/bin/sh

###### 配置svn钩子 ######
export LANG=en_US.UTF-8
SVN=/usr/bin/svn            #这里配置的是svn安装bin目录下的svn文件
WEB=/yourpath/web           #要更新的目录
$SVN update $WEB --username youraccount --password yourpassword



