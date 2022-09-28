#!/bin/bash
<<INFO
SCRIPYT:RabbitInstall.sh
AUTHOR:AyeSt0
DATE:2022-09-28
DESCRIBE:One click installation of rabbit
SYSTEM:linux
WARNING:This script is only used for testing, learning and research. It is not allowed to be used for commercial purposes. Its legitimacy, accuracy, integrity and effectiveness cannot be guaranteed. Please make your own judgment according to the situation. The original author's warehouse address is https://github.com/HT944/MadRabbit
VERSION:1.0.2
MODIFY:debug
INFO
clear
trap "" 2 3 15
vVersion='1.0.2'
uUser=$(whoami)
dDate=$(date +%d/%m/%Y)
function system_Judgment() {
	uNames=$(sudo uname -a)
	syosNames='synology'
	containerName="rabbit"
	if [[ $uNames =~ $syosNames ]]; then
		echo -e "\033[32m 忙猜你是群晖\033[0m"
		if [[ -n $(docker ps -q -f "name=^${containerName}$") ]]; then
			echo -e "\033[42;37m 检测到rabbit容器\033[0m   启动一键管理脚本>>>>>>>>>>>>"
			#Sy_Admin
			Management_Countdown5
			echo -e "\033[42;37m 群晖一键管理脚本\033[0m   启动>>>>>>>>>>>>"
			Synology_utils_menu
		else
			echo -e "\033[42;37m 群晖一键安装脚本\033[0m   启动>>>>>>>>>>>>"
			Synology_install_menu
		fi
	else
		echo -e "\033[32m 忙猜你是云服务器\033[0m"
		if [[ -n $(docker ps -q -f "name=^${containerName}$") ]]; then
			echo -e "\033[42;37m 检测到rabbit容器\033[0m   启动一键管理脚本>>>>>>>>>>>>"
			#Cl_Admin
			Management_Countdown5
			echo -e "\033[42;37m 云服务器一键管理脚本\033[0m   启动>>>>>>>>>>>>"
			Cloud_utils_menu
		else
			echo -e "\033[42;37m 云服务器一键安装脚本\033[0m   启动>>>>>>>>>>>>"
			Cloud_install_menu
		fi
	fi
}
function Cloud_utils_menu() {

	cat <<eof

$(echo -e "\033[36m----------------------------------------\033[0m")
$(echo -e "\033[36m|    User:$uUser        Date:$dDate   |\033[0m")
$(echo -e "\033[36m|     欢迎使用【Rabbit一键管理脚本】    |\033[0m")
$(echo -e "\033[36m|    v$vVersion                 by AyeSt0   |\033[0m")
$(echo -e "\033[36m----------------------------------------\033[0m")
$(echo -e "\033[33m 请选择您的Rabbit运行环境or更新\033[0m")

$(echo -e "\033[32m 【1】更新\033[0m")

$(echo -e "\033[32m 【2】卸载（暂未实装）\033[0m")

$(echo -e "\033[31m 【3】退出安装\033[0m")

eof

	read -p "请输入对应选项的数字：" num1

	case $num1 in

	1)
		update
		;;

	2)
		echo -e "\033[42;37m 该功能尚未实装\033[0m"
		Cloud_utils_menu
		;;
	3)
		exit 0
		;;

	esac

}

function Cloud_install_menu() {
	cat <<eof

$(echo -e "\033[36m----------------------------------------\033[0m")
$(echo -e "\033[36m|    User:$uUser        Date:$dDate   |\033[0m")
$(echo -e "\033[36m|     欢迎使用【Rabbit一键安装脚本】    |\033[0m")
$(echo -e "\033[36m|    v$vVersion                 by AyeSt0   |\033[0m")
$(echo -e "\033[36m----------------------------------------\033[0m")
$(echo -e "\033[33m 请选择您的Rabbit运行环境or更新\033[0m")

$(echo -e "\033[32m 【1】国内鸡\033[0m")

$(echo -e "\033[32m 【2】国外鸡\033[0m")

$(echo -e "\033[32m 【3】更新\033[0m")

$(echo -e "\033[31m 【4】退出安装\033[0m")

eof

	read -p "请输入对应选项的数字：" num1

	case $num1 in

	1)

		Cloud_install_menu_gn_ql

		;;

	2)

		Cloud_install_menu_gw_ql

		;;
	3)

		update

		;;

	4)

		exit 0
		;;

	esac

}

function Cloud_install_menu_gn_ql() {

	cat <<eof

$(echo -e "\033[33m 请选择您的青龙配置\033[0m")

$(echo -e "\033[32m 【1】单青龙\033[0m")

$(echo -e "\033[32m 【2】多青龙\033[0m")

$(echo -e "\033[32m 【3】不配置青龙\033[0m")

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
		;;

	esac

}

