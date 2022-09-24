#!/bin/bash
<<INFO
SCRIPYT:test.sh
AUTHOR:AyeSt0
DATE:2022-09-24
DESCRIBE:One click installation of rabbit
SYSTEM:linux
WARNING:This script is only used for testing, learning and research. It is not allowed to be used for commercial purposes. Its legitimacy, accuracy, integrity and effectiveness cannot be guaranteed. Please make your own judgment according to the situation. The original author's warehouse address is https://github.com/HT944/MadRabbit
VERSION:1.0.0<可选>
MODIFY:debug
INFO
clear
trap "" 2 3 15
uUser=$(whoami)
dDate=$(date +%d/%m/%Y)
function system_Judgment (){
    uNames=$(sudo uname -a)
    syosNames='synology'
    if [[ $uNames =~ $syosNames ]];then
      echo -e "\033[32m 检测到群晖\033[0m"
      echo -e "跳转至 \033[42;37m 群晖一键安装脚本 \033[0m"
      Synology_menu
    else
      echo -e "\033[32m 检测到云服务器\033[0m"
      echo -e "跳转至 \033[42;37m 云服务器一键安装脚本 \033[0m"
      Cloud_menu
    fi
}

function Cloud_menu (){

cat << eof

`echo -e "\033[36m----------------------------------------\033[0m"`
`echo -e "\033[36m     User:$uUser        Date:$dDate     \033[0m"`

`echo -e "\033[36m|    欢迎使用【Rabbit一键安装脚本】    |\033[0m"`
`echo -e "\033[36m|    v1.0.0                 by AyeSt0  |\033[0m"`

`echo -e "\033[36m----------------------------------------\033[0m"`
`echo -e "\033[33m 请选择您的Rabbit运行环境\033[0m"`

`echo -e "\033[32m 【1】国内鸡\033[0m"`

`echo -e "\033[32m 【2】国外鸡\033[0m"`

`echo -e "\033[31m 【3】退出安装\033[0m"`

eof

read -p "请输入对应选项的数字：" num1

case $num1 in

1)

Cloud_menu_gn_ql

;;

2)

Cloud_menu_gw_ql

;;

3)

exit 0

esac

}

function Cloud_menu_gn_ql ()

{

cat << eof

`echo -e "\033[33m 请选择您的青龙配置\033[0m"`

`echo -e "\033[32m 【1】单青龙\033[0m"`

`echo -e "\033[32m 【2】多青龙\033[0m"`

`echo -e "\033[32m 【3】不配置青龙\033[0m"`

eof

read -p "请输入对应选项的数字：" num11

case $num11 in

1)

gn_run_qlone

;;

2)

gn_run_qlmany

;;

3)

gn_run_qlno

esac

}

function Cloud_menu_gw_ql ()
{

cat << eof

`echo -e "\033[33m 请选择您的青龙配置\033[0m"`

`echo -e "\033[32m 【1】单青龙\033[0m"`

`echo -e "\033[32m 【2】多青龙\033[0m"`

`echo -e "\033[32m 【3】不配置青龙\033[0m"`

eof

read -p "请输入对应选项的数字：" num12

case $num12 in

1)

gw_run_qlone

;;

2)

gw_run_qlmany

;;

3)

gw_run_qlno

esac

}
function Synology_menu ()

{

cat << eof

`echo -e "\033[36m----------------------------------------\033[0m"`
`echo -e "\033[36m     User:$uUser        Date:$dDate     \033[0m"`

`echo -e "\033[36m|  欢迎使用【Rabbit群晖一键安装脚本】  |\033[0m"`

`echo -e "\033[36m----------------------------------------\033[0m"`
`echo -e "\033[33m 请选择您的Rabbit运行环境\033[0m"`

`echo -e "\033[32m 【1】安装\033[0m"`

`echo -e "\033[31m 【2】退出安装\033[0m"`

eof

read -p "请输入对应选项的数字：" num2

case $num2 in

1)

Synology_menu_ql

;;

2)

exit 0

esac

}
function Synology_menu_ql ()

{

cat << eof

`echo -e "\033[33m 请选择您的青龙配置\033[0m"`

`echo -e "\033[32m 【1】单青龙\033[0m"`

`echo -e "\033[32m 【2】多青龙\033[0m"`

`echo -e "\033[32m 【3】不配置青龙\033[0m"`

eof

read -p "请输入对应选项的数字：" num11

case $num11 in

1)

