#!/bin/bash
#!/bin/sh
<<INFO
SCRIPYT:QRabbitUtils.sh
AUTHOR:AyeSt0
DATE:2023-02-17
DESCRIBE:One click installation of qrabbit
SYSTEM:linux
WARNING:This script is only used for testing, learning and research. It is not allowed to be used for commercial purposes. Its legitimacy, accuracy, integrity and effectiveness cannot be guaranteed. Please make your own judgment according to the situation. The original author's warehouse address is https://github.com/HT944/MadRabbit
VERSION:T1.0.0
MODIFY:debug
INFO
clear
trap "" 2 3 15
vVersion='V1.0.0'
RabbitImageName="qrabbit"
uUser=$(whoami)
dDate=$(date +%d/%m/%Y)
function system_Judgment() {
    uNames=$(sudo uname -a)
    syosNames='synology'
    qrabbitcontainerName="qrabbit"
    if [[ $uNames =~ $syosNames ]]; then
        echo -e "\033[32m 忙猜你是群晖\033[0m"
                if [[ -n $(docker ps -q -f "name=^${qrabbitcontainerName}$") ]]; then
                    echo -e "\033[42;37m 检测到qrabbit容器\033[0m"
                    #当前版本
                    qrabbitLocalversion
                    echo -e "\033[42;37m 群晖一键管理脚本\033[0m   \033[1m启动>>>>>>>>>>>>\033[0m"
                    echo ""
                    echo -e "\033[43;31m 未购买Rabbit授权是无法使用Rabbit的\033[0m"
                    echo -e "\033[43;31m 具体购买请关注电报@Rabbit_one\033[0m"
                    echo -e "\033[43;37m\033[1m 再次强调本人AyeSt0仅为一键脚本作者，Rabbit相关请找Mad\033[0m\033[0m"
                    Synology_manage_main_menu
                else
                    #echo -e "\033[42;37m 未检测到qrabbit容器\033[0m   \033[1m启动一键管理脚本>>>>\033[0m"
                    echo -e "\033[42;37m 群晖一键管理脚本\033[0m   \033[1m启动>>>>>>>>>>>>\033[0m"
                    echo ""
                    echo -e "\033[43;31m 未购买Rabbit授权是无法使用Rabbit的\033[0m"
                    echo -e "\033[43;31m 具体购买请关注电报@Rabbit_one\033[0m"
                    echo -e "\033[43;37m\033[1m 再次强调本人AyeSt0仅为一键脚本作者，Rabbit相关请找Mad\033[0m\033[0m"
                    Synology_manage_main12_menu
                fi       
    else
        echo -e "\033[32m 忙猜你是云服务器\033[0m"
                if [[ -n $(docker ps -q -f "name=^${qrabbitcontainerName}$") ]]; then
                    echo -e "\033[42;37m 检测到qrabbit容器\033[0m"
                    #当前版本
                    qrabbitLocalversion
                    echo -e "\033[42;37m 云服务器一键管理脚本\033[0m   \033[1m启动>>>>>>>>>>>>\033[0m"
                    echo ""
                    echo -e "\033[43;31m 未购买Rabbit授权是无法使用Rabbit的\033[0m"
                    echo -e "\033[43;31m 具体购买请关注电报@Rabbit_one\033[0m"
                    echo -e "\033[43;37m\033[1m 再次强调本人AyeSt0仅为一键脚本作者，Rabbit相关请找Mad\033[0m\033[0m"
                    Cloud_manage_menu_qrabbit
                else
                    #echo -e "\033[42;37m 未检测到qrabbit容器\033[0m   \033[1m启动一键管理脚本>>>>\033[0m"
                    echo -e "\033[42;37m 云服务器一键管理脚本\033[0m   \033[1m启动>>>>>>>>>>>>\033[0m"
                    echo ""
                    echo -e "\033[43;31m 未购买Rabbit授权是无法使用Rabbit的\033[0m"
                    echo -e "\033[43;31m 具体购买请关注电报@Rabbit_one\033[0m"
                    echo -e "\033[43;37m\033[1m 再次强调本人AyeSt0仅为一键脚本作者，Rabbit相关请找Mad\033[0m\033[0m"
                    Cloud_install_menu_qrabbit
                fi
    fi
}

function Cloud_manage_menu_qrabbit() {

    cat <<eof

$(echo -e "\033[36m-----------------------------------------\033[0m")
$(echo -e "\033[36m|    User:$uUser        Date:$dDate   |\033[0m")
$(echo -e "\033[36m|     \033[1m欢迎使用【QRabbit一键管理脚本】\033[0m    \033[36m|\033[0m")
$(echo -e "\033[36m|    $vVersion                by AyeSt0    |\033[0m")
$(echo -e "\033[36m|          \033[1m\033[32m当前QRabbit版本 $qrabbitLocalversion\033[0m\033[0m         \033[36m|\033[0m")
$(echo -e "\033[36m|     容器刚启动可能不会显示版本号      |\033[0m")
$(echo -e "\033[36m|         可以重新运行脚本重试          |\033[0m")
$(echo -e "\033[36m-----------------------------------------\033[0m")
$(echo -e "\033[33m\033[1m 请选择合适的选项\033[0m")

$(echo -e "\033[32m\033[1m 【1】更新\033[0m")

$(echo -e "\033[31m\033[1m 【2】卸载\033[0m")

$(echo -e "\033[31m 【3】退出\033[0m")

eof

    read -p "请输入对应选项的数字：" num23

    case $num23 in

    1)
        RabbitImageName="qrabbit"
        update_qrabbit
        ;;

    2)
        uninstall_cl_qrabbit
        ;;

    3)
        exit 0
        ;;

    esac

}