function Cloud_install_menu_gw_ql() {

	cat <<eof

$(echo -e "\033[33m 请选择您的青龙配置\033[0m")

$(echo -e "\033[32m 【1】单青龙\033[0m")

$(echo -e "\033[32m 【2】多青龙\033[0m")

$(echo -e "\033[32m 【3】不配置青龙\033[0m")

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
		;;

	esac

}
function Synology_utils_menu() {
	cat <<eof

$(echo -e "\033[36m----------------------------------------\033[0m")
$(echo -e "\033[36m|    User:$uUser        Date:$dDate   |\033[0m")
$(echo -e "\033[36m|     欢迎使用【Rabbit一键管理脚本】    |\033[0m")
$(echo -e "\033[36m|    v$vVersion                 by AyeSt0   |\033[0m")
$(echo -e "\033[36m----------------------------------------\033[0m")
$(echo -e "\033[33m 请选择\033[0m")

$(echo -e "\033[32m 【1】更新\033[0m")

$(echo -e "\033[32m 【2】卸载（暂未实装）\033[0m")

$(echo -e "\033[31m 【3】退出安装\033[0m")

eof

	read -p "请输入对应选项的数字：" num1

	case $num1 in

	1)
		update
		;;

	2)
		echo -e "\033[42;37m 该功能尚未实装\033[0m"
		Synology_utils_menu
		;;
	3)
		exit 0
		;;

	esac

}
function Synology_install_menu() {

	cat <<eof

$(echo -e "\033[36m----------------------------------------\033[0m")
$(echo -e "\033[36m|    User:$uUser        Date:$dDate   |\033[0m")
$(echo -e "\033[36m|     欢迎使用【Rabbit一键安装脚本】    |\033[0m")
$(echo -e "\033[36m|    v$vVersion                 by AyeSt0   |\033[0m")
$(echo -e "\033[36m----------------------------------------\033[0m")
$(echo -e "\033[33m 请选择\033[0m")

$(echo -e "\033[32m 【1】安装\033[0m")

$(echo -e "\033[31m 【2】退出安装\033[0m")

eof

	read -p "请输入对应选项的数字：" num2

	case $num2 in

	1)

		Synology_install_menu_ql

		;;

	2)

		exit 0
		;;

	esac

}
function Synology_install_menu_ql() {

	cat <<eof

$(echo -e "\033[33m 请选择您的青龙配置\033[0m")

$(echo -e "\033[32m 【1】单青龙\033[0m")

$(echo -e "\033[32m 【2】多青龙\033[0m")

$(echo -e "\033[32m 【3】不配置青龙\033[0m")

eof

	read -p "请输入对应选项的数字：" num21

	case $num21 in

	1)

		sy_run_qlone

		;;

	2)

		sy_run_qlmany

		;;

	3)

		sy_run_qlno
		;;

	esac

}

function gn_run_qlone() {
	#青龙配置类型
	qlconfVersion='one'
	#安装路径
	clpath_choise
	#配置文件下载
	if [ ! -f "$rabbitAbsolutepath/Rabbit/Config/Config.json" ]; then
		confDownload_proxy
	else
		echo -e "\033[42;37m 该目录已存在配置文件，跳过下载及配置... \033[0m"
	fi
	#容器安装
	container_install_gn
}

function gn_run_qlmany() {
	#青龙配置类型
	qlconfVersion='many'
	#安装路径
	clpath_choise
	#配置文件下载
	if [ ! -f "$rabbitAbsolutepath/Rabbit/Config/Config.json" ]; then
		confDownload_proxy
	else
		echo -e "\033[42;37m 该目录已存在配置文件，跳过下载及配置... \033[0m"
	fi
	#容器安装
	container_install_gn

}

function gn_run_qlno() {
	#青龙配置类型
	qlconfVersion='no'
	#安装路径
	clpath_choise
	#配置文件下载
	if [ ! -f "$rabbitAbsolutepath/Rabbit/Config/Config.json" ]; then
		confDownload_proxy
	else
		echo -e "\033[42;37m 该目录已存在配置文件，跳过下载及配置... \033[0m"
	fi
	#容器安装
	container_install_gn
}

function gw_run_qlone() {
	#青龙配置类型
	qlconfVersion='one'
	#安装路径
	clpath_choise
	#配置文件下载
	if [ ! -f "$rabbitAbsolutepath/Rabbit/Config/Config.json" ]; then
		confDownload
	else
		echo -e "\033[42;37m 该目录已存在配置文件，跳过下载及配置... \033[0m"
	fi
	#容器安装
	container_install_gw
}

function gw_run_qlmany() {
	#青龙配置类型
	qlconfVersion='many'
	#安装路径
	clpath_choise
	#配置文件下载
	if [ ! -f "$rabbitAbsolutepath/Rabbit/Config/Config.json" ]; then
		confDownload
	else
		echo -e "\033[42;37m 该目录已存在配置文件，跳过下载及配置... \033[0m"
	fi
	#容器安装
	container_install_gw
}

function gw_run_qlno() {
	#青龙配置类型
	qlconfVersion='no'
	#安装路径
	clpath_choise
	#配置文件下载
	if [ ! -f "$rabbitAbsolutepath/Rabbit/Config/Config.json" ]; then
		confDownload
	else
		echo -e "\033[42;37m 该目录已存在配置文件，跳过下载及配置... \033[0m"
	fi
	#容器安装
	container_install_gw
}

function sy_run_qlone() {
	#青龙配置类型
	qlconfVersion='one'
	#安装路径
	sypath_choise
	#配置文件下载
	if [ ! -f "$rabbitAbsolutepath/Rabbit/Config/Config.json" ]; then
		confDownload_proxy
	else
		echo -e "\033[42;37m 该目录已存在配置文件，跳过下载及配置... \033[0m"
	fi
	#容器安装
	container_install_sy
}

function sy_run_qlmany() {
	#青龙配置类型
	qlconfVersion='many'
	#安装路径
	sypath_choise
	#配置文件下载
	if [ ! -f "$rabbitAbsolutepath/Rabbit/Config/Config.json" ]; then
		confDownload_proxy
	else
		echo -e "\033[42;37m 该目录已存在配置文件，跳过下载及配置... \033[0m"
	fi
	#容器安装
	container_install_sy
}