sy_run_qlone

;;

2)

sy_run_qlmany

;;

3)

sy_run_qlno

esac

}

function gn_run_qlone()
{

echo -e "\033[33m 请选择Rabbit安装路径【默认/root】\033[0m" && read rabbitAbsolutepath
if [ -z "${rabbitAbsolutepath}" ];then
    rabbitAbsolutepath='/root'
fi
if [ ! -d "$rabbitAbsolutepath" ]; then
    echo -e "\033[43;37m 该目录不存在，创建目录中... \033[0m" 
    mkdir -p $rabbitAbsolutepath
fi
cd $rabbitAbsolutepath 
mkdir -p Rabbit 
cd Rabbit
cd $rabbitAbsolutepath/Rabbit && mkdir -p  Config
if [ ! -f "$rabbitAbsolutepath/Rabbit/Config/Config.json" ]; then
    echo -e "\033[33m GitHub加速地址【默认https://ghproxy.com】\033[0m" && read rabbitProxyurl
    if [ -z "${rabbitProxyurl}" ];then
    rabbitProxyurl='https://ghproxy.com'
    fi
    cd $rabbitAbsolutepath/Rabbit/Config && wget -O Config.json  $rabbitProxyurl/https://raw.githubusercontent.com/ht944/MadRabbit/main/oneConfig.json
    if [ ! -f "$rabbitAbsolutepath/Rabbit/Config/Config.json" ]; then
    echo -e "\033[41;37m 下载失败...退出脚本 \033[0m" 
    exit 0
    else echo -e "\033[42;37m 下载成功 \033[0m"
    fi
    else echo -e "\033[42;37m 该目录已存在配置文件，跳过下载... \033[0m"
fi
echo -e "\033[33m 容器端口【默认5701】\033[0m" && read rabbitPort
if [ -z "${rabbitPort}" ];then
    rabbitPort='5701'
fi
osCore=$(uname -m)
armosCore='arm'
echo -e "检测内核为 \033[34m $osCore \033[0m ,准备安装..."
if [[ $osCore =~ $armosCore ]];then
    osCoreurl='MadRabbit_arm'
    rabbitVersion='arm'
    echo -e "准备安装 \033[37m arm版本... \033[0m"
else
    osCoreurl='MadRabbit_amd'
    rabbitVersion='latest'
fi

echo "检查Docker是否已安装……"
docker -v
if [ $? -ne  0 ]; then
	echo "检测到Docker未安装！"
	echo
	echo " ***** 开始安装 docker 工具 ***** "
	sudo yum update
	#判断系统
	if [ $? -eq 0 ]; then
	   yum -y install docker
	   service docker start
	else
       sudo apt-get install -y docker.io
       systemctl start docker
       systemctl enable docker
       systemctl status docker
    fi
    docker -v
    if [ $? -ne  0 ]; then
       echo -e "\033[41;37m 下载失败...退出脚本 \033[0m"
       exit 0
    else
       echo " ***** 安装 docker 工具完成 ***** "
       echo "docker 已安装！"
    fi
fi
echo -e "\033[43;37m 正在安装容器到docker... \033[0m"
sudo docker run --name rabbit -p $rabbitPort:1234  -d  -v  $rabbitAbsolutepath/Rabbit/Config:/$osCoreurl/Config -it --privileged=true  --restart=always  ht944/rabbit:$rabbitVersion
if [ $? -ne  0 ]; then
   echo -e "\033[41;37m 安装失败...退出脚本 \033[0m"
else
   echo -e "\033[42;37m 恭喜你安装成功！！！！！！\033[0m"
   echo -e "\033[33m 请到$rabbitAbsolutepath/Rabbit/Config目录下修改配置文件 \033[0m"
   echo -e "\033[33m 然后使用命令\033[0m \033[32m docker restart rabbit\033[0m \033[33m重启更新配置\033[0m"
fi

}