function Cloud_install_menu_qrabbit() {
    cat <<eof

$(echo -e "\033[36m-----------------------------------------\033[0m")
$(echo -e "\033[36m|    User:$uUser        Date:$dDate   |\033[0m")
$(echo -e "\033[36m|     \033[1m欢迎使用【QRabbit一键安装脚本】\033[0m    \033[36m|\033[0m")
$(echo -e "\033[36m|    $vVersion                by AyeSt0    |\033[0m")
$(echo -e "\033[36m-----------------------------------------\033[0m")
$(echo -e "\033[33m\033[1m 请选择您的QRabbit运行环境\033[0m")

$(echo -e "\033[32m\033[1m 【1】国内鸡\033[0m")

$(echo -e "\033[32m\033[1m 【2】国外鸡\033[0m")

$(echo -e "\033[31m 【3】退出\033[0m")

eof

    read -p "请输入对应选项的数字：" num11

    case $num11 in

    1)
        inChina=Yes
        gn_run_qr
        ;;

    2)
        inChina=No
        gw_run_qr
        ;;

    3)

        exit 0
        ;;

    esac

}

function Synology_manage_menu_qrabbit() {

    cat <<eof

$(echo -e "\033[36m-----------------------------------------\033[0m")
$(echo -e "\033[36m|    User:$uUser        Date:$dDate   |\033[0m")
$(echo -e "\033[36m|     \033[1m欢迎使用【QRabbit一键管理脚本】\033[0m    \033[36m|\033[0m")
$(echo -e "\033[36m|    $vVersion                by AyeSt0    |\033[0m")
$(echo -e "\033[36m|          \033[1m\033[32m当前QRabbit版本 $qrabbitLocalversion\033[0m\033[0m         \033[36m|\033[0m")
$(echo -e "\033[36m|     容器刚启动可能不会显示版本号      |\033[0m")
$(echo -e "\033[36m|         可以重新运行脚本重试          |\033[0m")
$(echo -e "\033[36m-----------------------------------------\033[0m")
$(echo -e "\033[33m\033[1m 请选择合适的选项\033[0m")

$(echo -e "\033[32m\033[1m 【1】更新\033[0m")

$(echo -e "\033[31m\033[1m 【2】卸载\033[0m")

$(echo -e "\033[31m 【5】退出\033[0m")

eof

    read -p "请输入对应选项的数字：" enum23

    case $enum23 in

    1)
        update_qrabbit
        ;;

    2)
        uninstall_sy_qrabbit
        ;;

    3)
        exit 0
        ;;

    esac

}

function Synology_install_menu_qrabbit() {

    cat <<eof

$(echo -e "\033[36m-----------------------------------------\033[0m")
$(echo -e "\033[36m|    User:$uUser        Date:$dDate   |\033[0m")
$(echo -e "\033[36m|     \033[1m欢迎使用【QRabbit一键安装脚本】\033[0m    \033[36m|\033[0m")
$(echo -e "\033[36m|    $vVersion                by AyeSt0    |\033[0m")
$(echo -e "\033[36m-----------------------------------------\033[0m")
$(echo -e "\033[33m 请选择合适的选项\033[0m")

$(echo -e "\033[32m\033[1m 【1】安装\033[0m")

$(echo -e "\033[31m 【2】退出\033[0m")

eof

    read -p "请输入对应选项的数字：" enum11

    case $enum11 in

    1)
        RabbitImageName="qrabbit"
        inChina=Yes
        sy_run_qr

        ;;

    2)

        exit 0
        ;;

    esac

}

function gn_run_qr() {
    #青龙配置类型
    confVersion='QRabbit'
    #安装路径
    clpath_choise
    #配置文件下载
    if [ ! -f "$rabbitAbsolutepath/QRabbit/Config/Config.json" ]; then
        confDownload_proxy
    else
        echo -e "\033[42;37m 该目录已存在配置文件，跳过下载及配置... \033[0m"
    fi
    #容器安装
    container_install_gn
}


function gw_run_qr() {
    #青龙配置类型
    confVersion='QRabbit'
    #安装路径
    clpath_choise
    #配置文件下载
    if [ ! -f "$rabbitAbsolutepath/QRabbit/Config/Config.json" ]; then
        confDownload
    else
        echo -e "\033[42;37m 该目录已存在配置文件，跳过下载及配置... \033[0m"
    fi
    #容器安装
    container_install_gw
}

