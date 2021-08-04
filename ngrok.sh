#!/bin/bash
######## 在自己的服务器上搭建内网穿透
######## 脚本转自 https://blog.csdn.net/yjc_1111/article/details/79353718

###### ubuntu ######
#apt-get install build-essential golang mercurial git

###### centos ######
#yum install golang git 

git clone https://github.com/tutumcloud/ngrok.git ngrok

cd ngrok

NGROK_DOMAIN="你的域名"

###### 自己生成证书部分(如网站有证书这步可以跳过) ########
openssl genrsa -out base.key 2048

openssl req -new -x509 -nodes -key base.key -days 10000 -subj "/CN=$NGROK_DOMAIN" -out base.pem

openssl genrsa -out server.key 2048

openssl req -new -key server.key -subj "/CN=$NGROK_DOMAIN" -out server.csr

openssl x509 -req -in server.csr -CA base.pem -CAkey base.key -CAcreateserial -days 10000 -out server.crt

cp base.pem assets/client/tls/ngrokroot.crt

###### 编译服务端和客户端 ######
make release-server release-client

######  服务启动 ######
./bin/ngrokd -tlsKey=server.key -tlsCrt=server.crt -domain="$NGROK_DOMAIN" -httpAddr=":8080" -httpsAddr=":443"

###### 编译其他客户端 ######
#GOOS=windows GOARCH=amd64 make release-client
#GOOS=linux GOARCH=arm make release-client

###### 常见问题 ######
#客户端错误 control recovering from failure x509: certificate relies on legacy Common Name field, use SANs or temporarily enable Common Name matching with GODEBUG=x509ignoreCN=0 
#这个是go版本问题，设置环境变量GODEBUG=x509ignoreCN=0或去申请正规的ssl证书, eg: linux下设置环境变量 export GODEBUG=x509ignoreCN=0

#使用自己申请的ssl证书
#只需要把自己申请的网站证书.crt文件复制一份覆盖到assets/client/tls/ngrokroot.crt然后重新编译客户端并且重启ngrok服务即可

# ngrok监听ssh
# 客户端加上参数 -proto=tcp 22即可