function gn_run_qlmany()
{

echo -e "\033[33m 请选择Rabbit安装路径【默认/root】\033[0m" && read rabbitAbsolutepath
if [ -z "${rabbitAbsolutepath}" ];then
    rabbitAbsolutepath='/root'
fi
if [ ! -d "$rabbitAbsolutepath" ]; then
    echo -e "\033[43;37m 该目录不存在，创建目录中... \033[0m" 
    mkdir -p $rabbitAbsolutepath
fi
cd $rabbitAbsolutepath 
mkdir -p Rabbit 
cd Rabbit
cd $rabbitAbsolutepath/Rabbit && mkdir -p  Config
if [ ! -f "$rabbitAbsolutepath/Rabbit/Config/Config.json" ]; then
    echo -e "\033[33m GitHub加速地址【默认https://ghproxy.com】\033[0m" && read rabbitProxyurl
    if [ -z "${rabbitProxyurl}" ];then
    rabbitProxyurl='https://ghproxy.com'
    fi
    cd $rabbitAbsolutepath/Rabbit/Config && wget -O Config.json  $rabbitProxyurl/https://raw.githubusercontent.com/ht944/MadRabbit/main/manyConfig.json
    if [ ! -f "$rabbitAbsolutepath/Rabbit/Config/Config.json" ]; then
    echo -e "\033[41;37m 下载失败...退出脚本 \033[0m" 
    exit 0
    else echo -e "\033[42;37m 下载成功 \033[0m"
    fi
    else echo -e "\033[42;37m 该目录已存在配置文件，跳过下载... \033[0m"
fi
echo -e "\033[33m 容器端口【默认5701】\033[0m" && read rabbitPort
if [ -z "${rabbitPort}" ];then
    rabbitPort='5701'
fi
osCore=$(uname -m)
armosCore='arm'
echo -e "检测内核为 \033[34m $osCore \033[0m ,准备安装..."
if [[ $osCore =~ $armosCore ]];then
    osCoreurl='MadRabbit_arm'
    rabbitVersion='arm'
    echo -e "准备安装 \033[37m arm版本... \033[0m"
else
    osCoreurl='MadRabbit_amd'
    rabbitVersion='latest'
fi

echo "检查Docker是否已安装……"
docker -v
if [ $? -ne  0 ]; then
	echo "检测到Docker未安装！"
	echo
	echo " ***** 开始安装 docker 工具 ***** "
	sudo yum update
	#判断系统
	if [ $? -eq 0 ]; then
	   yum -y install docker
	   service docker start
	else
       sudo apt-get install -y docker.io
       systemctl start docker
       systemctl enable docker
       systemctl status docker
    fi
    docker -v
    if [ $? -ne  0 ]; then
       echo -e "\033[41;37m 下载失败...退出脚本 \033[0m"
       exit 0
    else
       echo " ***** 安装 docker 工具完成 ***** "
       echo "docker 已安装！"
    fi
fi
echo -e "\033[43;37m 正在安装容器到docker... \033[0m"
sudo docker run --name rabbit -p $rabbitPort:1234  -d  -v  $rabbitAbsolutepath/Rabbit/Config:/$osCoreurl/Config -it --privileged=true  --restart=always  ht944/rabbit:$rabbitVersion
if [ $? -ne  0 ]; then
   echo -e "\033[41;37m 安装失败...退出脚本 \033[0m"
else
   echo -e "\033[42;37m 恭喜你安装成功！！！！！！\033[0m"
   echo -e "\033[33m 请到$rabbitAbsolutepath/Rabbit/Config目录下修改配置文件 \033[0m"
   echo -e "\033[33m 然后使用命令\033[0m \033[32m docker restart rabbit\033[0m \033[33m重启更新配置\033[0m"
fi

}