function sy_run_qr() {
    #青龙配置类型
    confVersion='QRabbit'
    #安装路径
    sypath_choise
    #配置文件下载
    if [ ! -f "$rabbitAbsolutepath/QRabbit/Config/Config.json" ]; then
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
        sed -i "/MaxTab/s/4/$rabbitMaxtab/g" "$rabbitAbsolutepath"/QRabbit/Config/Config.json
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
        sed -i "/\"Title\": \"Rabbit\",/s/Rabbit/$rabbitTittle/g" "$rabbitAbsolutepath"/QRabbit/Config/Config.json
        if test $? -ne 0; then
            echo -e "\033[41;37m 修改失败...请安装后自行检查配置文件 \033[0m"
        else
            echo -e "\033[42;37m 设置成功 \033[0m"
        fi

        #修改配置文件浏览器回收时间
        echo -e "\033[33m 浏览器回收时间(秒)【默认180】 \033[0m" && read rabbitClosetime
        if test -z "$rabbitClosetime"; then
            rabbitClosetime='180'
        fi
        sed -i "/Closetime/s/180/$rabbitClosetime/g" "$rabbitAbsolutepath"/QRabbit/Config/Config.json
        if test $? -ne 0; then
            echo -e "\033[41;37m 修改失败...请安装后自行检查配置文件\033[0m"
        else
            echo -e "\033[42;37m 设置成功 \033[0m"
        fi

        #修改配置文件公告
        echo -e "\033[43;37m 公告一键不提供修改，建议安装后自行修改(支持html) \033[0m"

        #修改配置文件RabbitToken(log)
        echo -e "\033[33m RabbitToken(小卖铺给的的token)【无默认】 \033[0m" && read rabbitRabbittoken
        if test -z "$rabbitRabbittoken"; then
            rabbitRabbittoken=''
        fi
        sed -i "/Rabbittoken/s/\"\",/\"$rabbitRabbittoken\",/g" "$rabbitAbsolutepath"/QRabbit/Config/Config.json
        if test $? -ne 0; then
            echo -e "\033[41;37m 修改失败...请安装后自行检查配置文件\033[0m"
        else
            echo -e "\033[42;37m 设置成功 \033[0m"
        fi

        #修改配置文件机器人对接token

        echo -e "\033[33m 对接机器人Token，长度32位以上【无默认】 \033[0m" && read rabbitApiToken
        if test -z "$rabbitApiToken"; then
            rabbitApiToken=''
        fi
        sed -i "/ApiToken/s/\"\",/\"$rabbitApiToken\",/g" "$rabbitAbsolutepath"/QRabbit/Config/Config.json
        if test $? -ne 0; then
            echo -e "\033[41;37m 修改失败...请安装后自行检查配置文件\033[0m"
        else
            echo -e "\033[42;37m 设置成功 \033[0m"
        fi

        #修改配置文件更新密码

        echo -e "\033[33m QRabbit更新密码，防止用户乱更【无默认】 \033[0m" && read rabbitUpdatePwd
        if test -z "$rabbitUpdatePwd"; then
            rabbitUpdatePwd=''
        fi
        sed -i "/UpdatePwd/s/\"\",/\"$rabbitUpdatePwd\",/g" "$rabbitAbsolutepath"/QRabbit/Config/Config.json
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
        sed -i "/REAL_CK/s/false/$rabbitRealck/g" "$rabbitAbsolutepath"/QRabbit/Config/Config.json
        if test $? -ne 0; then
            echo -e "\033[41;37m 修改失败...请安装后自行检查配置文件\033[0m"
        else
            echo -e "\033[42;37m 设置成功 \033[0m"
        fi

        #修改配置文件wskey转换定时（必填）
        echo -e "\033[33m wskey转换定时(必填)【默认30 8,23 * * *(即每天8:30和23:30转换)】 \033[0m" && read rabbitWskeyCron
        if test -z "$rabbitWskeyCron"; then
            rabbitWskeyCron='30 8,23 * * *'
        fi
        sed -i "/WskeyCron/s/\"\",/\"$rabbitWskeyCron\",/g" "$rabbitAbsolutepath"/QRabbit/Config/Config.json
        if test $? -ne 0; then
            echo -e "\033[41;37m 修改失败...请安装后自行检查配置文件\033[0m"
        else
            echo -e "\033[42;37m 设置成功 \033[0m"
        fi

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
            sed -i "/APP_TOKEN/s/\"\",/\"$rabbitWxapptoken\",/g" "$rabbitAbsolutepath"/QRabbit/Config/Config.json
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
            sed -i "/MY_WP_UID/s/\"\",/\"$rabbitMywpuid\",/g" "$rabbitAbsolutepath"/QRabbit/Config/Config.json
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
            echo -e "\033[33m 服务器昵称【默认京东车1】： \033[0m" && read rabbitQlname
            if test -z "$rabbitQlname"; then
                rabbitQlname='京东车1'
            fi
            case $rabbitQlname in
            [京东车1]) ;;

            *)
                sed -i "/QLName/s/腾讯云,/$rabbitQlname,/g" "$rabbitAbsolutepath"/QRabbit/Config/Config.json
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
            sed -i "/QLurl/s/\"\",/\"$rabbitQlurl\",/g" "$rabbitAbsolutepath"/QRabbit/Config/Config.json
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
            sed -i "/QL_CLIENTID/s/\"\",/\"$rabbitQlclientid\",/g" "$rabbitAbsolutepath"/QRabbit/Config/Config.json
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
            sed -i "/QL_SECRET/s/\"\",/\"$rabbitQlsecret\",/g" "$rabbitAbsolutepath"/QRabbit/Config/Config.json
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
                sed -i "/QL_CAPACITY/s/50,/$rabbitQlcapacity,/g" "$rabbitAbsolutepath"/QRabbit/Config/Config.json
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
                sed -i "/QL_WSCK/s/50,/$rabbitQlwsck,/g" "$rabbitAbsolutepath"/QRabbit/Config/Config.json
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
    esac
}