function sy_run_qlno() {
	#青龙配置类型
	qlconfVersion='no'
	#安装路径
	sypath_choise
	#配置文件下载
	if [ ! -f "$rabbitAbsolutepath/Rabbit/Config/Config.json" ]; then
		confDownload_proxy
	else
		echo -e "\033[42;37m 该目录已存在配置文件，跳过下载及配置... \033[0m"
	fi
	#容器安装
	container_install_sy
}
#配置 配置文件
function configquick() {
	#修改配置文件
	echo -e "\033[33m 是否需要现在修改配置文件(y/n)【默认n】\033[0m" && read rabbitConfigjudge
	if test -z "$rabbitConfigjudge"; then
		rabbitConfigjudge='n'
	fi
	case $rabbitConfigjudge in
	[yY])
		#修改配置文件最大同时登录人数
		echo -e "\033[33m 最多同时登录人数【默认4】 \033[0m" && read rabbitMaxtab
		if test -z "$rabbitMaxtab"; then
			rabbitMaxtab='4'
		fi
		sed -i "/MaxTab/s/4/$rabbitMaxtab/g" $rabbitAbsolutepath/Rabbit/Config/Config.json
		if test $? -ne 0; then
			echo -e "\033[41;37m 修改失败...请安装后自行检查配置文件 \033[0m"
		else
			echo -e "\033[42;37m 设置成功 \033[0m"
		fi

		#修改配置文件标题
		echo -e "\033[33m 网页标题【默认Rabbit】 \033[0m" && read rabbitTittle
		if test -z "$rabbitTittle"; then
			rabbitTittle='Rabbit'
		fi
		sed -i "/\"Title\": \"Rabbit\",/s/Rabbit/$rabbitTittle/g" $rabbitAbsolutepath/Rabbit/Config/Config.json
		if test $? -ne 0; then
			echo -e "\033[41;37m 修改失败...请安装后自行检查配置文件 \033[0m"
		else
			echo -e "\033[42;37m 设置成功 \033[0m"
		fi

		#修改配置文件浏览器回收时间
		echo -e "\033[33m 浏览器回收时间(分钟)【默认5】 \033[0m" && read rabbitClosetime
		if test -z "$rabbitClosetime"; then
			rabbitClosetime='5'
		fi
		sed -i "/Closetime/s/5/$rabbitClosetime/g" $rabbitAbsolutepath/Rabbit/Config/Config.json
		if test $? -ne 0; then
			echo -e "\033[41;37m 修改失败...请安装后自行检查配置文件\033[0m"
		else
			echo -e "\033[42;37m 设置成功 \033[0m"
		fi

		#修改配置文件公告
		echo -e "\033[43;37m 公告一键不提供修改，建议安装后自行修改(支持html) \033[0m"

		#修改配置文件自动过验证码次数
		echo -e "\033[33m 自动过验证码次数【默认5】 \033[0m" && read rabbitAutocaptchacount
		if test -z "$rabbitAutocaptchacount"; then
			rabbitAutocaptchacount='5'
		fi
		sed -i "/AutoCaptchaCount/s/5/$rabbitClosetime/g" $rabbitAbsolutepath/Rabbit/Config/Config.json
		if test $? -ne 0; then
			echo -e "\033[41;37m 修改失败...请安装后自行检查配置文件\033[0m"
		else
			echo -e "\033[42;37m 设置成功 \033[0m"
		fi

		#修改配置文件强制使用特殊验证码

		echo -e "\033[33m 如使用打码平台，请改成false \033[0m"
		echo -e "\033[33m 是否强制使用特殊验证码(true/false)【默认false】 \033[0m" && read rabbitForcecaptcha
		if test -z "$rabbitForcecaptcha"; then
			rabbitForcecaptcha='false'
		fi
		sed -i "/FORCE_CAPTCHA/s/true/$rabbitForcecaptcha/g" $rabbitAbsolutepath/Rabbit/Config/Config.json
		if test $? -ne 0; then
			echo -e "\033[41;37m 修改失败...请安装后自行检查配置文件\033[0m"
		else
			echo -e "\033[42;37m 设置成功 \033[0m"
		fi

		#修改配置文件是否可复制ck
		echo -e "\033[33m 是否可复制ck(true/false)【默认false】 \033[0m" && read rabbitRealck
		if test -z "$rabbitRealck"; then
			rabbitRealck='false'
		fi
		sed -i "/REAL_CK/s/false/$rabbitRealck/g" $rabbitAbsolutepath/Rabbit/Config/Config.json
		if test $? -ne 0; then
			echo -e "\033[41;37m 修改失败...请安装后自行检查配置文件\033[0m"
		else
			echo -e "\033[42;37m 设置成功 \033[0m"
		fi

		#修改配置文件每个账号的间隔时间
		echo -e "\033[33m 每个账号的间隔时间(分钟)【默认0，无间隔】 \033[0m" && read rabbitInterrvaltime
		if test -z "$rabbitInterrvaltime"; then
			rabbitInterrvaltime='0'
		fi
		sed -i "/INTERVAL_TIME/s/0/$rabbitInterrvaltime/g" $rabbitAbsolutepath/Rabbit/Config/Config.json
		if test $? -ne 0; then
			echo -e "\033[41;37m 修改失败...请安装后自行检查配置文件\033[0m"
		else
			echo -e "\033[42;37m 设置成功 \033[0m"
		fi

		#修改配置文件账号过期预警定时
		echo -e "\033[33m 账号过期预警定时(cron定时)【默认30 17 * * *，关闭请输0】 \033[0m" && read rabbitExpirationcron
		if test -z "$rabbitExpirationcron"; then
			rabbitExpirationcron='30 17 * * *'
		fi
		case $rabbitExpirationcron in
		0)
			sed -i "/ExpirationCron/s/30 17 \* \* \*//g" $rabbitAbsolutepath/Rabbit/Config/Config.json
			if test $? -ne 0; then
				echo -e "\033[41;37m 修改失败...请安装后自行检查配置文件\033[0m"
			else
				echo -e "\033[42;37m 设置成功 \033[0m"
			fi
			;;
		*)
			sed -i "/ExpirationCron/s/30 17 \* \* \*/$rabbitExpirationcron/g" $rabbitAbsolutepath/Rabbit/Config/Config.json
			if test $? -ne 0; then
				echo -e "\033[41;37m 修改失败...请安装后自行检查配置文件\033[0m"
			else
				echo -e "\033[42;37m 设置成功 \033[0m"
			fi
			;;
		esac

		#修改配置文件账号资产推送定时
		echo -e "\033[33m 账号资产推送定时(cron定时)【默认0 20 * * *，关闭请输0】 \033[0m" && read rabbitBeancron
		if test -z "$rabbitBeancron"; then
			rabbitBeancron='0 20 * * *'
		fi
		case $rabbitBeancron in
		0)
			sed -i "/BeanCron/s/0 20 \* \* \*//g" $rabbitAbsolutepath/Rabbit/Config/Config.json
			if test $? -ne 0; then
				echo -e "\033[41;37m 修改失败...请安装后自行检查配置文件\033[0m"
			else
				echo -e "\033[42;37m 设置成功 \033[0m"
			fi
			;;
		*)
			sed -i "/BeanCron/s/0 20 \* \* \*/$rabbitBeancron/g" $rabbitAbsolutepath/Rabbit/Config/Config.json
			if test $? -ne 0; then
				echo -e "\033[41;37m 修改失败...请安装后自行检查配置文件\033[0m"
			else
				echo -e "\033[42;37m 设置成功 \033[0m"
			fi
			;;
		esac

		#WXPUSHER
		#修改配置文件对接WXPUSHER
		echo -e "\033[33m 是否对接WXPUSHER(y/n)【默认n】 \033[0m" && read rabbitWxpusher
		if test -z "$rabbitWxpusher"; then
			rabbitWxpusher='n'
		fi
		case $rabbitWxpusher in
		[yY])
			#WXPUSHER_APP_TOKEN
			echo -e "\033[33m APP_TOKEN: \033[0m" && read rabbitWxapptoken
			if test -z "$rabbitWxapptoken"; then
				rabbitWxapptoken=''
			fi
			sed -i "/APP_TOKEN/s/\"\",/\"$rabbitWxapptoken\",/g" $rabbitAbsolutepath/Rabbit/Config/Config.json
			if test $? -ne 0; then
				echo -e "\033[41;37m 修改失败...请安装后自行检查配置文件\033[0m"
			else
				echo -e "\033[42;37m 设置成功 \033[0m"
			fi

			#WXPUSHER_UID
			echo -e "\033[33m 你的uid \033[0m" && read rabbitMywpuid
			if test -z "$rabbitMywpuid"; then
				rabbitMywpuid=''
			fi
			sed -i "/MY_WP_UID/s/\"\",/\"$rabbitMywpuid\",/g" $rabbitAbsolutepath/Rabbit/Config/Config.json
			if test $? -ne 0; then
				echo -e "\033[41;37m 修改失败...请安装后自行检查配置文件\033[0m"
			else
				echo -e "\033[42;37m 设置成功 \033[0m"
			fi
			;;
		*)
			echo -e "\033[42;37m 跳过配置\033[0m"
			;;
		esac

		#XDD
		#修改配置文件对接接入XDD
		echo -e "\033[33m 是否对接XDD(y/n)【默认n】 \033[0m" && read rabbitXdd
		if test -z "$rabbitXdd"; then
			rabbitXdd='n'
		fi
		case $rabbitXdd in
		[yY])
			#XDDURL
			echo -e "\033[33m XDD_URL地址 \033[0m" && read rabbitXddurl
			if test -z "$rabbitXddurl"; then
				rabbitXddurl=''
			fi
			sed -i "/XDD_URL/s/\"\",/\"$rabbitXddurl\",/g" $rabbitAbsolutepath/Rabbit/Config/Config.json
			if test $? -ne 0; then
				echo -e "\033[41;37m 修改失败...请安装后自行检查配置文件\033[0m"
			else
				echo -e "\033[42;37m 设置成功 \033[0m"
			fi

			#XDDTOKEN
			echo -e "\033[33m XDD_TOKEN \033[0m" && read rabbitXddtoken
			if test -z "$rabbitXddtoken"; then
				rabbitXddtoken=''
			fi
			sed -i "/XDD_TOKEN/s/\"\",/\"$rabbitXddtoken\",/g" $rabbitAbsolutepath/Rabbit/Config/Config.json
			if test $? -ne 0; then
				echo -e "\033[41;37m 修改失败...请安装后自行检查配置文件\033[0m"
			else
				echo -e "\033[42;37m 设置成功 \033[0m"
			fi
			;;
		*)
			echo -e "\033[42;37m 跳过配置\033[0m"
			;;
		esac
		#傻妞
		#修改配置文件对接接入傻妞
		echo -e "\033[33m 是否对接傻妞(y/n)【默认n】 \033[0m" && read rabbitSillygirl
		if test -z "$rabbitSillygirl"; then
			rabbitSillygirl='n'
		fi
		case $rabbitSillygirl in
		[yY])
			echo -e "\033[42;37m 提示：请对傻妞发送set jd_cookie ark2.0_token xxx ,xxx为自定义token\033[0m"

			#SILLY_TOKEN
			echo -e "\033[33m SILLY_TOKEN (提示里的xxx)\033[0m" && read rabbitSillytoken
			if test -z "$rabbitSillytoken"; then
				rabbitSillytoken=''
			fi
			sed -i "/SILLY_TOKEN/s/\"\",/\"$rabbitSillytoken\",/g" $rabbitAbsolutepath/Rabbit/Config/Config.json
			if test $? -ne 0; then
				echo -e "\033[41;37m 修改失败...请安装后自行检查配置文件\033[0m"
			else
				echo -e "\033[42;37m 设置成功 \033[0m"
			fi
			;;
		*)
			echo -e "\033[42;37m 跳过配置\033[0m"
			;;
		esac

		#打码平台
		#修改配置文件对接接入打码平台
		echo -e "\033[33m 是否对接打码平台(y/n)【默认y】 \033[0m" && read rabbitTjjudge
		if test -z "$rabbitTjjudge"; then
			rabbitTjjudge='y'
		fi
		case $rabbitTjjudge in
		[yY])
			echo -e "\033[42;37m 提示：请先到http://www.ttshitu.com/register.html进行注册 \033[0m"

			#TJ_USER
			echo -e "\033[33m 打码平台账号 \033[0m" && read rabbitTjuser
			if test -z "$rabbitTjuser"; then
				rabbitTjuser=''
			fi
			sed -i "/TJ_USER/s/\"\",/\"$rabbitTjuser\",/g" $rabbitAbsolutepath/Rabbit/Config/Config.json
			if test $? -ne 0; then
				echo -e "\033[41;37m 修改失败...请安装后自行检查配置文件\033[0m"
			else
				echo -e "\033[42;37m 设置成功 \033[0m"
			fi

			#TJ_PWD
			echo -e "\033[33m 打码平台密码 \033[0m" && read rabbitTjpwd
			if test -z "$rabbitTjpwd"; then
				rabbitTjpwd=''
			fi
			sed -i "/TJ_PWD/s/\"\",/\"$rabbitTjpwd\",/g" $rabbitAbsolutepath/Rabbit/Config/Config.json
			if test $? -ne 0; then
				echo -e "\033[41;37m 修改失败...请安装后自行检查配置文件\033[0m"
			else
				echo -e "\033[42;37m 设置成功 \033[0m"
			fi
			;;
		*)
			echo -e "\033[42;37m 跳过配置\033[0m"
			;;
		esac

		#青龙
		#修改配置文件对接接入青龙

		echo -e "\033[42;37m 提示：建议安装后到配置文件自行修改…\033[0m"

		echo -e "\033[33m 是否现在对接青龙(y/n)【默认n】（不建议一键配置） \033[0m" && read rabbitQinglongjudge
		if test -z "$rabbitQinglongjudge"; then
			rabbitQinglongjudge='n'
		fi
		case $rabbitQinglongjudge in
		[yY])
			#服务器昵称
			echo -e "\033[33m 服务器昵称【默认腾讯云】： \033[0m" && read rabbitQlname
			if test -z "$rabbitQlname"; then
				rabbitQlname='腾讯云'
			fi
			case $rabbitQlname in
			[腾讯云]) ;;

			*)
				sed -i "/QLName/s/腾讯云,/$rabbitQlname,/g" $rabbitAbsolutepath/Rabbit/Config/Config.json
				if test $? -ne 0; then
					echo -e "\033[41;37m 修改失败...请安装后自行检查配置文件\033[0m"
				else
					echo -e "\033[42;37m 设置成功 \033[0m"
				fi
				;;
			esac
			#青龙访问地址
			echo -e "\033[33m 青龙访问地址： \033[0m" && read rabbitQlurl
			if test -z "$rabbitQlurl"; then
				rabbitQlurl=''
			fi
			sed -i "/QLurl/s/\"\",/\"$rabbitQlurl\",/g" $rabbitAbsolutepath/Rabbit/Config/Config.json
			if test $? -ne 0; then
				echo -e "\033[41;37m 修改失败...请安装后自行检查配置文件\033[0m"
			else
				echo -e "\033[42;37m 设置成功 \033[0m"
			fi

			#青龙QL_CLIENTID

			echo -e "\033[33m 青龙ClientID： \033[0m" && read rabbitQlclientid
			if test -z "$rabbitQlclientid"; then
				rabbitQlclientid=''
			fi
			sed -i "/QL_CLIENTID/s/\"\",/\"$rabbitQlclientid\",/g" $rabbitAbsolutepath/Rabbit/Config/Config.json
			if test $? -ne 0; then
				echo -e "\033[41;37m 修改失败...请安装后自行检查配置文件\033[0m"
			else
				echo -e "\033[42;37m 设置成功 \033[0m"
			fi

			#青龙QL_SECRET

			echo -e "\033[33m 青龙Secret： \033[0m" && read rabbitQlsecret
			if test -z "$rabbitQlsecret"; then
				rabbitQlsecret=''
			fi
			sed -i "/QL_SECRET/s/\"\",/\"$rabbitQlsecret\",/g" $rabbitAbsolutepath/Rabbit/Config/Config.json
			if test $? -ne 0; then
				echo -e "\033[41;37m 修改失败...请安装后自行检查配置文件\033[0m"
			else
				echo -e "\033[42;37m 设置成功 \033[0m"
			fi
			#CK最大容量
			echo -e "\033[33m CK最大容量【默认50】： \033[0m" && read rabbitQlcapacity
			if test -z "$rabbitQlcapacity"; then
				rabbitQlcapacity='50'
			fi
			case $rabbitQlcapacity in
			[50]) ;;

			*)
				sed -i "/QL_CAPACITY/s/50,/$rabbitQlcapacity,/g" $rabbitAbsolutepath/Rabbit/Config/Config.json
				if test $? -ne 0; then
					echo -e "\033[41;37m 修改失败...请安装后自行检查配置文件\033[0m"
				else
					echo -e "\033[42;37m 设置成功 \033[0m"
				fi
				;;
			esac
			#WSCK最大容量
			echo -e "\033[33m WSCK最大容量【默认40】： \033[0m" && read rabbitQlwsck
			if test -z "$rabbitQlwsck"; then
				rabbitQlwsck='40'
			fi
			case $rabbitQlwsck in
			[50]) ;;

			*)
				sed -i "/QL_WSCK/s/50,/$rabbitQlwsck,/g" $rabbitAbsolutepath/Rabbit/Config/Config.json
				if test $? -ne 0; then
					echo -e "\033[41;37m 修改失败...请安装后自行检查配置文件\033[0m"
				else
					echo -e "\033[42;37m 设置成功 \033[0m"
				fi
				;;
			esac
			;;
		*)
			echo -e "\033[42;37m 跳过配置\033[0m"
			;;
		esac

		#proxy

		echo -e "\033[42;37m 提示：无密码认证的http代理或socks代理,不可使用腾讯阿里的代理，腾讯阿里服务器需使用代理 \033[0m"

		#修改配置文件代理
		echo -e "\033[33m 是否配置代理(y/n)【默认n】 \033[0m" && read rabbitProxyjudge
		if test -z "$rabbitProxyjudge"; then
			rabbitProxyjudge='n'
		fi
		case $rabbitProxyjudge in
		[yY])
			#proxy
			echo -e "\033[33m 代理地址: \033[0m" && read rabbitProxy
			if test -z "$rabbitProxy"; then
				rabbitProxy=''
			fi
			sed -i "/proxy/s/\"\",/\"$rabbitProxy\",/g" $rabbitAbsolutepath/Rabbit/Config/Config.json
			if test $? -ne 0; then
				echo -e "\033[41;37m 修改失败...请安装后自行检查配置文件\033[0m"
			else
				echo -e "\033[42;37m 设置成功 \033[0m"
			fi
			;;
		*)
			echo -e "\033[42;37m 跳过配置\033[0m"
			;;
		esac
		;;
	*)
		echo -e "\033[42;37m 跳过配置\033[0m"
		;;
	esac
}
function update() {
	#Management_Countdown10
	checkRabbitport=$(docker port rabbit)
	rRabbitPort=${checkRabbitport##*:}
	checkVersion=$(curl -s http://127.0.0.1:$rRabbitPort/api/version)
	#echo "$checkVersion"
	rVersion=${checkVersion:0-7:5}
	echo "当前版本为$rVersion"
	echo "检查更新..."
	rUpdate=$(curl -s http://127.0.0.1:$rRabbitPort/api/update)
	canUpdate=${rUpdate#*h1\>}
	cannotUpdate='404'
	if [[ $canUpdate =~ $cannotUpdate ]]; then
		echo -e "当前已为最新版本"
	else
		echo -e "\033[42;37m 开始更新 \033[0m"
		curl -s http://127.0.0.1:$rRabbitPort/api/update
	fi

	#docker exec -it rabbit bash
	#git pull
	#exit
	#if test $? -ne 0; then
	#				echo -e "\033[41;37m 更新失败...\033[0m"
	#			else
	#				echo -e "\033[42;37m 更新成功！ \033[0m"
	#			fi
	exit 0
}
function Management_Countdown5() {
	for time in $(seq 5 -1 0); do
		echo -n -e "\b$time"
		sleep 1
	done
	echo
}

function Upgrade_Countdown() {
	for i in {15..1}; do

		echo -n 等待rabbit启动...$i 秒后检测更新!!
		echo -ne "\r\r" ####echo -e 处理特殊字符  \r 光标移至行首，但不换行
		sleep 1
	done
}

function check_Dockermirror() {
	echo "检查Docker国内镜像源……"
	cat /etc/docker/daemon.json
	if [ $? -ne 0 ]; then
		echo -e "\033[41;37m 未检测到镜像源配置 \033[0m"

		echo -e "\033[33m 是否配置国内镜像源(y/n)【默认y】 \033[0m" && read rabbitDockerconfig
		if test -z "$rabbitDockerconfig"; then
			rabbitDockerconfig='y'
		fi
		case $rabbitDockerconfig in
		[yY])
			echo -e "\033[42;37m 开始配置国内镜像源\033[0m"
			dockerConfigpath="/etc/docker/daemon.json"
			touch dockerConfigpath
			echo -e "1.中国区官方镜像源
			2.网易镜像源
			3.中国科学技术大学镜像源
			\033[33m 请选择镜像源【默认1】 \033[0m" && read rabbitDockerconfnum
			if test -z "$rabbitDockerconfnum"; then
				rabbitDockerconfnum='1'
			fi
			case $rabbitDockerconfnum in
			1)
				echo '{
"registry-mirrors": ["https://registry.docker-cn.com"]
}' >dockerConfigpath
				if [ $? -ne 0 ]; then
					echo -e "\033[41;37m 配置失败 \033[0m"
				else
					echo -e "\033[42;37m 中国区官方镜像源 设置成功 \033[0m"
				fi
				;;
			2)
				echo '{
"registry-mirrors": ["http://hub-mirror.c.163.com"]
}' >dockerConfigpath
				if [ $? -ne 0 ]; then
					echo -e "\033[41;37m 配置失败 \033[0m"
				else
					echo -e "\033[42;37m 网易镜像源 设置成功 \033[0m"
				fi
				;;
			3)
				echo '{
"registry-mirrors": ["https://docker.mirrors.ustc.edu.cn"]
}' >dockerConfigpath
				if [ $? -ne 0 ]; then
					echo -e "\033[41;37m 配置失败 \033[0m"
				else
					echo -e "\033[42;37m 中国科学技术大学镜像源 设置成功 \033[0m"
				fi
				;;
			esac
			;;
		*)
			echo -e "\033[42;37m 跳过配置\033[0m"
			;;
		esac
	else
		echo -e "\033[42;37m 检测到国内镜像源，跳过配置\033[0m"
	fi
}
#安装路径
#云服务器安装路径
function clpath_choise() {
	echo -e "\033[33m 请选择Rabbit安装路径【默认/root】\033[0m" && read rabbitAbsolutepath
	if [ -z "${rabbitAbsolutepath}" ]; then
		rabbitAbsolutepath='/root'
	fi
	if [ ! -d "$rabbitAbsolutepath" ]; then
		echo -e "\033[43;37m 该目录不存在，创建目录中... \033[0m"
		mkdir -p $rabbitAbsolutepath
	fi
	cd $rabbitAbsolutepath
	mkdir -p Rabbit
	cd Rabbit
	cd $rabbitAbsolutepath/Rabbit && mkdir -p Config
}
#群晖安装路径
function sypath_choise() {
	echo -e "\033[33m 请选择Rabbit安装路径【默认/volume1/docker】\033[0m" && read rabbitAbsolutepath
	if [ -z "${rabbitAbsolutepath}" ]; then
		rabbitAbsolutepath='/volume1/docker'
	fi
	if [ ! -d "$rabbitAbsolutepath" ]; then
		echo -e "\033[43;37m 该目录不存在，创建目录中... \033[0m"
		mkdir -p $rabbitAbsolutepath
	fi
	cd $rabbitAbsolutepath
	mkdir -p Rabbit
	cd Rabbit
	cd $rabbitAbsolutepath/Rabbit && mkdir -p Config
}
#配置文件下载
function confDownload() {
	cd $rabbitAbsolutepath/Rabbit/Config && wget -O Config.json https://raw.githubusercontent.com/ht944/MadRabbit/main/${qlconfVersion}Config.json
	if test $? -ne 0; then
		echo -e "\033[41;37m 下载失败...退出脚本 \033[0m"
		rm -rf $rabbitAbsolutepath/Rabbit/
		exit 0
	else
		if [ ! -f "$rabbitAbsolutepath/Rabbit/Config/Config.json" ]; then
			echo -e "\033[41;37m 下载失败...退出脚本 \033[0m"
			rm -rf $rabbitAbsolutepath/Rabbit/
			exit 0
		else
			echo -e "\033[42;37m 下载成功 \033[0m"
		fi
		#配置配置文件
		configquick

	fi
}