function gn_run_qlno()
{

echo -e "\033[33m 请选择Rabbit安装路径【默认/root】\033[0m" && read rabbitAbsolutepath
if [ -z "${rabbitAbsolutepath}" ];then
    rabbitAbsolutepath='/root'
fi
if [ ! -d "$rabbitAbsolutepath" ]; then
    echo -e "\033[43;37m 该目录不存在，创建目录中... \033[0m" 
    mkdir -p $rabbitAbsolutepath
fi
cd $rabbitAbsolutepath 
mkdir -p Rabbit 
cd Rabbit
cd $rabbitAbsolutepath/Rabbit && mkdir -p  Config
if [ ! -f "$rabbitAbsolutepath/Rabbit/Config/Config.json" ]; then
    echo -e "\033[33m GitHub加速地址【默认https://ghproxy.com】\033[0m" && read rabbitProxyurl
    if [ -z "${rabbitProxyurl}" ];then
    rabbitProxyurl='https://ghproxy.com'
    fi
    cd $rabbitAbsolutepath/Rabbit/Config && wget -O Config.json  $rabbitProxyurl/https://raw.githubusercontent.com/ht944/MadRabbit/main/noConfig.json
    if [ ! -f "$rabbitAbsolutepath/Rabbit/Config/Config.json" ]; then
    echo -e "\033[41;37m 下载失败...退出脚本 \033[0m" 
    exit 0
    else echo -e "\033[42;37m 下载成功 \033[0m"
    fi
    else echo -e "\033[42;37m 该目录已存在配置文件，跳过下载... \033[0m"
fi
echo -e "\033[33m 容器端口【默认5701】\033[0m" && read rabbitPort
if [ -z "${rabbitPort}" ];then
    rabbitPort='5701'
fi
osCore=$(uname -m)
armosCore='arm'
echo -e "检测内核为 \033[34m $osCore \033[0m ,准备安装..."
if [[ $osCore =~ $armosCore ]];then
    osCoreurl='MadRabbit_arm'
    rabbitVersion='arm'
    echo -e "准备安装 \033[37m arm版本... \033[0m"
else
    osCoreurl='MadRabbit_amd'
    rabbitVersion='latest'
fi

echo "检查Docker是否已安装……"
docker -v
if [ $? -ne  0 ]; then
	echo "检测到Docker未安装！"
	echo
	echo " ***** 开始安装 docker 工具 ***** "
	sudo yum update
	#判断系统
	if [ $? -eq 0 ]; then
	   yum -y install docker
	   service docker start
	else
       sudo apt-get install -y docker.io
       systemctl start docker
       systemctl enable docker
       systemctl status docker
    fi
    docker -v
    if [ $? -ne  0 ]; then
       echo -e "\033[41;37m 下载失败...退出脚本 \033[0m"
       exit 0
    else
       echo " ***** 安装 docker 工具完成 ***** "
       echo "docker 已安装！"
    fi
fi
echo -e "\033[43;37m 正在安装容器到docker... \033[0m"
sudo docker run --name rabbit -p $rabbitPort:1234  -d  -v  $rabbitAbsolutepath/Rabbit/Config:/$osCoreurl/Config -it --privileged=true  --restart=always  ht944/rabbit:$rabbitVersion
if [ $? -ne  0 ]; then
   echo -e "\033[41;37m 安装失败...退出脚本 \033[0m"
else
   echo -e "\033[42;37m 恭喜你安装成功！！！！！！\033[0m"
   echo -e "\033[33m 请到$rabbitAbsolutepath/Rabbit/Config目录下修改配置文件 \033[0m"
   echo -e "\033[33m 然后使用命令\033[0m \033[32m docker restart rabbit\033[0m \033[33m重启更新配置\033[0m"
fi


}
function gw_run_qlone(){
    
echo -e "\033[33m 请选择Rabbit安装路径【默认/root】\033[0m" && read rabbitAbsolutepath
if [ -z "${rabbitAbsolutepath}" ];then
    rabbitAbsolutepath='/root'
fi
if [ ! -d "$rabbitAbsolutepath" ]; then
    echo -e "\033[43;37m 该目录不存在，创建目录中... \033[0m" 
    mkdir -p $rabbitAbsolutepath
fi
cd $rabbitAbsolutepath 
mkdir -p Rabbit 
cd Rabbit
cd $rabbitAbsolutepath/Rabbit && mkdir -p  Config
if [ ! -f "$rabbitAbsolutepath/Rabbit/Config/Config.json" ]; then
    cd $rabbitAbsolutepath/Rabbit/Config && wget -O Config.json  https://raw.githubusercontent.com/ht944/MadRabbit/main/oneConfig.json
    if [ ! -f "$rabbitAbsolutepath/Rabbit/Config/Config.json" ]; then
    echo -e "\033[41;37m 下载失败...退出脚本 \033[0m" 
    exit 0
    else echo -e "\033[42;37m 下载成功 \033[0m"
    fi
    else echo -e "\033[42;37m 该目录已存在配置文件，跳过下载... \033[0m"
fi
echo -e "\033[33m 容器端口【默认5701】\033[0m" && read rabbitPort
if [ -z "${rabbitPort}" ];then
    rabbitPort='5701'
fi
osCore=$(uname -m)
armosCore='arm'
echo -e "检测内核为 \033[34m $osCore \033[0m ,准备安装..."
if [[ $osCore =~ $armosCore ]];then
    osCoreurl='MadRabbit_arm'
    rabbitVersion='arm'
    echo -e "准备安装 \033[37m arm版本... \033[0m"
else
    osCoreurl='MadRabbit_amd'
    rabbitVersion='latest'
fi

echo "检查Docker是否已安装……"
docker -v
if [ $? -ne  0 ]; then
	echo "检测到Docker未安装！"
	echo
	echo " ***** 开始安装 docker 工具 ***** "
	sudo yum update
	#判断系统
	if [ $? -eq 0 ]; then
	   yum -y install docker
	   service docker start
	else
       sudo apt-get install -y docker.io
       systemctl start docker
       systemctl enable docker
       systemctl status docker
    fi
    docker -v
    if [ $? -ne  0 ]; then
       echo -e "\033[41;37m 下载失败...退出脚本 \033[0m"
       exit 0
    else
       echo " ***** 安装 docker 工具完成 ***** "
       echo "docker 已安装！"
    fi
fi
echo -e "\033[43;37m 正在安装容器到docker... \033[0m"
sudo docker run --name rabbit -p $rabbitPort:1234  -d  -v  $rabbitAbsolutepath/Rabbit/Config:/$osCoreurl/Config -it --privileged=true  --restart=always  ht944/rabbit:$rabbitVersion
if [ $? -ne  0 ]; then
   echo -e "\033[41;37m 安装失败...退出脚本 \033[0m"
else
   echo -e "\033[42;37m 恭喜你安装成功！！！！！！\033[0m"
   echo -e "\033[33m 请到$rabbitAbsolutepath/Rabbit/Config目录下修改配置文件 \033[0m"
   echo -e "\033[33m 然后使用命令\033[0m \033[32m docker restart rabbit\033[0m \033[33m重启更新配置\033[0m"
fi

}
function gw_run_qlmany(){

echo -e "\033[33m 请选择Rabbit安装路径【默认/root】\033[0m" && read rabbitAbsolutepath
if [ -z "${rabbitAbsolutepath}" ];then
    rabbitAbsolutepath='/root'
fi
if [ ! -d "$rabbitAbsolutepath" ]; then
    echo -e "\033[43;37m 该目录不存在，创建目录中... \033[0m" 
    mkdir -p $rabbitAbsolutepath
fi
cd $rabbitAbsolutepath 
mkdir -p Rabbit 
cd Rabbit
cd $rabbitAbsolutepath/Rabbit && mkdir -p  Config
if [ ! -f "$rabbitAbsolutepath/Rabbit/Config/Config.json" ]; then
    cd $rabbitAbsolutepath/Rabbit/Config && wget -O Config.json  https://raw.githubusercontent.com/ht944/MadRabbit/main/manyConfig.json
    if [ ! -f "$rabbitAbsolutepath/Rabbit/Config/Config.json" ]; then
    echo -e "\033[41;37m 下载失败...退出脚本 \033[0m" 
    exit 0
    else echo -e "\033[42;37m 下载成功 \033[0m"
    fi
    else echo -e "\033[42;37m 该目录已存在配置文件，跳过下载... \033[0m"
fi
echo -e "\033[33m 容器端口【默认5701】\033[0m" && read rabbitPort
if [ -z "${rabbitPort}" ];then
    rabbitPort='5701'
fi
osCore=$(uname -m)
armosCore='arm'
echo -e "检测内核为 \033[34m $osCore \033[0m ,准备安装..."
if [[ $osCore =~ $armosCore ]];then
    osCoreurl='MadRabbit_arm'
    rabbitVersion='arm'
    echo -e "准备安装 \033[37m arm版本... \033[0m"
else
    osCoreurl='MadRabbit_amd'
    rabbitVersion='latest'
fi

echo "检查Docker是否已安装……"
docker -v
if [ $? -ne  0 ]; then
	echo "检测到Docker未安装！"
	echo
	echo " ***** 开始安装 docker 工具 ***** "
	sudo yum update
	#判断系统
	if [ $? -eq 0 ]; then
	   yum -y install docker
	   service docker start
	else
       sudo apt-get install -y docker.io
       systemctl start docker
       systemctl enable docker
       systemctl status docker
    fi
    docker -v
    if [ $? -ne  0 ]; then
       echo -e "\033[41;37m 下载失败...退出脚本 \033[0m"
       exit 0
    else
       echo " ***** 安装 docker 工具完成 ***** "
       echo "docker 已安装！"
    fi
fi
echo -e "\033[43;37m 正在安装容器到docker... \033[0m"
sudo docker run --name rabbit -p $rabbitPort:1234  -d  -v  $rabbitAbsolutepath/Rabbit/Config:/$osCoreurl/Config -it --privileged=true  --restart=always  ht944/rabbit:$rabbitVersion
if [ $? -ne  0 ]; then
   echo -e "\033[41;37m 安装失败...退出脚本 \033[0m"
else
   echo -e "\033[42;37m 恭喜你安装成功！！！！！！\033[0m"
   echo -e "\033[33m 请到$rabbitAbsolutepath/Rabbit/Config目录下修改配置文件 \033[0m"
   echo -e "\033[33m 然后使用命令\033[0m \033[32m docker restart rabbit\033[0m \033[33m重启更新配置\033[0m"
fi

}