function qrabbitLocalversion() {
    #Management_Countdown10
    checkqRabbitport=$(docker port qrabbit)
    rqRabbitPort=${checkqRabbitport##*:}
    checkVersion=$(curl -s http://127.0.0.1:$rqRabbitPort/api/version)
    echo "获取版本$checkVersion"
    [[ $checkVersion =~ ^\{\"([^\"]+)\":\"([^\"]+)\"\}$ ]]
    qrabbitLocalversion=${BASH_REMATCH[2]}
}

function update_qrabbit() {
    qrabbitLocalversion
    echo -e "\033[1m 检查更新...\033[0m"
    #判断服务器所在地
    ipChina
    inChinaNo='No'
    if [ "$inChina_judge" = $inChinaNo ]; then
        latestVersionString=$(curl -s -d "type=qrabbit" http://62.204.54.137:1804/license/version)
        [[ $latestVersionString =~ ^\{\"([^\"]+)\":\ ([^\"]+)\,\ \"([^\"]+)\":\ \"\"\,\ \"([^\"]+)\":\ \"([^\"]+)\",\ \"([^\"]+)\":\ \"([^\"]+)\"\}$ ]]
        latestVersion=${BASH_REMATCH[5]}
        
        echo -e "\033[1m 最新版本 $latestVersion \033[0m"
        if [[ $latestVersion =~ $qrabbitLocalversion ]]; then
            echo -e "\033[1m 当前已为最新版本 \033[0m"
        else
            echo -e "\033[42;37m 开始更新 \033[0m"
            docker exec -it qrabbit git pull
            docker restart qrabbit
            echo -e "\033[42;37m 更新成功，自动重启容器qrabbit \033[0m可稍后重新运行脚本察看版本号"

            #curl -s http://127.0.0.1:$rRabbitPort/api/update
        fi
    else
        latestVersionString=$(curl -s -d "type=qrabbit" http://62.204.54.137:1804/license/version)
        [[ $latestVersionString =~ ^\{\"([^\"]+)\":\ ([^\"]+)\,\ \"([^\"]+)\":\ \"\"\,\ \"([^\"]+)\":\ \"([^\"]+)\",\ \"([^\"]+)\":\ \"([^\"]+)\"\}$ ]]
        latestVersion=${BASH_REMATCH[5]}
        
        echo -e "最新版本 $latestVersion"
        if [[ $latestVersion =~ $qrabbitLocalversion ]]; then
            echo -e "当前已为最新版本"
        else
            echo -e "\033[42;37m 开始更新 \033[0m"
            docker exec -it qrabbit git pull
            docker restart qrabbit
            echo -e "\033[42;37m 更新成功，自动重启容器qrabbit \033[0m可稍后重新运行脚本察看版本号"
        fi
    fi

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

        echo -n 等待qrabbit启动..."$i" 秒后检测更新!!
        echo -ne "\r\r" ####echo -e 处理特殊字符  \r 光标移至行首，但不换行
        sleep 1
    done
}
#检测国内镜像源
function check_Dockermirror() {
    echo "检查Docker国内镜像源……"
    cat /etc/docker/daemon.json
    if [ $? -ne 0 ]; then
        echo -e "\033[41;37m 未检测到镜像源配置 \033[0m"

        echo -e "\033[33m 是否配置国内镜像源(y/n)【默认n】 \033[0m" && read rabbitDockerconfig
        if test -z "$rabbitDockerconfig"; then
            rabbitDockerconfig='n'
        fi
        case $rabbitDockerconfig in
        [yY])
            dockerConfigpath="/etc/docker/daemon.json"
            touch dockerConfigpath
            conf_Dockermirror
            ;;
        *)
            echo -e "\033[42;37m 跳过配置\033[0m"
            ;;
        esac
    else
        echo -e "\033[42;37m 检测到国内镜像源，跳过配置\033[0m"
    fi
}
#配置镜像源
function conf_Dockermirror() {
    echo -e "\033[42;37m 开始配置国内镜像源\033[0m"
    echo -e "1.中国科学技术大学镜像源
	2.网易镜像源
	3.中国区官方镜像源
	\033[33m 请选择镜像源【默认1】 \033[0m" && read rabbitDockerconfnum
    if test -z "$rabbitDockerconfnum"; then
        rabbitDockerconfnum='1'
    fi
    case $rabbitDockerconfnum in
    1)
        echo '{
    "registry-mirrors": ["https://docker.mirrors.ustc.edu.cn"]
    }' >dockerConfigpath
        if [ $? -ne 0 ]; then
            echo -e "\033[41;37m 配置失败 \033[0m"
        else
            echo -e "\033[42;37m 中国科学技术大学镜像源 设置成功 \033[0m"
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
    "registry-mirrors": ["https://registry.docker-cn.com"]
    }' >dockerConfigpath
        if [ $? -ne 0 ]; then
            echo -e "\033[41;37m 配置失败 \033[0m"
        else
            echo -e "\033[42;37m 中国区官方镜像源 设置成功 \033[0m"
        fi
        ;;
    *)
        echo -e "\033[42;37m 输入错误，请重新选择\033[0m"
        conf_Dockermirror
        ;;
    esac
}

#安装路径
#云服务器安装路径
function clpath_choise() {
    echo -e "\033[43;37m 一键安装文件夹为QRabbit，避免与Rabbit共用配置文件 \033[0m"
    echo -e "\033[33m 请选择QRabbit配置文件安装路径(不建议与Rabbit共用配置文件)【默认/root】\033[0m" && read rabbitAbsolutepath
    if [ -z "${rabbitAbsolutepath}" ]; then
        rabbitAbsolutepath='/root'
    fi
    if [ ! -d "$rabbitAbsolutepath" ]; then
        echo -e "\033[43;37m 该目录不存在，创建目录中... \033[0m"
        mkdir -p $rabbitAbsolutepath
    fi
    cd $rabbitAbsolutepath || exit
    mkdir -p QRabbit
    cd QRabbit || exit
    cd $rabbitAbsolutepath/QRabbit && mkdir -p Config
    #是否国内判断
    ipChina_touch
}
#群晖安装路径
function sypath_choise() {
    echo -e "\033[43;37m 一键安装文件夹为QRabbit，避免与Rabbit共用配置文件 \033[0m"
    echo -e "\033[33m 请选择Rabbit配置文件安装路径【默认/volume1/docker】\033[0m" && read rabbitAbsolutepath
    if [ -z "${rabbitAbsolutepath}" ]; then
        rabbitAbsolutepath='/volume1/docker'
    fi
    if [ ! -d "$rabbitAbsolutepath" ]; then
        echo -e "\033[43;37m 该目录不存在，创建目录中... \033[0m"
        mkdir -p $rabbitAbsolutepath
    fi
    cd $rabbitAbsolutepath || exit
    mkdir -p QRabbit
    cd QRabbit || exit
    cd $rabbitAbsolutepath/QRabbit && mkdir -p Config
    #是否国内判断
    ipChina_touch
}
#配置文件下载
function confDownload() {
    cd $rabbitAbsolutepath/QRabbit/Config && wget -O Config.json https://raw.githubusercontent.com/AyeSt0/MadRabbit_Utils/master/${confVersion}Config.json
    if test $? -ne 0; then
        echo -e "\033[41;37m 下载失败...退出脚本 \033[0m"
        rm -rf $rabbitAbsolutepath/QRabbit/
        exit 0
    else
        if [ ! -f "$rabbitAbsolutepath/QRabbit/Config/Config.json" ]; then
            echo -e "\033[41;37m 下载失败...退出脚本 \033[0m"
            rm -rf $rabbitAbsolutepath/QRabbit/
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
    cd $rabbitAbsolutepath/QRabbit/Config && wget -O Config.json $rabbitProxyurl/https://raw.githubusercontent.com/AyeSt0/MadRabbit_Utils/master/${confVersion}Config.json
    if test $? -ne 0; then
        echo -e "\033[41;37m 下载失败...退出脚本 \033[0m"
        rm -rf $rabbitAbsolutepath/QRabbit/
        exit 0
    else
        if [ ! -f "$rabbitAbsolutepath/QRabbit/Config/Config.json" ]; then
            echo -e "\033[41;37m 下载失败...退出脚本 \033[0m"
            rm -rf $rabbitAbsolutepath/QRabbit/
            exit 0
        else
            echo -e "\033[42;37m 下载成功 \033[0m"
        fi
        #配置配置文件
        configquick

    fi
}
#容器端口设置
function container_port_settings_qrabbit() {
    echo -e "\033[33m qrabbit容器端口【默认5704】\033[0m" && read qrabbitPort
    if [ -z "${qrabbitPort}" ]; then
        qrabbitPort='5704'
    fi
    echo -e "\033[31m 确认Rabbit端口设为$qrabbitPort?(y/n)【默认n】\033[0m" && read rabbitPortjudge
    if [ -z "${rabbitPortjudge}" ]; then
        rabbitPortjudge='n'
    fi
    case $rabbitPortjudge in
    [yY])
        echo -e "\033[42;37m 端口已设为$qrabbitPort\033[0m"
        ;;
    *)
        echo -e "\033[41;37m 返回重设端口 \033[0m"
        container_port_settings_qrabbit
        ;;
    esac
}
function container_install_gn() {

    #容器端口设置
    container_port_settings_qrabbit

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
    RabbitImageNamePort=$(eval echo \$${RabbitImageName}Port)
    echo -e "\033[43;37m 正在安装容器到docker... \033[0m"
    sudo docker run --name qrabbit -p $RabbitImageNamePort:1234  -d  -v  "$(pwd)"/Config:/Rabbit/Config \
-it --privileged=true  ht944/qrabbit:$rabbitVersion
    if [ $? -ne 0 ]; then
        echo -e "\033[41;37m 安装失败...退出脚本 \033[0m"
    else
        echo -e "\033[42;37m 恭喜你安装成功！！！！！！\033[0m"
        echo -e "\033[33m 请到$rabbitAbsolutepath/QRabbit/Config目录下修改配置文件 \033[0m"
        echo -e "\033[33m 然后使用命令\033[0m \033[32m docker restart qrabbit\033[0m \033[33m重启更新配置\033[0m"
        echo -e "\033[43;37m 开始检测更新... \033[0m"
        echo -e "\033[43;31m 注意！如无法进行更新，请自行访问\033[0m\033[43;32m https://你的$RabbitImageName地址/api/update\033[0m\033[43;31m检查更新！ \033[0m"
        #检测更新倒计时
        Upgrade_Countdown
        #更新检测
        update_qrabbit
    fi
}

function container_install_gw() {
    #容器端口设置
    container_port_settings_qrabbit

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
    RabbitImageNamePort=$(eval echo \$${RabbitImageName}Port)
    echo -e "\033[43;37m 正在安装容器到docker... \033[0m"
    sudo docker run   --name qrabbit -p $RabbitImageNamePort:1234  -d  -v  "$(pwd)"/Config:/Rabbit/Config \
-it --privileged=true  ht944/qrabbit:latest
    if [ $? -ne 0 ]; then
        echo -e "\033[41;37m 安装失败...退出脚本 \033[0m"
    else
        echo -e "\033[42;37m 恭喜你安装成功！！！！！！\033[0m"
        echo -e "\033[33m 请到$rabbitAbsolutepath/QRabbit/Config目录下修改配置文件 \033[0m"
        echo -e "\033[33m 然后使用命令\033[0m \033[32m docker restart qrabbit\033[0m \033[33m重启更新配置\033[0m"
        echo -e "\033[43;37m 开始检测更新... \033[0m"
        echo -e "\033[43;31m 注意！如无法进行更新，请自行访问\033[0m\033[43;32m https://你的$RabbitImageName地址/api/update\033[0m\033[43;31m检查更新！ \033[0m"
        #检测更新倒计时
        Upgrade_Countdown
        #更新检测
        update_qrabbit
    fi
}
function container_install_sy() {
    #容器端口设置
    container_port_settings_qrabbit

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

    RabbitImageNamePort=$(eval echo \$${RabbitImageName}Port)
    echo -e "\033[43;37m 正在安装容器到docker... \033[0m"
    sudo docker run --name qrabbit -p $RabbitImageNamePort:1234 -d -v $rabbitAbsolutepath/QRabbit/Config:/Rabbit/Config \
-it --privileged=true ht944/qrabbit:$rabbitVersion
    if [ $? -ne 0 ]; then
        echo -e "\033[41;37m 安装失败...退出脚本 \033[0m"
    else
        echo -e "\033[42;37m 恭喜你安装成功！！！！！！\033[0m"
        echo -e "\033[33m 请到$rabbitAbsolutepath/QRabbit/Config目录下修改配置文件 \033[0m"
        echo -e "\033[33m 然后使用命令\033[0m \033[32m docker restart qrabbit\033[0m \033[33m重启更新配置\033[0m"
        echo -e "\033[43;37m 开始检测更新... \033[0m"
        echo -e "\033[43;31m 注意！如无法进行更新，请自行访问\033[0m\033[43;32m https://你的rabbit地址/api/update\033[0m\033[43;31m检查更新！ \033[0m"
        #检测更新倒计时
        Upgrade_Countdown
        #更新检测
        update_qrabbit
    fi
}
#是否国内
function whereAreyou() {
    touch "$container_path"/ipChina.conf
    chmod 777 "$container_path"/ipChina.conf
    echo -e "\033[43;31m 未使用最新版本一键安装的将跳出该提示\033[0m"
    echo -e "\033[43;31m 选择ip后将在安装目录下生成ipChina文件\033[0m"
    echo -e "\033[43;31m 该选项仅出现一次，将有助于优化云端版本号获取\033[0m"
    echo -e "\033[33m ip是否国内(Y/N)【默认Y】\033[0m" && read inChina_judge
    if [ -z "${inChina_judge}" ]; then
        inChina_judge='Yes'
        echo "Yes"
    fi
    case $inChina_judge in

    [yY])
        inChina_judge='Yes'
        echo "#是否国内鸡（Yes/No）" >>"$container_path/ipChina.conf"
        echo "$inChina_judge" >>"$container_path/ipChina.conf"
        echo -e "\033[33m GitHub加速地址【默认https://ghproxy.com】\033[0m" && read inChinaProxyurl
        if test -z "$inChinaProxyurl"; then
            inChinaProxyurl='https://ghproxy.com'
            echo "#GitHub加速地址" >>"$container_path/ipChina.conf"
            echo "$inChinaProxyurl" >>"$container_path/ipChina.conf"
            echo "$inChinaProxyurl"
        fi
        ;;
    *)
        inChina_judge='No'
        echo "#是否国内鸡（Yes/No）" >>"$container_path/ipChina.conf"
        echo "$inChina_judge" >>"$container_path/ipChina.conf"
        echo "#GitHub加速地址" >>"$container_path/ipChina.conf"
        echo "不配置" >>"$container_path/ipChina.conf"
        ;;
    esac
    echo -e "\033[43;31m 如需更改以上确认信息，请到$container_path/ipChina.conf进行修改\033[0m"
}
#判断是否国内鸡
function ipChina() {
    container_info=$(docker inspect qrabbit | grep Mounts -A 20)
    container_info_cut=${container_info#*\"Source\": \"}
    container_path=${container_info_cut%%\"*}
    if [ -f "$container_path"/ipChina.conf ]; then
        inChina_path="$container_path/ipChina.conf"
        inChina_judge=$(sed -n '2p' /root/QRabbit/Config/ipChina.conf)
        inChina_proxy=$(sed -n '4p' /root/QRabbit/Config/ipChina.conf)
        if [ -z "$inChina_proxy" ]; then
            inChina_proxy=''
        fi

    else
        whereAreyou
    fi
}
function ipChina_touch() {
    touch $rabbitAbsolutepath/QRabbit/Config/ipChina.conf
    chmod 777 "$container_path"/ipChina.conf
    echo "#是否国内鸡（Yes/No）" >>"$container_path/ipChina.conf"
    echo "$inChina" >>"$rabbitAbsolutepath/QRabbit/Config/ipChina.conf"
    if [ -z "$rabbitProxyurl" ]; then
        rabbitProxyurl='不配置'
        echo "#GitHub加速地址" >>"$container_path/ipChina.conf"
        echo "$rabbitProxyurl" >>"$rabbitAbsolutepath/QRabbit/Config/ipChina.conf"
    else
        echo "#GitHub加速地址" >>"$container_path/ipChina.conf"
        echo "$rabbitProxyurl" >>"$rabbitAbsolutepath/QRabbit/Config/ipChina.conf"
    fi
}

function uninstall_cl_qrabbit() {
    echo -e "\033[41;33m 是否确认卸载qrabbit(y/n)【默认n】\033[0m" && read rabbitDelete
    if [ -z "${rabbitDelete}" ]; then
        rabbitDelete='n'
        echo "n"
    fi
    case $rabbitDelete in
    [yY])
        echo -e "\033[41;33m 是否同时清除配置路径文件(y/n)【默认n】\033[0m" && read rabbitDeletefile
        if [ -z "${rabbitDeletefile}" ]; then
            rabbitDeletefile='n'
            echo "n"
        fi
        case $rabbitDeletefile in
        [yY])
            echo -e "\033[41;33m 是否同时卸载qrabbit镜像(y/n)【默认n】\033[0m" && read rabbitimageDelete
            if [ -z "${rabbitimageDelete}" ]; then
                rabbitimageDelete='n'
                echo "n"
            fi
            case $rabbitimageDelete in
            [yY])
                echo -e "\033[33m 卸载容器及镜像，清除配置路径文件\033[0m"
                container_info=$(docker inspect qrabbit | grep Mounts -A 20)
                container_info_cut=${container_info#*\"Source\": \"}
                container_path=${container_info_cut%%\"*}
                cd $container_path || exit
                cd ..
                cd ..
                echo -e "\033[33m 停止容器\033[0m"
                docker stop qrabbit
                echo -e "\033[33m 卸载容器\033[0m"
                docker rm -f qrabbit
                echo -e "\033[33m 清除配置路径文件\033[0m"
                rm -rf QRabbit/
                echo -e "\033[33m 卸载镜像\033[0m"
                uninstall_imageJudge_qrabbit
                ;;
            *)
                echo -e "\033[33m 卸载容器，清除配置路径文件，保留镜像\033[0m"
                container_info=$(docker inspect qrabbit | grep Mounts -A 20)
                container_info_cut=${container_info#*\"Source\": \"}
                container_path=${container_info_cut%%\"*}
                cd $container_path || exit
                cd ..
                cd ..
                echo -e "\033[33m 停止容器\033[0m"
                docker stop qrabbit
                echo -e "\033[33m 卸载容器\033[0m"
                docker rm -f qrabbit
                echo -e "\033[33m 清除配置路径文件\033[0m"
                rm -rf QRabbit/
                ;;
            esac
            echo -e "\033[33m 卸载完成\033[0m"
            exit 0
            ;;
        *)
            echo -e "\033[41;33m 是否同时卸载qrabbit镜像(y/n)【默认n】\033[0m" && read rabbitimageDelete
            if [ -z "${rabbitimageDelete}" ]; then
                rabbitimageDelete='n'
                echo "n"
            fi
            case $rabbitimageDelete in
            [yY])
                echo -e "\033[33m 卸载容器及镜像，保留配置路径文件\033[0m"

                echo -e "\033[33m 停止容器\033[0m"
                docker stop qrabbit
                echo -e "\033[33m 卸载容器\033[0m"
                docker rm -f qrabbit
                echo -e "\033[33m 卸载镜像\033[0m"
                uninstall_imageJudge_qrabbit
                ;;
            *)
                echo -e "\033[33m 卸载容器，保留配置路径文件及镜像\033[0m"
                echo -e "\033[33m 停止容器\033[0m"
                docker stop qrabbit
                echo -e "\033[33m 卸载容器\033[0m"
                docker rm -f qrabbit
                ;;
            esac
            echo -e "\033[33m 卸载完成\033[0m"
            exit 0
            ;;
        esac
        ;;
    *)
        echo -e "\033[33m 取消卸载，返回菜单\033[0m"
        Cloud_manage_menu_qrabbit
        ;;
    esac

}

function uninstall_sy_qrabbit() {
    echo -e "\033[41;33m 是否确认卸载qrabbit(y/n)【默认n】\033[0m" && read rabbitDelete
    if [ -z "${rabbitDelete}" ]; then
        rabbitDelete='n'
        echo "n"
    fi
    case $rabbitDelete in
    [yY])
        echo -e "\033[41;33m 是否同时清除配置路径文件(y/n)【默认n】\033[0m" && read rabbitDeletefile
        if [ -z "${rabbitDeletefile}" ]; then
            rabbitDeletefile='n'
            echo "n"
        fi
        case $rabbitDeletefile in
        [yY])
            echo -e "\033[41;33m 是否同时卸载qrabbit镜像(y/n)【默认n】\033[0m" && read rabbitimageDelete
            if [ -z "${rabbitimageDelete}" ]; then
                rabbitimageDelete='n'
                echo "n"
            fi
            case $rabbitimageDelete in
            [yY])
                echo -e "\033[33m 卸载容器及镜像，清除配置路径文件\033[0m"
                container_info=$(docker inspect qrabbit | grep Mounts -A 20)
                container_info_cut=${container_info#*\"Source\": \"}
                container_path=${container_info_cut%%\"*}
                cd $container_path || exit
                cd ..
                cd ..
                echo -e "\033[33m 停止容器\033[0m"
                docker stop qrabbit
                echo -e "\033[33m 卸载容器\033[0m"
                docker rm -f qrabbit
                echo -e "\033[33m 清除配置路径文件\033[0m"
                rm -rf QRabbit/
                echo -e "\033[33m 卸载镜像\033[0m"
                uninstall_imageJudge_qrabbit
                ;;
            *)
                echo -e "\033[33m 卸载容器，清除配置路径文件，保留镜像\033[0m"
                container_info=$(docker inspect qrabbit | grep Mounts -A 20)
                container_info_cut=${container_info#*\"Source\": \"}
                container_path=${container_info_cut%%\"*}
                cd $container_path || exit
                cd ..
                cd ..
                echo -e "\033[33m 停止容器\033[0m"
                docker stop qrabbit
                echo -e "\033[33m 卸载容器\033[0m"
                docker rm -f qrabbit
                echo -e "\033[33m 清除配置路径文件\033[0m"
                rm -rf QRabbit/
                ;;
            esac
            echo -e "\033[33m 卸载完成\033[0m"
            exit 0
            ;;
        *)
            echo -e "\033[41;33m 是否同时卸载qrabbit镜像(y/n)【默认n】\033[0m" && read rabbitimageDelete
            if [ -z "${rabbitimageDelete}" ]; then
                rabbitimageDelete='n'
                echo "n"
            fi
            case $rabbitimageDelete in
            [yY])
                echo -e "\033[33m 卸载容器及镜像，保留配置路径文件\033[0m"

                echo -e "\033[33m 停止容器\033[0m"
                docker stop qrabbit
                echo -e "\033[33m 卸载容器\033[0m"
                docker rm -f qrabbit
                echo -e "\033[33m 卸载镜像\033[0m"
                uninstall_imageJudge_qrabbit
                ;;
            *)
                echo -e "\033[33m 卸载容器，保留配置路径文件及镜像\033[0m"
                echo -e "\033[33m 停止容器\033[0m"
                docker stop qrabbit
                echo -e "\033[33m 卸载容器\033[0m"
                docker rm -f qrabbit
                ;;
            esac
            echo -e "\033[33m 卸载完成\033[0m"
            exit 0
            ;;
        esac
        ;;
    *)
        echo -e "\033[33m 取消卸载，返回菜单\033[0m"
        Synology_manage_menu_qrabbit
        ;;
    esac

}

function uninstall_imageJudge_qrabbit() {
    osCore=$(uname -m)
    osArm1='arm'
    osArm2='aarch'
    echo -e "检测内核为 \033[34m $osCore \033[0m "
    if [[ $osCore =~ $osArm1 ]] || [[ $osCore =~ $osArm2 ]]; then
        docker rmi ht944/qrabbit:arm
    else
        docker rmi ht944/qrabbit:latest
    fi
}

system_Judgment