#配置文件下载（代理）
function confDownload_proxy() {
	echo -e "\033[33m GitHub加速地址【默认https://ghproxy.com】\033[0m" && read rabbitProxyurl
	if [ -z "${rabbitProxyurl}" ]; then
		rabbitProxyurl='https://ghproxy.com'
	fi
	cd $rabbitAbsolutepath/Rabbit/Config && wget -O Config.json $rabbitProxyurl/https://raw.githubusercontent.com/ht944/MadRabbit/main/${qlconfVersion}Config.json
	if test $? -ne 0; then
		echo -e "\033[41;37m 下载失败...退出脚本 \033[0m"
		rm -rf $rabbitAbsolutepath/Rabbit/
		exit 0
	else
		if [ ! -f "$rabbitAbsolutepath/Rabbit/Config/Config.json" ]; then
			echo -e "\033[41;37m 下载失败...退出脚本 \033[0m"
			rm -rf $rabbitAbsolutepath/Rabbit/
			exit 0
		else
			echo -e "\033[42;37m 下载成功 \033[0m"
		fi
		#配置配置文件
		configquick

	fi
}
function container_install_gn() {
	echo -e "\033[33m 容器端口【默认5701】\033[0m" && read rabbitPort
	if [ -z "${rabbitPort}" ]; then
		rabbitPort='5701'
	fi
	osCore=$(uname -m)
	osArm1='arm'
	osArm2='aarch'
	echo -e "检测内核为 \033[34m $osCore \033[0m ,准备安装..."
	if [[ $osCore =~ $osArm1 ]] || [[ $osCore =~ $osArm2 ]]; then
		osCoreurl='MadRabbit_arm'
		rabbitVersion='arm'
		echo -e "准备安装 \033[37m arm版本... \033[0m"
	else
		osCoreurl='MadRabbit_amd'
		rabbitVersion='latest'
		echo -e "准备安装 \033[37m amd版本... \033[0m"
	fi

	echo "检查Docker是否已安装……"
	docker -v
	if [ $? -ne 0 ]; then
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
		if [ $? -ne 0 ]; then
			echo -e "\033[41;37m 下载失败...退出脚本 \033[0m"
			exit 0
		else
			echo " ***** 安装 docker 工具完成 ***** "
			echo "docker 已安装！"
		fi
	fi
	echo "docker 已安装！"
	check_Dockermirror

	echo -e "\033[43;37m 正在安装容器到docker... \033[0m"
	sudo docker run --name rabbit -p $rabbitPort:1234 -d -v $rabbitAbsolutepath/Rabbit/Config:/$osCoreurl/Config -it --privileged=true --restart=always ht944/rabbit:$rabbitVersion
	if [ $? -ne 0 ]; then
		echo -e "\033[41;37m 安装失败...退出脚本 \033[0m"
	else
		echo -e "\033[42;37m 恭喜你安装成功！！！！！！\033[0m"
		echo -e "\033[33m 请到$rabbitAbsolutepath/Rabbit/Config目录下修改配置文件 \033[0m"
		echo -e "\033[33m 然后使用命令\033[0m \033[32m docker restart rabbit\033[0m \033[33m重启更新配置\033[0m"
		echo -e "\033[43;37m 开始检测更新... \033[0m"
		echo -e "\033[43;31m 注意！如无法进行更新，请自行访问\033[0m\033[43;32m https//你的rabbit地址/api/update\033[0m\033[43;31m检查更新！ \033[0m"
		#检测更新倒计时
		Upgrade_Countdown
		#更新检测
		update
	fi
}