function gw_run_qlno(){
    
echo -e "\033[33m 请选择Rabbit安装路径【默认/root】\033[0m" && read rabbitAbsolutepath
if [ -z "${rabbitAbsolutepath}" ];then
    rabbitAbsolutepath='/root'
fi
if [ ! -d "$rabbitAbsolutepath" ]; then
    echo -e "\033[43;37m 该目录不存在，创建目录中... \033[0m" 
    mkdir -p $rabbitAbsolutepath
fi
cd $rabbitAbsolutepath 
mkdir -p Rabbit 
cd Rabbit
cd $rabbitAbsolutepath/Rabbit && mkdir -p  Config
if [ ! -f "$rabbitAbsolutepath/Rabbit/Config/Config.json" ]; then
    cd $rabbitAbsolutepath/Rabbit/Config && wget -O Config.json  https://raw.githubusercontent.com/ht944/MadRabbit/main/noConfig.json
    if [ ! -f "$rabbitAbsolutepath/Rabbit/Config/Config.json" ]; then
    echo -e "\033[41;37m 下载失败...退出脚本 \033[0m" 
    exit 0
    else echo -e "\033[42;37m 下载成功 \033[0m"
    fi
    else echo -e "\033[42;37m 该目录已存在配置文件，跳过下载... \033[0m"
fi
echo -e "\033[33m 容器端口【默认5701】\033[0m" && read rabbitPort
if [ -z "${rabbitPort}" ];then
    rabbitPort='5701'
fi
osCore=$(uname -m)
armosCore='arm'
echo -e "检测内核为 \033[34m $osCore \033[0m ,准备安装..."
if [[ $osCore =~ $armosCore ]];then
    osCoreurl='MadRabbit_arm'
    rabbitVersion='arm'
    echo -e "准备安装 \033[37m arm版本... \033[0m"
else
    osCoreurl='MadRabbit_amd'
    rabbitVersion='latest'
fi

echo "检查Docker是否已安装……"
docker -v
if [ $? -ne  0 ]; then
	echo "检测到Docker未安装！"
	echo
	echo " ***** 开始安装 docker 工具 ***** "
	sudo yum update
	#判断系统
	if [ $? -eq 0 ]; then
	   yum -y install docker
	   service docker start
	else
       sudo apt-get install -y docker.io
       systemctl start docker
       systemctl enable docker
       systemctl status docker
    fi
    docker -v
    if [ $? -ne  0 ]; then
       echo -e "\033[41;37m 下载失败...退出脚本 \033[0m"
       exit 0
    else
       echo " ***** 安装 docker 工具完成 ***** "
       echo "docker 已安装！"
    fi
fi
echo -e "\033[43;37m 正在安装容器到docker... \033[0m"
sudo docker run --name rabbit -p $rabbitPort:1234  -d  -v  $rabbitAbsolutepath/Rabbit/Config:/$osCoreurl/Config -it --privileged=true  --restart=always  ht944/rabbit:$rabbitVersion
if [ $? -ne  0 ]; then
   echo -e "\033[41;37m 安装失败...退出脚本 \033[0m"
else
   echo -e "\033[42;37m 恭喜你安装成功！！！！！！\033[0m"
   echo -e "\033[33m 请到$rabbitAbsolutepath/Rabbit/Config目录下修改配置文件 \033[0m"
   echo -e "\033[33m 然后使用命令\033[0m \033[32m docker restart rabbit\033[0m \033[33m重启更新配置\033[0m"
fi
}

function sy_run_qlone()
{

echo -e "\033[33m 请选择Rabbit安装路径【默认/volume1/docker】\033[0m" && read rabbitAbsolutepath
if [ -z "${rabbitAbsolutepath}" ];then
    rabbitAbsolutepath='/volume1/docker'
fi
if [ ! -d "$rabbitAbsolutepath" ]; then
    echo -e "\033[43;37m 该目录不存在，创建目录中... \033[0m" 
    mkdir -p $rabbitAbsolutepath
fi
cd $rabbitAbsolutepath 
mkdir -p Rabbit 
cd Rabbit
cd $rabbitAbsolutepath/Rabbit && mkdir -p  Config
if [ ! -f "$rabbitAbsolutepath/Rabbit/Config/Config.json" ]; then
    echo -e "\033[33m GitHub加速地址【默认https://ghproxy.com】\033[0m" && read rabbitProxyurl
    if [ -z "${rabbitProxyurl}" ];then
    rabbitProxyurl='https://ghproxy.com'
    fi
    cd $rabbitAbsolutepath/Rabbit/Config && wget -O Config.json  $rabbitProxyurl/https://raw.githubusercontent.com/ht944/MadRabbit/main/oneConfig.json
    if [ ! -f "$rabbitAbsolutepath/Rabbit/Config/Config.json" ]; then
    echo -e "\033[41;37m 下载失败...退出脚本 \033[0m" 
    exit 0
    else echo -e "\033[42;37m 下载成功 \033[0m"
    fi
    else echo -e "\033[42;37m 该目录已存在配置文件，跳过下载... \033[0m"
fi
echo -e "\033[33m 容器端口【默认5701】\033[0m" && read rabbitPort
if [ -z "${rabbitPort}" ];then
    rabbitPort='5701'
fi
osCore=$(uname -m)
armosCore='arm'
echo -e "检测内核为 \033[34m $osCore \033[0m ,准备安装..."
if [[ $osCore =~ $armosCore ]];then
    osCoreurl='MadRabbit_arm'
    rabbitVersion='arm'
    echo -e "准备安装 \033[37m arm版本... \033[0m"
else
    osCoreurl='MadRabbit_amd'
    rabbitVersion='latest'
fi

echo -e "\033[43;37m 正在安装容器到docker... \033[0m"
sudo docker run --name rabbit -p $rabbitPort:1234  -d  -v  $rabbitAbsolutepath/Rabbit/Config:/$osCoreurl/Config -it --privileged=true  --restart=always  ht944/rabbit:$rabbitVersion
if [ $? -ne  0 ]; then
   echo -e "\033[41;37m 安装失败...退出脚本 \033[0m"
else
   echo -e "\033[42;37m 恭喜你安装成功！！！！！！\033[0m"
   echo -e "\033[33m 请到$rabbitAbsolutepath/Rabbit/Config目录下修改配置文件 \033[0m"
   echo -e "\033[33m 然后使用命令\033[0m \033[32m docker restart rabbit\033[0m \033[33m重启更新配置\033[0m"
fi

}