function container_install_gw() {
	echo -e "\033[33m 容器端口【默认5701】\033[0m" && read rabbitPort
	if [ -z "${rabbitPort}" ]; then
		rabbitPort='5701'
	fi
	osCore=$(uname -m)
	osArm1='arm'
	osArm2='aarch'
	echo -e "检测内核为 \033[34m $osCore \033[0m ,准备安装..."
	if [[ $osCore =~ $osArm1 ]] || [[ $osCore =~ $osArm2 ]]; then
		osCoreurl='MadRabbit_arm'
		rabbitVersion='arm'
		echo -e "准备安装 \033[37m arm版本... \033[0m"
	else
		osCoreurl='MadRabbit_amd'
		rabbitVersion='latest'
		echo -e "准备安装 \033[37m amd版本... \033[0m"
	fi

	echo "检查Docker是否已安装……"
	docker -v
	if [ $? -ne 0 ]; then
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
		if [ $? -ne 0 ]; then
			echo -e "\033[41;37m 下载失败...退出脚本 \033[0m"
			exit 0
		else
			echo " ***** 安装 docker 工具完成 ***** "
			echo "docker 已安装！"
		fi
	fi
	echo "docker 已安装！"

	echo -e "\033[43;37m 正在安装容器到docker... \033[0m"
	sudo docker run --name rabbit -p $rabbitPort:1234 -d -v $rabbitAbsolutepath/Rabbit/Config:/$osCoreurl/Config -it --privileged=true --restart=always ht944/rabbit:$rabbitVersion
	if [ $? -ne 0 ]; then
		echo -e "\033[41;37m 安装失败...退出脚本 \033[0m"
	else
		echo -e "\033[42;37m 恭喜你安装成功！！！！！！\033[0m"
		echo -e "\033[33m 请到$rabbitAbsolutepath/Rabbit/Config目录下修改配置文件 \033[0m"
		echo -e "\033[33m 然后使用命令\033[0m \033[32m docker restart rabbit\033[0m \033[33m重启更新配置\033[0m"
		echo -e "\033[43;37m 开始检测更新... \033[0m"
		echo -e "\033[43;31m 注意！如无法进行更新，请自行访问\033[0m\033[43;32m https//你的rabbit地址/api/update\033[0m\033[43;31m检查更新！ \033[0m"
		#检测更新倒计时
		Upgrade_Countdown
		#更新检测
		update
	fi
}
function container_install_sy() {
	echo -e "\033[33m 容器端口【默认5701】\033[0m" && read rabbitPort
	if [ -z "${rabbitPort}" ]; then
		rabbitPort='5701'
	fi
	osCore=$(uname -m)
	osArm1='arm'
	osArm2='aarch'
	echo -e "检测内核为 \033[34m $osCore \033[0m ,准备安装..."
	if [[ $osCore =~ $osArm1 ]] || [[ $osCore =~ $osArm2 ]]; then
		osCoreurl='MadRabbit_arm'
		rabbitVersion='arm'
		echo -e "准备安装 \033[37m arm版本... \033[0m"
	else
		osCoreurl='MadRabbit_amd'
		rabbitVersion='latest'
		echo -e "准备安装 \033[37m amd版本... \033[0m"
	fi

	echo "检查Docker是否已安装……"
	docker -v
	if [ $? -ne 0 ]; then
		echo "未检测到Docker！退出安装"
		exit 0
	fi
	echo "docker 已安装！"

	echo -e "\033[43;37m 正在安装容器到docker... \033[0m"
	sudo docker run --name rabbit -p $rabbitPort:1234 -d -v $rabbitAbsolutepath/Rabbit/Config:/$osCoreurl/Config -it --privileged=true --restart=always ht944/rabbit:$rabbitVersion
	if [ $? -ne 0 ]; then
		echo -e "\033[41;37m 安装失败...退出脚本 \033[0m"
	else
		echo -e "\033[42;37m 恭喜你安装成功！！！！！！\033[0m"
		echo -e "\033[33m 请到$rabbitAbsolutepath/Rabbit/Config目录下修改配置文件 \033[0m"
		echo -e "\033[33m 然后使用命令\033[0m \033[32m docker restart rabbit\033[0m \033[33m重启更新配置\033[0m"
		echo -e "\033[43;37m 开始检测更新... \033[0m"
		echo -e "\033[43;31m 注意！如无法进行更新，请自行访问\033[0m\033[43;32m https//你的rabbit地址/api/update\033[0m\033[43;31m检查更新！ \033[0m"
		#检测更新倒计时
		Upgrade_Countdown
		#更新检测
		update
	fi
}
system_Judgment