function sy_run_qlmany()
{

echo -e "\033[33m 请选择Rabbit安装路径【默认/volume1/docker】\033[0m" && read rabbitAbsolutepath
if [ -z "${rabbitAbsolutepath}" ];then
    rabbitAbsolutepath='/volume1/docker'
fi
if [ ! -d "$rabbitAbsolutepath" ]; then
    echo -e "\033[43;37m 该目录不存在，创建目录中... \033[0m" 
    mkdir -p $rabbitAbsolutepath
fi
cd $rabbitAbsolutepath 
mkdir -p Rabbit 
cd Rabbit
cd $rabbitAbsolutepath/Rabbit && mkdir -p  Config
if [ ! -f "$rabbitAbsolutepath/Rabbit/Config/Config.json" ]; then
    echo -e "\033[33m GitHub加速地址【默认https://ghproxy.com】\033[0m" && read rabbitProxyurl
    if [ -z "${rabbitProxyurl}" ];then
    rabbitProxyurl='https://ghproxy.com'
    fi
    cd $rabbitAbsolutepath/Rabbit/Config && wget -O Config.json  $rabbitProxyurl/https://raw.githubusercontent.com/ht944/MadRabbit/main/manyConfig.json
    if [ ! -f "$rabbitAbsolutepath/Rabbit/Config/Config.json" ]; then
    echo -e "\033[41;37m 下载失败...退出脚本 \033[0m" 
    exit 0
    else echo -e "\033[42;37m 下载成功 \033[0m"
    fi
    else echo -e "\033[42;37m 该目录已存在配置文件，跳过下载... \033[0m"
fi
echo -e "\033[33m 容器端口【默认5701】\033[0m" && read rabbitPort
if [ -z "${rabbitPort}" ];then
    rabbitPort='5701'
fi
osCore=$(uname -m)
armosCore='arm'
echo -e "检测内核为 \033[34m $osCore \033[0m ,准备安装..."
if [[ $osCore =~ $armosCore ]];then
    osCoreurl='MadRabbit_arm'
    rabbitVersion='arm'
    echo -e "准备安装 \033[37m arm版本... \033[0m"
else
    osCoreurl='MadRabbit_amd'
    rabbitVersion='latest'
fi

echo -e "\033[43;37m 正在安装容器到docker... \033[0m"
sudo docker run --name rabbit -p $rabbitPort:1234  -d  -v  $rabbitAbsolutepath/Rabbit/Config:/$osCoreurl/Config -it --privileged=true  --restart=always  ht944/rabbit:$rabbitVersion
if [ $? -ne  0 ]; then
   echo -e "\033[41;37m 安装失败...退出脚本 \033[0m"
else
   echo -e "\033[42;37m 恭喜你安装成功！！！！！！\033[0m"
   echo -e "\033[33m 请到$rabbitAbsolutepath/Rabbit/Config目录下修改配置文件 \033[0m"
   echo -e "\033[33m 然后使用命令\033[0m \033[32m docker restart rabbit\033[0m \033[33m重启更新配置\033[0m"
fi

}

function sy_run_qlno()
{

echo -e "\033[33m 请选择Rabbit安装路径【默认/volume1/docker】\033[0m" && read rabbitAbsolutepath
if [ -z "${rabbitAbsolutepath}" ];then
    rabbitAbsolutepath='/volume1/docker'
fi
if [ ! -d "$rabbitAbsolutepath" ]; then
    echo -e "\033[43;37m 该目录不存在，创建目录中... \033[0m" 
    mkdir -p $rabbitAbsolutepath
fi
cd $rabbitAbsolutepath 
mkdir -p Rabbit 
cd Rabbit
cd $rabbitAbsolutepath/Rabbit && mkdir -p  Config
if [ ! -f "$rabbitAbsolutepath/Rabbit/Config/Config.json" ]; then
    echo -e "\033[33m GitHub加速地址【默认https://ghproxy.com】\033[0m" && read rabbitProxyurl
    if [ -z "${rabbitProxyurl}" ];then
    rabbitProxyurl='https://ghproxy.com'
    fi
    cd $rabbitAbsolutepath/Rabbit/Config && wget -O Config.json  $rabbitProxyurl/https://raw.githubusercontent.com/ht944/MadRabbit/main/noConfig.json
    if [ ! -f "$rabbitAbsolutepath/Rabbit/Config/Config.json" ]; then
    echo -e "\033[41;37m 下载失败...退出脚本 \033[0m" 
    exit 0
    else echo -e "\033[42;37m 下载成功 \033[0m"
    fi
    else echo -e "\033[42;37m 该目录已存在配置文件，跳过下载... \033[0m"
fi
echo -e "\033[33m 容器端口【默认5701】\033[0m" && read rabbitPort
if [ -z "${rabbitPort}" ];then
    rabbitPort='5701'
fi
osCore=$(uname -m)
armosCore='arm'
echo -e "检测内核为 \033[34m $osCore \033[0m ,准备安装..."
if [[ $osCore =~ $armosCore ]];then
    osCoreurl='MadRabbit_arm'
    rabbitVersion='arm'
    echo -e "准备安装 \033[37m arm版本... \033[0m"
else
    osCoreurl='MadRabbit_amd'
    rabbitVersion='latest'
fi

echo -e "\033[43;37m 正在安装容器到docker... \033[0m"
sudo docker run --name rabbit -p $rabbitPort:1234  -d  -v  $rabbitAbsolutepath/Rabbit/Config:/$osCoreurl/Config -it --privileged=true  --restart=always  ht944/rabbit:$rabbitVersion
if [ $? -ne  0 ]; then
   echo -e "\033[41;37m 安装失败...退出脚本 \033[0m"
else
   echo -e "\033[42;37m 恭喜你安装成功！！！！！！\033[0m"
   echo -e "\033[33m 请到$rabbitAbsolutepath/Rabbit/Config目录下修改配置文件 \033[0m"
   echo -e "\033[33m 然后使用命令\033[0m \033[32m docker restart rabbit\033[0m \033[33m重启更新配置\033[0m"
fi

}

system_Judgment