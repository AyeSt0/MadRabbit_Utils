#!/bin/bash
#!/bin/sh
<<INFO
SCRIPYT:RabbitUtils.sh
AUTHOR:AyeSt0
DATE:2022-11-30
DESCRIBE:One click installation of rabbit
SYSTEM:linux
WARNING:This script is only used for testing, learning and research. It is not allowed to be used for commercial purposes. Its legitimacy, accuracy, integrity and effectiveness cannot be guaranteed. Please make your own judgment according to the situation. The original author's warehouse address is https://github.com/HT944/MadRabbit
VERSION:1.2.0
MODIFY:debug
INFO
clear
trap "" 2 3 15
vVersion='T1.2.0'
uUser=$(whoami)
dDate=$(date +%d/%m/%Y)
function system_Judgment() {
    uNames=$(sudo uname -a)
    syosNames='synology'
    fastRabbitContainerName="fastrabbit"
    madRabbitContainerName="madrabbit"
    rabbitcontainerName="rabbit"
    if [[ $uNames =~ $syosNames ]]; then
        echo -e "\033[32m 忙猜你是群晖\033[0m"
        if [[ -n $(docker ps -q -f "name=^${fastRabbitContainerName}$") ]]; then
            echo -e "\033[42;37m 检测到fastrabbit容器\033[0m"
            #当前版本
            fastRabbitLocalversion
            if [[ -n $(docker ps -q -f "name=^${madRabbitContainerName}$") ]]; then
                echo -e "\033[42;37m 检测到madrabbit容器\033[0m"
                #当前版本
                madRabbitLocalversion
                if [[ -n $(docker ps -q -f "name=^${rabbitcontainerName}$") ]]; then
                    echo -e "\033[42;37m 检测到rabbit容器\033[0m"
                    #当前版本
                    rabbitLocalversion
                    echo -e "\033[42;37m 群晖一键管理脚本\033[0m   \033[1m启动>>>>>>>>>>>>\033[0m"
                    echo ""
                    echo -e "\033[43;31m 未购买Rabbit授权是无法使用Rabbit的\033[0m"
                    echo -e "\033[43;31m 具体购买请关注电报@Rabbit_one\033[0m"
                    echo -e "\033[43;37m\033[1m 再次强调本人AyeSt0仅为一键脚本作者，Rabbit相关请找Mad\033[0m\033[0m"
                    Synology_manage_main_menu
                else
                    #echo -e "\033[42;37m 未检测到rabbit容器\033[0m   \033[1m启动一键管理脚本>>>>\033[0m"
                    echo -e "\033[42;37m 群晖一键管理脚本\033[0m   \033[1m启动>>>>>>>>>>>>\033[0m"
                    echo ""
                    echo -e "\033[43;31m 未购买Rabbit授权是无法使用Rabbit的\033[0m"
                    echo -e "\033[43;31m 具体购买请关注电报@Rabbit_one\033[0m"
                    echo -e "\033[43;37m\033[1m 再次强调本人AyeSt0仅为一键脚本作者，Rabbit相关请找Mad\033[0m\033[0m"
                    Synology_manage_main12_menu
                fi
            else
                #echo -e "\033[42;37m 未检测到madrabbit容器\033[0m"
                if [[ -n $(docker ps -q -f "name=^${rabbitcontainerName}$") ]]; then
                    echo -e "\033[42;37m 检测到rabbit容器\033[0m"
                    #当前版本
                    rabbitLocalversion
                    echo -e "\033[42;37m 群晖一键管理脚本\033[0m   \033[1m启动>>>>>>>>>>>>\033[0m"
                    echo ""
                    echo -e "\033[43;31m 未购买Rabbit授权是无法使用Rabbit的\033[0m"
                    echo -e "\033[43;31m 具体购买请关注电报@Rabbit_one\033[0m"
                    echo -e "\033[43;37m\033[1m 再次强调本人AyeSt0仅为一键脚本作者，Rabbit相关请找Mad\033[0m\033[0m"
                    Synology_manage_main13_menu
                else
                    #echo -e "\033[42;37m 未检测到rabbit容器\033[0m   \033[1m启动一键管理脚本>>>>\033[0m"
                    echo -e "\033[42;37m 群晖一键管理脚本\033[0m   \033[1m启动>>>>>>>>>>>>\033[0m"
                    echo ""
                    echo -e "\033[43;31m 未购买Rabbit授权是无法使用Rabbit的\033[0m"
                    echo -e "\033[43;31m 具体购买请关注电报@Rabbit_one\033[0m"
                    echo -e "\033[43;37m\033[1m 再次强调本人AyeSt0仅为一键脚本作者，Rabbit相关请找Mad\033[0m\033[0m"
                    Synology_manage_fastrabbit_menu
                fi
            fi
        else
            #echo -e "\033[42;37m 未检测到fastrabbit容器\033[0m"
            if [[ -n $(docker ps -q -f "name=^${madRabbitContainerName}$") ]]; then
                echo -e "\033[42;37m 检测到madrabbit容器\033[0m"
                #当前版本
                madRabbitLocalversion
                if [[ -n $(docker ps -q -f "name=^${rabbitcontainerName}$") ]]; then
                    echo -e "\033[42;37m 检测到rabbit容器\033[0m"
                    #当前版本
                    rabbitLocalversion
                    echo -e "\033[42;37m 群晖一键管理脚本\033[0m   \033[1m启动>>>>>>>>>>>>\033[0m"
                    echo ""
                    echo -e "\033[43;31m 未购买Rabbit授权是无法使用Rabbit的\033[0m"
                    echo -e "\033[43;31m 具体购买请关注电报@Rabbit_one\033[0m"
                    echo -e "\033[43;37m\033[1m 再次强调本人AyeSt0仅为一键脚本作者，Rabbit相关请找Mad\033[0m\033[0m"
                    Synology_manage_main23_menu
                else
                    #echo -e "\033[42;37m 未检测到rabbit容器\033[0m   \033[1m启动一键管理脚本>>>>\033[0m"
                    echo -e "\033[42;37m 群晖一键管理脚本\033[0m   \033[1m启动>>>>>>>>>>>>\033[0m"
                    echo ""
                    echo -e "\033[43;31m 未购买Rabbit授权是无法使用Rabbit的\033[0m"
                    echo -e "\033[43;31m 具体购买请关注电报@Rabbit_one\033[0m"
                    echo -e "\033[43;37m\033[1m 再次强调本人AyeSt0仅为一键脚本作者，Rabbit相关请找Mad\033[0m\033[0m"
                    Synology_manage_madrabbit_menu
                fi
            else
                #echo -e "\033[42;37m 未检测到madrabbit容器\033[0m"
                if [[ -n $(docker ps -q -f "name=^${rabbitcontainerName}$") ]]; then
                    echo -e "\033[42;37m 检测到rabbit容器\033[0m"
                    #当前版本
                    rabbitLocalversion
                    echo -e "\033[42;37m 群晖一键管理脚本\033[0m   \033[1m启动>>>>>>>>>>>>\033[0m"
                    echo ""
                    echo -e "\033[43;31m 未购买Rabbit授权是无法使用Rabbit的\033[0m"
                    echo -e "\033[43;31m 具体购买请关注电报@Rabbit_one\033[0m"
                    echo -e "\033[43;37m\033[1m 再次强调本人AyeSt0仅为一键脚本作者，Rabbit相关请找Mad\033[0m\033[0m"
                    Synology_manage_rabbit_menu
                else
                    #echo -e "\033[42;37m 未检测到rabbit容器\033[0m"
                    echo -e "\033[42;37m 群晖一键安装脚本\033[0m   \033[1m启动>>>>>>>>>>>>\033[0m"
                    echo ""
                    echo -e "\033[43;31m 未购买Rabbit授权是无法使用Rabbit的\033[0m"
                    echo -e "\033[43;31m 具体购买请关注电报@Rabbit_one\033[0m"
                    echo -e "\033[43;37m\033[1m 再次强调本人AyeSt0仅为一键脚本作者，Rabbit相关请找Mad\033[0m\033[0m"
                    Synology_install_main_menu
                fi
            fi
        fi

    else
        echo -e "\033[32m 忙猜你是云服务器\033[0m"
        if [[ -n $(docker ps -q -f "name=^${fastRabbitContainerName}$") ]]; then
            echo -e "\033[42;37m 检测到fastrabbit容器\033[0m"
            #当前版本
            fastRabbitLocalversion
            if [[ -n $(docker ps -q -f "name=^${madRabbitContainerName}$") ]]; then
                echo -e "\033[42;37m 检测到madrabbit容器\033[0m"
                #当前版本
                madRabbitLocalversion
                if [[ -n $(docker ps -q -f "name=^${rabbitcontainerName}$") ]]; then
                    echo -e "\033[42;37m 检测到rabbit容器\033[0m"
                    #当前版本
                    rabbitLocalversion
                    echo -e "\033[42;37m 云服务器一键管理脚本\033[0m   \033[1m启动>>>>>>>>>>>>\033[0m"
                    echo ""
                    echo -e "\033[43;31m 未购买Rabbit授权是无法使用Rabbit的\033[0m"
                    echo -e "\033[43;31m 具体购买请关注电报@Rabbit_one\033[0m"
                    echo -e "\033[43;37m\033[1m 再次强调本人AyeSt0仅为一键脚本作者，Rabbit相关请找Mad\033[0m\033[0m"
                    Cloud_manage_main_menu
                else
                    #echo -e "\033[42;37m 未检测到rabbit容器\033[0m   \033[1m启动一键管理脚本>>>>\033[0m"
                    echo -e "\033[42;37m 云服务器一键管理脚本\033[0m   \033[1m启动>>>>>>>>>>>>\033[0m"
                    echo ""
                    echo -e "\033[43;31m 未购买Rabbit授权是无法使用Rabbit的\033[0m"
                    echo -e "\033[43;31m 具体购买请关注电报@Rabbit_one\033[0m"
                    echo -e "\033[43;37m\033[1m 再次强调本人AyeSt0仅为一键脚本作者，Rabbit相关请找Mad\033[0m\033[0m"
                    Cloud_manage_main12_menu
                fi
            else
                #echo -e "\033[42;37m 未检测到madrabbit容器\033[0m"
                if [[ -n $(docker ps -q -f "name=^${rabbitcontainerName}$") ]]; then
                    echo -e "\033[42;37m 检测到rabbit容器\033[0m"
                    #当前版本
                    rabbitLocalversion
                    echo -e "\033[42;37m 云服务器一键管理脚本\033[0m   \033[1m启动>>>>>>>>>>>>\033[0m"
                    echo ""
                    echo -e "\033[43;31m 未购买Rabbit授权是无法使用Rabbit的\033[0m"
                    echo -e "\033[43;31m 具体购买请关注电报@Rabbit_one\033[0m"
                    echo -e "\033[43;37m\033[1m 再次强调本人AyeSt0仅为一键脚本作者，Rabbit相关请找Mad\033[0m\033[0m"
                    Cloud_manage_main13_menu
                else
                    #echo -e "\033[42;37m 未检测到rabbit容器\033[0m   \033[1m启动一键管理脚本>>>>\033[0m"
                    echo -e "\033[42;37m 云服务器一键管理脚本\033[0m   \033[1m启动>>>>>>>>>>>>\033[0m"
                    echo ""
                    echo -e "\033[43;31m 未购买Rabbit授权是无法使用Rabbit的\033[0m"
                    echo -e "\033[43;31m 具体购买请关注电报@Rabbit_one\033[0m"
                    echo -e "\033[43;37m\033[1m 再次强调本人AyeSt0仅为一键脚本作者，Rabbit相关请找Mad\033[0m\033[0m"
                    Cloud_manage_fastrabbit_menu
                fi
            fi
        else
            #echo -e "\033[42;37m 未检测到fastrabbit容器\033[0m"
            if [[ -n $(docker ps -q -f "name=^${madRabbitContainerName}$") ]]; then
                echo -e "\033[42;37m 检测到madrabbit容器\033[0m"
                #当前版本
                madRabbitLocalversion
                if [[ -n $(docker ps -q -f "name=^${rabbitcontainerName}$") ]]; then
                    echo -e "\033[42;37m 检测到rabbit容器\033[0m"
                    #当前版本
                    rabbitLocalversion
                    echo -e "\033[42;37m 云服务器一键管理脚本\033[0m   \033[1m启动>>>>>>>>>>>>\033[0m"
                    echo ""
                    echo -e "\033[43;31m 未购买Rabbit授权是无法使用Rabbit的\033[0m"
                    echo -e "\033[43;31m 具体购买请关注电报@Rabbit_one\033[0m"
                    echo -e "\033[43;37m\033[1m 再次强调本人AyeSt0仅为一键脚本作者，Rabbit相关请找Mad\033[0m\033[0m"
                    Cloud_manage_main23_menu
                else
                    #echo -e "\033[42;37m 未检测到rabbit容器\033[0m   \033[1m启动一键管理脚本>>>>\033[0m"
                    echo -e "\033[42;37m 云服务器一键管理脚本\033[0m   \033[1m启动>>>>>>>>>>>>\033[0m"
                    echo ""
                    echo -e "\033[43;31m 未购买Rabbit授权是无法使用Rabbit的\033[0m"
                    echo -e "\033[43;31m 具体购买请关注电报@Rabbit_one\033[0m"
                    echo -e "\033[43;37m\033[1m 再次强调本人AyeSt0仅为一键脚本作者，Rabbit相关请找Mad\033[0m\033[0m"
                    Cloud_manage_madrabbit_menu
                fi
            else
                #echo -e "\033[42;37m 未检测到madrabbit容器\033[0m"
                if [[ -n $(docker ps -q -f "name=^${rabbitcontainerName}$") ]]; then
                    echo -e "\033[42;37m 检测到rabbit容器\033[0m"
                    #当前版本
                    rabbitLocalversion
                    echo -e "\033[42;37m 云服务器一键管理脚本\033[0m   \033[1m启动>>>>>>>>>>>>\033[0m"
                    echo ""
                    echo -e "\033[43;31m 未购买Rabbit授权是无法使用Rabbit的\033[0m"
                    echo -e "\033[43;31m 具体购买请关注电报@Rabbit_one\033[0m"
                    echo -e "\033[43;37m\033[1m 再次强调本人AyeSt0仅为一键脚本作者，Rabbit相关请找Mad\033[0m\033[0m"
                    Cloud_manage_rabbit_menu
                else
                    #echo -e "\033[42;37m 未检测到rabbit容器\033[0m"
                    echo -e "\033[42;37m 云服务器一键安装脚本\033[0m   \033[1m启动>>>>>>>>>>>>\033[0m"
                    echo ""
                    echo -e "\033[43;31m 未购买Rabbit授权是无法使用Rabbit的\033[0m"
                    echo -e "\033[43;31m 具体购买请关注电报@Rabbit_one\033[0m"
                    echo -e "\033[43;37m\033[1m 再次强调本人AyeSt0仅为一键脚本作者，Rabbit相关请找Mad\033[0m\033[0m"
                    Cloud_install_main_menu
                fi
            fi
        fi
    fi
}

function Cloud_manage_main_menu() {
    cat <<eof

$(echo -e "\033[36m-----------------------------------------\033[0m")
$(echo -e "\033[36m|    User:$uUser        Date:$dDate   |\033[0m")
$(echo -e "\033[36m|     \033[1m欢迎使用【Rabbit一键管理脚本】\033[0m    \033[36m|\033[0m")
$(echo -e "\033[36m|    v$vVersion                by AyeSt0    |\033[0m")
$(echo -e "\033[36m-----------------------------------------\033[0m")
$(echo -e "\033[33m 请选择管理版本\033[0m")

$(echo -e "\033[32m\033[1m 【1】FastRabbit\033[0m")

$(echo -e "\033[31m\033[1m 【2】MadRabbit\033[0m")

$(echo -e "\033[31m\033[1m 【3】Rabbit\033[0m")

$(echo -e "\033[31m 【4】退出\033[0m")

eof

    read -p "请输入对应选项的数字：" num2

    case $num2 in

    1)
        Cloud_manage_fastrabbit_menu
        ;;

    2)
        Cloud_manage_madrabbit_menu
        ;;

    3)
        Cloud_manage_rabbit_menu
        ;;
    4)
        exit 0
        ;;

    esac

}

function Cloud_manage_main12_menu() {
    cat <<eof

$(echo -e "\033[36m-----------------------------------------\033[0m")
$(echo -e "\033[36m|    User:$uUser        Date:$dDate   |\033[0m")
$(echo -e "\033[36m|     \033[1m欢迎使用【Rabbit一键管理脚本】\033[0m    \033[36m|\033[0m")
$(echo -e "\033[36m|    v$vVersion                by AyeSt0    |\033[0m")
$(echo -e "\033[36m-----------------------------------------\033[0m")
$(echo -e "\033[33m 请选择管理版本\033[0m")

$(echo -e "\033[32m\033[1m 【1】FastRabbit\033[0m")

$(echo -e "\033[31m\033[1m 【2】MadRabbit\033[0m")

$(echo -e "\033[31m\033[1m 【3】安装Rabbit\033[0m")

$(echo -e "\033[31m 【4】退出\033[0m")

eof

    read -p "请输入对应选项的数字：" num241

    case $num241 in

    1)
        Cloud_manage_fastrabbit_menu
        ;;

    2)
        Cloud_manage_madrabbit_menu
        ;;

    3)
        RabbitImageName=rabbit
        Cloud_install_menu_r
        ;;
    4)
        exit 0
        ;;

    esac

}
function Cloud_manage_main13_menu() {
    cat <<eof

$(echo -e "\033[36m-----------------------------------------\033[0m")
$(echo -e "\033[36m|    User:$uUser        Date:$dDate   |\033[0m")
$(echo -e "\033[36m|     \033[1m欢迎使用【Rabbit一键管理脚本】\033[0m    \033[36m|\033[0m")
$(echo -e "\033[36m|    v$vVersion                by AyeSt0    |\033[0m")
$(echo -e "\033[36m-----------------------------------------\033[0m")
$(echo -e "\033[33m 请选择管理版本\033[0m")

$(echo -e "\033[32m\033[1m 【1】FastRabbit\033[0m")

$(echo -e "\033[31m\033[1m 【2】安装MadRabbit（临时）\033[0m")

$(echo -e "\033[31m\033[1m 【3】Rabbit\033[0m")

$(echo -e "\033[31m 【4】退出\033[0m")

eof

    read -p "请输入对应选项的数字：" num2

    case $num2 in

    1)
        Cloud_manage_fastrabbit_menu
        ;;

    2)
        RabbitImageName=madrabbit
        Cloud_install_menu_mr
        ;;

    3)
        Cloud_manage_rabbit_menu
        ;;
    4)
        exit 0
        ;;

    esac

}
function Cloud_manage_main23_menu() {
    cat <<eof

$(echo -e "\033[36m-----------------------------------------\033[0m")
$(echo -e "\033[36m|    User:$uUser        Date:$dDate   |\033[0m")
$(echo -e "\033[36m|     \033[1m欢迎使用【Rabbit一键管理脚本】\033[0m    \033[36m|\033[0m")
$(echo -e "\033[36m|    v$vVersion                by AyeSt0    |\033[0m")
$(echo -e "\033[36m-----------------------------------------\033[0m")
$(echo -e "\033[33m 请选择管理版本\033[0m")

$(echo -e "\033[32m\033[1m 【1】安装FastRabbit（未实装）\033[0m")

$(echo -e "\033[31m\033[1m 【2】MadRabbit\033[0m")

$(echo -e "\033[31m\033[1m 【3】Rabbit\033[0m")

$(echo -e "\033[31m 【4】退出\033[0m")

eof

    read -p "请输入对应选项的数字：" num2

    case $num2 in

    1)
        RabbitImageName=fastrabbit
        Cloud_install_menu_fr
        ;;

    2)
        Cloud_manage_madrabbit_menu
        ;;

    3)
        Cloud_manage_rabbit_menu
        ;;
    4)
        exit 0
        ;;

    esac

}

function Cloud_manage_fastrabbit_menu() {

    cat <<eof

$(echo -e "\033[36m-----------------------------------------\033[0m")
$(echo -e "\033[36m|    User:$uUser        Date:$dDate   |\033[0m")
$(echo -e "\033[36m|   \033[1m欢迎使用【FastRabbit一键管理脚本】\033[0m  \033[36m|\033[0m")
$(echo -e "\033[36m|    v$vVersion                by AyeSt0    |\033[0m")
$(echo -e "\033[36m|        \033[1m\033[32m当前FastRabbit版本 $fastRabbitLocalversion\033[0m\033[0m       \033[36m|\033[0m")
$(echo -e "\033[36m|     容器刚启动可能不会显示版本号      |\033[0m")
$(echo -e "\033[36m|         可以重新运行脚本重试          |\033[0m")
$(echo -e "\033[36m-----------------------------------------\033[0m")
$(echo -e "\033[33m\033[1m 请选择合适的选项\033[0m")

$(echo -e "\033[32m\033[1m 【1】更新\033[0m")

$(echo -e "\033[31m\033[1m 【2】卸载\033[0m")

$(echo -e "\033[32m\033[1m 【3】安装MadRabbit（临时）\033[0m")

$(echo -e "\033[32m\033[1m 【4】安装Rabbit\033[0m")

$(echo -e "\033[31m 【5】退出\033[0m")

eof

    read -p "请输入对应选项的数字：" num21

    case $num21 in

    1)
        update_fastRabbit
        ;;

    2)
        uninstall_cl_fastRabbit
        ;;

    3)
        RabbitImageName=madrabbit
        Cloud_install_menu_mr
        ;;

    4)
        RabbitImageName=rabbit
        Cloud_install_menu_r
        ;;

    5)
        exit 0
        ;;

    esac

}

function Cloud_manage_madrabbit_menu() {

    cat <<eof

$(echo -e "\033[36m-----------------------------------------\033[0m")
$(echo -e "\033[36m|    User:$uUser        Date:$dDate   |\033[0m")
$(echo -e "\033[36m|    \033[1m欢迎使用【MadRabbit一键管理脚本】\033[0m  \033[36m|\033[0m")
$(echo -e "\033[36m|    v$vVersion                by AyeSt0    |\033[0m")
$(echo -e "\033[36m|         \033[1m\033[32m当前MadRabbit版本 $madRabbitLocalversion\033[0m\033[0m       \033[36m|\033[0m")
$(echo -e "\033[36m|     容器刚启动可能不会显示版本号      |\033[0m")
$(echo -e "\033[36m|         可以重新运行脚本重试          |\033[0m")
$(echo -e "\033[36m-----------------------------------------\033[0m")
$(echo -e "\033[33m\033[1m 请选择合适的选项\033[0m")

$(echo -e "\033[32m\033[1m 【1】更新\033[0m")

$(echo -e "\033[31m\033[1m 【2】卸载\033[0m")

$(echo -e "\033[32m\033[1m 【3】安装FastRabbit（未实装）\033[0m")

$(echo -e "\033[32m\033[1m 【4】安装Rabbit\033[0m")

$(echo -e "\033[31m 【5】退出\033[0m")

eof

    read -p "请输入对应选项的数字：" num22

    case $num22 in

    1)
        update_madRabbit
        ;;

    2)
        uninstall_cl_madRabbit
        ;;
    3)
        RabbitImageName=fastrabbit
        Cloud_install_menu_fr
        ;;

    4)
        RabbitImageName=rabbit
        Cloud_install_menu_r
        ;;

    5)
        exit 0
        ;;

    esac

}

function Cloud_manage_rabbit_menu() {

    cat <<eof

$(echo -e "\033[36m-----------------------------------------\033[0m")
$(echo -e "\033[36m|    User:$uUser        Date:$dDate   |\033[0m")
$(echo -e "\033[36m|     \033[1m欢迎使用【Rabbit一键管理脚本】\033[0m    \033[36m|\033[0m")
$(echo -e "\033[36m|    v$vVersion                by AyeSt0    |\033[0m")
$(echo -e "\033[36m|          \033[1m\033[32m当前Rabbit版本 $rabbitLocalversion\033[0m\033[0m         \033[36m|\033[0m")
$(echo -e "\033[36m|     容器刚启动可能不会显示版本号      |\033[0m")
$(echo -e "\033[36m|         可以重新运行脚本重试          |\033[0m")
$(echo -e "\033[36m-----------------------------------------\033[0m")
$(echo -e "\033[33m\033[1m 请选择合适的选项\033[0m")

$(echo -e "\033[32m\033[1m 【1】更新\033[0m")

$(echo -e "\033[31m\033[1m 【2】卸载\033[0m")

$(echo -e "\033[32m\033[1m 【3】安装FastRabbit（未实装）\033[0m")

$(echo -e "\033[32m\033[1m 【4】安装MadRabbit（临时）\033[0m")

$(echo -e "\033[31m 【5】退出\033[0m")

eof

    read -p "请输入对应选项的数字：" num23

    case $num23 in

    1)
        update_rabbit
        ;;

    2)
        uninstall_cl_rabbit
        ;;
    3)
        RabbitImageName=fastrabbit
        Cloud_install_menu_fr
        ;;

    4)
        RabbitImageName=madrabbit
        Cloud_install_menu_mr
        ;;

    5)
        exit 0
        ;;

    esac

}

function Cloud_install_main_menu() {
    cat <<eof

$(echo -e "\033[36m-----------------------------------------\033[0m")
$(echo -e "\033[36m|    User:$uUser        Date:$dDate   |\033[0m")
$(echo -e "\033[36m|     \033[1m欢迎使用【Rabbit一键安装脚本】\033[0m    \033[36m|\033[0m")
$(echo -e "\033[36m|    v$vVersion                by AyeSt0    |\033[0m")
$(echo -e "\033[36m-----------------------------------------\033[0m")
$(echo -e "\033[33m\033[1m 请选择您要安装的Rabbit版本\033[0m")

$(echo -e "\033[32m\033[1m 【1】FastRabbit（新版）\033[0m")

$(echo -e "\033[32m\033[1m 【2】MadRabbit（新版）\033[0m")

$(echo -e "\033[32m\033[1m 【3】Rabbit（旧版）\033[0m")

$(echo -e "\033[31m 【4】退出\033[0m")

eof

    read -p "请输入对应选项的数字：" num1

    case $num1 in

    1)
        RabbitImageName=fastrabbit
        Cloud_install_menu_fr

        ;;

    2)
        RabbitImageName=madrabbit
        Cloud_install_menu_mr

        ;;

    3)
        RabbitImageName=rabbit
        Cloud_install_menu_r

        ;;

    4)

        exit 0
        ;;

    esac

}

function Cloud_install_menu_fr() {
    cat <<eof

$(echo -e "\033[36m-----------------------------------------\033[0m")
$(echo -e "\033[36m|    User:$uUser        Date:$dDate   |\033[0m")
$(echo -e "\033[36m|   \033[1m欢迎使用【FastRabbit一键安装脚本】\033[0m  \033[36m|\033[0m")
$(echo -e "\033[36m|    v$vVersion                by AyeSt0    |\033[0m")
$(echo -e "\033[36m-----------------------------------------\033[0m")
$(echo -e "\033[33m\033[1m 请选择您的Rabbit运行环境\033[0m")

$(echo -e "\033[32m\033[1m 【1】国内鸡\033[0m")

$(echo -e "\033[32m\033[1m 【2】国外鸡\033[0m")

$(echo -e "\033[31m 【3】退出\033[0m")

eof

    read -p "请输入对应选项的数字：" num11

    case $num11 in

    1)
        inChina=Yes
        Cloud_install_menu_gn_ql

        ;;

    2)
        inChina=No
        Cloud_install_menu_gw_ql

        ;;

    3)

        exit 0
        ;;

    esac

}

function Cloud_install_menu_mr() {
    cat <<eof

$(echo -e "\033[36m-----------------------------------------\033[0m")
$(echo -e "\033[36m|    User:$uUser        Date:$dDate   |\033[0m")
$(echo -e "\033[36m|   \033[1m欢迎使用【MadRabbit一键安装脚本】\033[0m   \033[36m|\033[0m")
$(echo -e "\033[36m|    v$vVersion                by AyeSt0    |\033[0m")
$(echo -e "\033[36m-----------------------------------------\033[0m")
$(echo -e "\033[33m\033[1m 请选择您的Rabbit运行环境\033[0m")

$(echo -e "\033[32m\033[1m 【1】国内鸡\033[0m")

$(echo -e "\033[32m\033[1m 【2】国外鸡\033[0m")

$(echo -e "\033[31m 【3】退出\033[0m")

eof

    read -p "请输入对应选项的数字：" num11

    case $num11 in

    1)
        inChina=Yes
        Cloud_install_menu_gn_ql

        ;;

    2)
        inChina=No
        Cloud_install_menu_gw_ql

        ;;

    3)

        exit 0
        ;;

    esac

}

function Cloud_install_menu_r() {
    cat <<eof

$(echo -e "\033[36m-----------------------------------------\033[0m")
$(echo -e "\033[36m|    User:$uUser        Date:$dDate   |\033[0m")
$(echo -e "\033[36m|     \033[1m欢迎使用【Rabbit一键安装脚本】\033[0m    \033[36m|\033[0m")
$(echo -e "\033[36m|    v$vVersion                by AyeSt0    |\033[0m")
$(echo -e "\033[36m-----------------------------------------\033[0m")
$(echo -e "\033[33m\033[1m 请选择您的Rabbit运行环境\033[0m")

$(echo -e "\033[32m\033[1m 【1】国内鸡\033[0m")

$(echo -e "\033[32m\033[1m 【2】国外鸡\033[0m")

$(echo -e "\033[31m 【3】退出\033[0m")

eof

    read -p "请输入对应选项的数字：" num11

    case $num11 in

    1)
        inChina=Yes
        Cloud_install_menu_gn_ql

        ;;

    2)
        inChina=No
        Cloud_install_menu_gw_ql

        ;;

    3)

        exit 0
        ;;

    esac

}

function Cloud_install_menu_gn_ql() {

    cat <<eof

$(echo -e "\033[33m\033[1m 请选择您的青龙配置\033[0m")

$(echo -e "\033[32m\033[1m 【1】单青龙\033[0m")

$(echo -e "\033[32m\033[1m 【2】多青龙\033[0m")

$(echo -e "\033[32m\033[1m 【3】不配置青龙\033[0m")

eof

    read -p "请输入对应选项的数字：" num111

    case $num111 in

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

$(echo -e "\033[33m\033[1m 请选择您的青龙配置\033[0m")

$(echo -e "\033[32m\033[1m 【1】单青龙\033[0m")

$(echo -e "\033[32m\033[1m 【2】多青龙\033[0m")

$(echo -e "\033[32m\033[1m 【3】不配置青龙\033[0m")

eof

    read -p "请输入对应选项的数字：" num112

    case $num112 in

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

function Synology_manage_main_menu() {
    cat <<eof

$(echo -e "\033[36m-----------------------------------------\033[0m")
$(echo -e "\033[36m|    User:$uUser        Date:$dDate   |\033[0m")
$(echo -e "\033[36m|     \033[1m欢迎使用【Rabbit一键管理脚本】\033[0m    \033[36m|\033[0m")
$(echo -e "\033[36m|    v$vVersion                by AyeSt0    |\033[0m")
$(echo -e "\033[36m-----------------------------------------\033[0m")
$(echo -e "\033[33m 请选择管理版本\033[0m")

$(echo -e "\033[32m\033[1m 【1】FastRabbit\033[0m")

$(echo -e "\033[31m\033[1m 【2】MadRabbit\033[0m")

$(echo -e "\033[31m\033[1m 【3】Rabbit\033[0m")

$(echo -e "\033[31m 【4】退出\033[0m")

eof

    read -p "请输入对应选项的数字：" enum2

    case $enum2 in

    1)
        Synology_manage_fastrabbit_menu
        ;;

    2)
        Synology_manage_madrabbit_menu
        ;;

    3)
        Synology_manage_rabbit_menu
        ;;
    4)
        exit 0
        ;;

    esac

}
function Synology_manage_main12_menu() {
    cat <<eof

$(echo -e "\033[36m-----------------------------------------\033[0m")
$(echo -e "\033[36m|    User:$uUser        Date:$dDate   |\033[0m")
$(echo -e "\033[36m|     \033[1m欢迎使用【Rabbit一键管理脚本】\033[0m    \033[36m|\033[0m")
$(echo -e "\033[36m|    v$vVersion                by AyeSt0    |\033[0m")
$(echo -e "\033[36m-----------------------------------------\033[0m")
$(echo -e "\033[33m 请选择管理版本\033[0m")

$(echo -e "\033[32m\033[1m 【1】FastRabbit\033[0m")

$(echo -e "\033[31m\033[1m 【2】MadRabbit\033[0m")

$(echo -e "\033[31m\033[1m 【3】安装Rabbit\033[0m")

$(echo -e "\033[31m 【4】退出\033[0m")

eof

    read -p "请输入对应选项的数字：" num241

    case $num241 in

    1)
        Synology_manage_fastrabbit_menu
        ;;

    2)
        Synology_manage_madrabbit_menu
        ;;

    3)
        RabbitImageName=rabbit
        Synology_install_menu
        ;;
    4)
        exit 0
        ;;

    esac

}
function Synology_manage_main13_menu() {
    cat <<eof

$(echo -e "\033[36m-----------------------------------------\033[0m")
$(echo -e "\033[36m|    User:$uUser        Date:$dDate   |\033[0m")
$(echo -e "\033[36m|     \033[1m欢迎使用【Rabbit一键管理脚本】\033[0m    \033[36m|\033[0m")
$(echo -e "\033[36m|    v$vVersion                by AyeSt0    |\033[0m")
$(echo -e "\033[36m-----------------------------------------\033[0m")
$(echo -e "\033[33m 请选择管理版本\033[0m")

$(echo -e "\033[32m\033[1m 【1】FastRabbit\033[0m")

$(echo -e "\033[31m\033[1m 【2】安装MadRabbit（临时）\033[0m")

$(echo -e "\033[31m\033[1m 【3】Rabbit\033[0m")

$(echo -e "\033[31m 【4】退出\033[0m")

eof

    read -p "请输入对应选项的数字：" num2

    case $num2 in

    1)
        Synology_manage_fastrabbit_menu
        ;;

    2)
        RabbitImageName=madrabbit
        Synology_install_menu
        ;;

    3)
        Synology_manage_rabbit_menu
        ;;
    4)
        exit 0
        ;;

    esac

}
function Synology_manage_main23_menu() {
    cat <<eof

$(echo -e "\033[36m-----------------------------------------\033[0m")
$(echo -e "\033[36m|    User:$uUser        Date:$dDate   |\033[0m")
$(echo -e "\033[36m|     \033[1m欢迎使用【Rabbit一键管理脚本】\033[0m    \033[36m|\033[0m")
$(echo -e "\033[36m|    v$vVersion                by AyeSt0    |\033[0m")
$(echo -e "\033[36m-----------------------------------------\033[0m")
$(echo -e "\033[33m 请选择管理版本\033[0m")

$(echo -e "\033[32m\033[1m 【1】安装FastRabbit（未实装）\033[0m")

$(echo -e "\033[31m\033[1m 【2】MadRabbit\033[0m")

$(echo -e "\033[31m\033[1m 【3】Rabbit\033[0m")

$(echo -e "\033[31m 【4】退出\033[0m")

eof

    read -p "请输入对应选项的数字：" num2

    case $num2 in

    1)
        RabbitImageName=fastrabbit
        Synology_install_menu
        ;;

    2)
        Synology_manage_madrabbit_menu
        ;;

    3)
        Synology_manage_rabbit_menu
        ;;
    4)
        exit 0
        ;;

    esac

}

function Synology_manage_fastrabbit_menu() {

    cat <<eof

$(echo -e "\033[36m-----------------------------------------\033[0m")
$(echo -e "\033[36m|    User:$uUser        Date:$dDate   |\033[0m")
$(echo -e "\033[36m|   \033[1m欢迎使用【FastRabbit一键管理脚本】\033[0m  \033[36m|\033[0m")
$(echo -e "\033[36m|    v$vVersion                by AyeSt0    |\033[0m")
$(echo -e "\033[36m|        \033[1m\033[32m当前FastRabbit版本 $fastRabbitLocalversion\033[0m\033[0m       \033[36m|\033[0m")
$(echo -e "\033[36m|     容器刚启动可能不会显示版本号      |\033[0m")
$(echo -e "\033[36m|         可以重新运行脚本重试          |\033[0m")
$(echo -e "\033[36m-----------------------------------------\033[0m")
$(echo -e "\033[33m\033[1m 请选择合适的选项\033[0m")

$(echo -e "\033[32m\033[1m 【1】更新\033[0m")

$(echo -e "\033[31m\033[1m 【2】卸载\033[0m")

$(echo -e "\033[32m\033[1m 【3】安装MadRabbit（临时）\033[0m")

$(echo -e "\033[32m\033[1m 【4】安装Rabbit\033[0m")

$(echo -e "\033[31m 【5】退出\033[0m")

eof

    read -p "请输入对应选项的数字：" enum21

    case $enum21 in

    1)
        update_fastRabbit
        ;;

    2)
        uninstall_sy_fastRabbit
        ;;

    3)
        RabbitImageName=madrabbit
        Synology_install_menu
        ;;

    4)
        RabbitImageName=rabbit
        Synology_install_menu
        ;;

    5)
        exit 0
        ;;

    esac

}

function Synology_manage_madrabbit_menu() {

    cat <<eof

$(echo -e "\033[36m-----------------------------------------\033[0m")
$(echo -e "\033[36m|    User:$uUser        Date:$dDate   |\033[0m")
$(echo -e "\033[36m|    \033[1m欢迎使用【MadRabbit一键管理脚本】\033[0m  \033[36m|\033[0m")
$(echo -e "\033[36m|    v$vVersion                by AyeSt0    |\033[0m")
$(echo -e "\033[36m|         \033[1m\033[32m当前MadRabbit版本 $madRabbitLocalversion\033[0m\033[0m       \033[36m|\033[0m")
$(echo -e "\033[36m|     容器刚启动可能不会显示版本号      |\033[0m")
$(echo -e "\033[36m|         可以重新运行脚本重试          |\033[0m")
$(echo -e "\033[36m-----------------------------------------\033[0m")
$(echo -e "\033[33m\033[1m 请选择合适的选项\033[0m")

$(echo -e "\033[32m\033[1m 【1】更新\033[0m")

$(echo -e "\033[31m\033[1m 【2】卸载\033[0m")

$(echo -e "\033[32m\033[1m 【3】安装FastRabbit（未实装）\033[0m")

$(echo -e "\033[32m\033[1m 【4】安装Rabbit\033[0m")

$(echo -e "\033[31m 【5】退出\033[0m")

eof

    read -p "请输入对应选项的数字：" enum22

    case $enum22 in

    1)
        update_madRabbit
        ;;

    2)
        uninstall_sy_madRabbit
        ;;
    3)
        RabbitImageName=fastrabbit
        Synology_install_menu
        ;;

    4)
        RabbitImageName=rabbit
        Synology_install_menu
        ;;

    5)
        exit 0
        ;;

    esac

}

function Synology_manage_rabbit_menu() {

    cat <<eof

$(echo -e "\033[36m-----------------------------------------\033[0m")
$(echo -e "\033[36m|    User:$uUser        Date:$dDate   |\033[0m")
$(echo -e "\033[36m|     \033[1m欢迎使用【Rabbit一键管理脚本】\033[0m    \033[36m|\033[0m")
$(echo -e "\033[36m|    v$vVersion                by AyeSt0    |\033[0m")
$(echo -e "\033[36m|          \033[1m\033[32m当前Rabbit版本 $rabbitLocalversion\033[0m\033[0m         \033[36m|\033[0m")
$(echo -e "\033[36m|     容器刚启动可能不会显示版本号      |\033[0m")
$(echo -e "\033[36m|         可以重新运行脚本重试          |\033[0m")
$(echo -e "\033[36m-----------------------------------------\033[0m")
$(echo -e "\033[33m\033[1m 请选择合适的选项\033[0m")

$(echo -e "\033[32m\033[1m 【1】更新\033[0m")

$(echo -e "\033[31m\033[1m 【2】卸载\033[0m")

$(echo -e "\033[32m\033[1m 【3】安装FastRabbit（未实装）\033[0m")

$(echo -e "\033[32m\033[1m 【4】安装MadRabbit（临时）\033[0m")

$(echo -e "\033[31m 【5】退出\033[0m")

eof

    read -p "请输入对应选项的数字：" enum23

    case $enum23 in

    1)
        update_rabbit
        ;;

    2)
        uninstall_sy_rabbit
        ;;
    3)
        RabbitImageName=fastrabbit
        Synology_install_menu
        ;;

    4)
        RabbitImageName=madrabbit
        Synology_install_menu
        ;;

    5)
        exit 0
        ;;

    esac

}

function Synology_install_main_menu() {
    cat <<eof

$(echo -e "\033[36m-----------------------------------------\033[0m")
$(echo -e "\033[36m|    User:$uUser        Date:$dDate   |\033[0m")
$(echo -e "\033[36m|     \033[1m欢迎使用【Rabbit一键安装脚本】\033[0m    \033[36m|\033[0m")
$(echo -e "\033[36m|    v$vVersion                by AyeSt0    |\033[0m")
$(echo -e "\033[36m-----------------------------------------\033[0m")
$(echo -e "\033[33m\033[1m 请选择您要安装的Rabbit版本\033[0m")

$(echo -e "\033[32m\033[1m 【1】FastRabbit（新版,暂未实装）\033[0m")

$(echo -e "\033[32m\033[1m 【2】MadRabbit（新版）\033[0m")

$(echo -e "\033[32m\033[1m 【3】Rabbit（旧版）\033[0m")

$(echo -e "\033[31m 【4】退出\033[0m")

eof

    read -p "请输入对应选项的数字：" enum1

    case $enum1 in

    1)
        RabbitImageName=fastrabbit
        Synology_install_menu

        ;;

    2)
        RabbitImageName=madrabbit
        Synology_install_menu

        ;;

    3)
        RabbitImageName=rabbit
        Synology_install_menu

        ;;

    4)

        exit 0
        ;;

    esac

}
function Synology_install_menu() {

    cat <<eof

$(echo -e "\033[36m-----------------------------------------\033[0m")
$(echo -e "\033[36m|    User:$uUser        Date:$dDate   |\033[0m")
$(echo -e "\033[36m|     \033[1m欢迎使用【Rabbit一键安装脚本】\033[0m    \033[36m|\033[0m")
$(echo -e "\033[36m|    v$vVersion                by AyeSt0    |\033[0m")
$(echo -e "\033[36m-----------------------------------------\033[0m")
$(echo -e "\033[33m 请选择合适的选项\033[0m")

$(echo -e "\033[32m\033[1m 【1】安装\033[0m")

$(echo -e "\033[31m 【2】退出\033[0m")

eof

    read -p "请输入对应选项的数字：" enum11

    case $enum11 in

    1)
        inChina=Yes
        Synology_install_menu_ql

        ;;

    2)

        exit 0
        ;;

    esac

}
function Synology_install_menu_ql() {

    cat <<eof

$(echo -e "\033[33m\033[1m 请选择您的青龙配置\033[0m")

$(echo -e "\033[32m\033[1m 【1】单青龙\033[0m")

$(echo -e "\033[32m\033[1m 【2】多青龙\033[0m")

$(echo -e "\033[32m\033[1m 【3】不配置青龙\033[0m")

eof

    read -p "请输入对应选项的数字：" enum111

    case $enum111 in

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
        sed -i "/MaxTab/s/4/$rabbitMaxtab/g" "$rabbitAbsolutepath"/Rabbit/Config/Config.json
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
        sed -i "/\"Title\": \"Rabbit\",/s/Rabbit/$rabbitTittle/g" "$rabbitAbsolutepath"/Rabbit/Config/Config.json
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
        sed -i "/Closetime/s/5/$rabbitClosetime/g" "$rabbitAbsolutepath"/Rabbit/Config/Config.json
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
        sed -i "/AutoCaptchaCount/s/5/$rabbitClosetime/g" "$rabbitAbsolutepath"/Rabbit/Config/Config.json
        if test $? -ne 0; then
            echo -e "\033[41;37m 修改失败...请安装后自行检查配置文件\033[0m"
        else
            echo -e "\033[42;37m 设置成功 \033[0m"
        fi

        #修改配置文件强制使用特殊验证码

        echo -e "\033[33m 如使用打码平台，请改成false \033[0m"
        echo -e "\033[33m rabbit4.2.0版本已恢复快捷登录 \033[0m"

        echo -e "\033[33m 是否强制使用特殊验证码(true/false)【默认false】 \033[0m" && read rabbitForcecaptcha
        if test -z "$rabbitForcecaptcha"; then
            rabbitForcecaptcha='false'
        fi
        sed -i "/FORCE_CAPTCHA/s/true/$rabbitForcecaptcha/g" "$rabbitAbsolutepath"/Rabbit/Config/Config.json
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
        sed -i "/REAL_CK/s/false/$rabbitRealck/g" "$rabbitAbsolutepath"/Rabbit/Config/Config.json
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
        sed -i "/INTERVAL_TIME/s/0/$rabbitInterrvaltime/g" "$rabbitAbsolutepath"/Rabbit/Config/Config.json
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
            sed -i "/ExpirationCron/s/30 17 \* \* \*//g" "$rabbitAbsolutepath"/Rabbit/Config/Config.json
            if test $? -ne 0; then
                echo -e "\033[41;37m 修改失败...请安装后自行检查配置文件\033[0m"
            else
                echo -e "\033[42;37m 设置成功 \033[0m"
            fi
            ;;
        *)
            sed -i "/ExpirationCron/s/30 17 \* \* \*/$rabbitExpirationcron/g" "$rabbitAbsolutepath"/Rabbit/Config/Config.json
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
            sed -i "/BeanCron/s/0 20 \* \* \*//g" "$rabbitAbsolutepath"/Rabbit/Config/Config.json
            if test $? -ne 0; then
                echo -e "\033[41;37m 修改失败...请安装后自行检查配置文件\033[0m"
            else
                echo -e "\033[42;37m 设置成功 \033[0m"
            fi
            ;;
        *)
            sed -i "/BeanCron/s/0 20 \* \* \*/$rabbitBeancron/g" "$rabbitAbsolutepath"/Rabbit/Config/Config.json
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
            sed -i "/APP_TOKEN/s/\"\",/\"$rabbitWxapptoken\",/g" "$rabbitAbsolutepath"/Rabbit/Config/Config.json
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
            sed -i "/MY_WP_UID/s/\"\",/\"$rabbitMywpuid\",/g" "$rabbitAbsolutepath"/Rabbit/Config/Config.json
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
            sed -i "/XDD_URL/s/\"\",/\"$rabbitXddurl\",/g" "$rabbitAbsolutepath"/Rabbit/Config/Config.json
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
            sed -i "/XDD_TOKEN/s/\"\",/\"$rabbitXddtoken\",/g" "$rabbitAbsolutepath"/Rabbit/Config/Config.json
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
            sed -i "/SILLY_TOKEN/s/\"\",/\"$rabbitSillytoken\",/g" "$rabbitAbsolutepath"/Rabbit/Config/Config.json
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
            sed -i "/TJ_USER/s/\"\",/\"$rabbitTjuser\",/g" "$rabbitAbsolutepath"/Rabbit/Config/Config.json
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
            sed -i "/TJ_PWD/s/\"\",/\"$rabbitTjpwd\",/g" "$rabbitAbsolutepath"/Rabbit/Config/Config.json
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
                sed -i "/QLName/s/腾讯云,/$rabbitQlname,/g" "$rabbitAbsolutepath"/Rabbit/Config/Config.json
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
            sed -i "/QLurl/s/\"\",/\"$rabbitQlurl\",/g" "$rabbitAbsolutepath"/Rabbit/Config/Config.json
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
            sed -i "/QL_CLIENTID/s/\"\",/\"$rabbitQlclientid\",/g" "$rabbitAbsolutepath"/Rabbit/Config/Config.json
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
            sed -i "/QL_SECRET/s/\"\",/\"$rabbitQlsecret\",/g" "$rabbitAbsolutepath"/Rabbit/Config/Config.json
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
                sed -i "/QL_CAPACITY/s/50,/$rabbitQlcapacity,/g" "$rabbitAbsolutepath"/Rabbit/Config/Config.json
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
                sed -i "/QL_WSCK/s/50,/$rabbitQlwsck,/g" "$rabbitAbsolutepath"/Rabbit/Config/Config.json
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
            sed -i "/proxy/s/\"\",/\"$rabbitProxy\",/g" "$rabbitAbsolutepath"/Rabbit/Config/Config.json
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

function fastRabbitLocalversion() {
    #Management_Countdown10
    checkRabbitport=$(docker port fastrabbit)
    rRabbitPort=${checkRabbitport##*:}
    checkVersion=$(curl -s http://127.0.0.1:"$rRabbitPort"/api/version)
    #echo "$checkVersion"
    fastRabbitLocalversion=${checkVersion:0-7:5}
}
function madRabbitLocalversion() {
    #Management_Countdown10
    checkRabbitport=$(docker port madrabbit)
    rRabbitPort=${checkRabbitport##*:}
    checkVersion=$(curl -s http://127.0.0.1:"$rRabbitPort"/api/version)
    #echo "$checkVersion"
    madRabbitLocalversion=${checkVersion:0-7:5}
}
function rabbitLocalversion() {
    #Management_Countdown10
    checkRabbitport=$(docker port rabbit)
    rRabbitPort=${checkRabbitport##*:}
    checkVersion=$(curl -s http://127.0.0.1:"$rRabbitPort"/api/version)
    #echo "$checkVersion"
    rabbitLocalversion=${checkVersion:0-7:5}
}

function update_fastRabbit() {
    fastRabbitLocalversion
    echo -e "\033[1m 检查更新...\033[0m"
    #判断服务器所在地
    ipChina
    inChinaNo='No'
    if [ "$inChina_judge" = $inChinaNo ]; then
        latestVersion=$(curl -s -d fastrabbit http://api.madrabbit.cf/api/version)
        if [ $? -ne 0 ]; then
            latestVersion='未获取到最新版本版本号'
        fi
        echo -e "\033[1m 最新版本 $latestVersion \033[0m"
        if [[ $latestVersion =~ $fastRabbitLocalversion ]]; then
            echo -e "\033[1m 当前已为最新版本 \033[0m"
        else
            echo -e "\033[42;37m 开始更新 \033[0m"
            docker exec -it fastrabbit git pull
            docker restart fastrabbit
            echo -e "\033[42;37m 更新成功，自动重启容器fastrabbit \033[0m可稍后重新运行脚本察看版本号"

            #curl -s http://127.0.0.1:$rRabbitPort/api/update
        fi
    else
        latestVersion=$(curl -s "$inChina_proxy"/https://raw.githubusercontent.com/HT944/MadRabbit/main/version)
        if [ $? -ne 0 ]; then
            latestVersion='未获取到最新版本版本号'
        fi
        echo -e "最新版本 $latestVersion"
        if [[ $latestVersion =~ $fastRabbitLocalversion ]]; then
            echo -e "当前已为最新版本"
        else
            echo -e "\033[42;37m 开始更新 \033[0m"
            docker exec -it fastrabbit git pull
            docker restart fastrabbit
            echo -e "\033[42;37m 更新成功，自动重启容器rabbit \033[0m可稍后重新运行脚本察看版本号"
        fi
    fi

}
function update_madRabbit() {
    madRabbitLocalversion
    echo -e "\033[1m 检查更新...\033[0m"
    #判断服务器所在地
    ipChina
    inChinaNo='No'
    if [ "$inChina_judge" = $inChinaNo ]; then
        latestVersion=$(curl -s -d madrabbit http://api.madrabbit.cf/api/version)
        if [ $? -ne 0 ]; then
            latestVersion='未获取到最新版本版本号'
        fi
        echo -e "\033[1m 最新版本 $latestVersion \033[0m"
        if [[ $latestVersion =~ $madRabbitLocalversion ]]; then
            echo -e "\033[1m 当前已为最新版本 \033[0m"
        else
            echo -e "\033[42;37m 开始更新 \033[0m"
            docker exec -it madrabbit git pull
            docker restart madrabbit
            echo -e "\033[42;37m 更新成功，自动重启容器madrabbit \033[0m可稍后重新运行脚本察看版本号"

            #curl -s http://127.0.0.1:$rRabbitPort/api/update
        fi
    else
        latestVersion=$(curl -s "$inChina_proxy"/https://raw.githubusercontent.com/HT944/MadRabbit/main/version)
        if [ $? -ne 0 ]; then
            latestVersion='未获取到最新版本版本号'
        fi
        echo -e "最新版本 $latestVersion"
        if [[ $latestVersion =~ $madRabbitLocalversion ]]; then
            echo -e "当前已为最新版本"
        else
            echo -e "\033[42;37m 开始更新 \033[0m"
            docker exec -it rabbit git pull
            docker restart rabbit
            echo -e "\033[42;37m 更新成功，自动重启容器rabbit \033[0m可稍后重新运行脚本察看版本号"
        fi
    fi

}

function update_rabbit() {
    rabbitLocalversion
    echo -e "\033[1m 检查更新...\033[0m"
    #判断服务器所在地
    ipChina
    inChinaNo='No'
    if [ "$inChina_judge" = $inChinaNo ]; then
        latestVersion=$(curl -s -d rabbit http://api.madrabbit.cf/api/version)
        if [ $? -ne 0 ]; then
            latestVersion='未获取到最新版本版本号'
        fi
        echo -e "\033[1m 最新版本 $latestVersion \033[0m"
        if [[ $latestVersion =~ $rabbitLocalversion ]]; then
            echo -e "\033[1m 当前已为最新版本 \033[0m"
        else
            echo -e "\033[42;37m 开始更新 \033[0m"
            docker exec -it rabbit git pull
            docker restart rabbit
            echo -e "\033[42;37m 更新成功，自动重启容器rabbit \033[0m可稍后重新运行脚本察看版本号"

            #curl -s http://127.0.0.1:$rRabbitPort/api/update
        fi
    else
        latestVersion=$(curl -s "$inChina_proxy"/https://raw.githubusercontent.com/HT944/MadRabbit/main/version)
        if [ $? -ne 0 ]; then
            latestVersion='未获取到最新版本版本号'
        fi
        echo -e "最新版本 $latestVersion"
        if [[ $latestVersion =~ $rabbitLocalversion ]]; then
            echo -e "当前已为最新版本"
        else
            echo -e "\033[42;37m 开始更新 \033[0m"
            docker exec -it rabbit git pull
            docker restart rabbit
            echo -e "\033[42;37m 更新成功，自动重启容器rabbit \033[0m可稍后重新运行脚本察看版本号"
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

        echo -n 等待rabbit启动..."$i" 秒后检测更新!!
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
    echo -e "\033[33m 请选择Rabbit配置文件安装路径【默认/root】\033[0m" && read rabbitAbsolutepath
    if [ -z "${rabbitAbsolutepath}" ]; then
        rabbitAbsolutepath='/root'
    fi
    if [ ! -d "$rabbitAbsolutepath" ]; then
        echo -e "\033[43;37m 该目录不存在，创建目录中... \033[0m"
        mkdir -p $rabbitAbsolutepath
    fi
    cd $rabbitAbsolutepath || exit
    mkdir -p Rabbit
    cd Rabbit || exit
    cd $rabbitAbsolutepath/Rabbit && mkdir -p Config
    #是否国内判断
    ipChina_touch
}
#群晖安装路径
function sypath_choise() {
    echo -e "\033[33m 请选择Rabbit配置文件安装路径【默认/volume1/docker】\033[0m" && read rabbitAbsolutepath
    if [ -z "${rabbitAbsolutepath}" ]; then
        rabbitAbsolutepath='/volume1/docker'
    fi
    if [ ! -d "$rabbitAbsolutepath" ]; then
        echo -e "\033[43;37m 该目录不存在，创建目录中... \033[0m"
        mkdir -p $rabbitAbsolutepath
    fi
    cd $rabbitAbsolutepath || exit
    mkdir -p Rabbit
    cd Rabbit || exit
    cd $rabbitAbsolutepath/Rabbit && mkdir -p Config
    #是否国内判断
    ipChina_touch
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
#容器端口设置
function container_port_settings_fastrabbit() {
    echo -e "\033[33m FastRabbit容器端口【默认5703】\033[0m" && read fastRabbitPort
    if [ -z "${fastRabbitPort}" ]; then
        fastRabbitPort='5703'
    fi
    echo -e "\033[31m 确认FastRabbit端口设为$fastRabbitPort?(y/n)【默认n】\033[0m" && read rabbitPortjudge
    if [ -z "${rabbitPortjudge}" ]; then
        rabbitPortjudge='n'
    fi
    case $rabbitPortjudge in
    [yY])
        echo -e "\033[42;37m 端口已设为$fastRabbitPort\033[0m"
        ;;
    *)
        echo -e "\033[41;37m 返回重设端口 \033[0m"
        container_port_settings_fastrabbit
        ;;
    esac
}
function container_port_settings_madrabbit() {
    echo -e "\033[33m MadRabbit容器端口【默认5702】\033[0m" && read madRabbitPort
    if [ -z "${madRabbitPort}" ]; then
        madRabbitPort='5702'
    fi
    echo -e "\033[31m 确认MadRabbit端口设为$madRabbitPort?(y/n)【默认n】\033[0m" && read rabbitPortjudge
    if [ -z "${rabbitPortjudge}" ]; then
        rabbitPortjudge='n'
    fi
    case $rabbitPortjudge in
    [yY])
        echo -e "\033[42;37m 端口已设为$madRabbitPort\033[0m"
        ;;
    *)
        echo -e "\033[41;37m 返回重设端口 \033[0m"
        container_port_settings_madrabbit
        ;;
    esac
}
function container_port_settings_rabbit() {
    echo -e "\033[33m Rabbit容器端口【默认5701】\033[0m" && read rabbitPort
    if [ -z "${rabbitPort}" ]; then
        rabbitPort='5701'
    fi
    echo -e "\033[31m 确认Rabbit端口设为$rabbitPort?(y/n)【默认n】\033[0m" && read rabbitPortjudge
    if [ -z "${rabbitPortjudge}" ]; then
        rabbitPortjudge='n'
    fi
    case $rabbitPortjudge in
    [yY])
        echo -e "\033[42;37m 端口已设为$rabbitPort\033[0m"
        ;;
    *)
        echo -e "\033[41;37m 返回重设端口 \033[0m"
        container_port_settings_rabbit
        ;;
    esac
}
function container_install_gn() {

    #容器端口设置
    container_port_settings_$RabbitImageName

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
    sudo docker run --name $RabbitImageName -p $rabbitPort:1234 -d -v $rabbitAbsolutepath/Rabbit/Config:/$osCoreurl/Config -it --privileged=true --restart=always ht944/$RabbitImageName:$rabbitVersion
    if [ $? -ne 0 ]; then
        echo -e "\033[41;37m 安装失败...退出脚本 \033[0m"
    else
        echo -e "\033[42;37m 恭喜你安装成功！！！！！！\033[0m"
        echo -e "\033[33m 请到$rabbitAbsolutepath/Rabbit/Config目录下修改配置文件 \033[0m"
        echo -e "\033[33m 然后使用命令\033[0m \033[32m docker restart rabbit\033[0m \033[33m重启更新配置\033[0m"
        echo -e "\033[43;37m 开始检测更新... \033[0m"
        echo -e "\033[43;31m 注意！如无法进行更新，请自行访问\033[0m\033[43;32m https://你的rabbit地址/api/update\033[0m\033[43;31m检查更新！ \033[0m"
        echo -e "\033[33m rabbit4.2.0版本已恢复快捷登录，如需使用快捷登录，请在原对接地址后加/rabbit \033[0m"
        #检测更新倒计时
        Upgrade_Countdown
        #更新检测
        update
    fi
}

function container_install_gw() {
    #容器端口设置
    container_port_settings_$RabbitImageName

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
    if [ RabbitImageName = "madrabbit"]; then
        sudo docker run --name $RabbitImageName -p $rabbitPort:1234 -d -v $rabbitAbsolutepath/Rabbit/Config:/FastRabbit/Config -it --privileged=true --restart=always ht944/$RabbitImageName:$rabbitVersion
    else
        sudo docker run --name $RabbitImageName -p $rabbitPort:1234 -d -v $rabbitAbsolutepath/Rabbit/Config:/$osCoreurl/Config -it --privileged=true --restart=always ht944/$RabbitImageName:$rabbitVersion
    fi
    if [ $? -ne 0 ]; then
        echo -e "\033[41;37m 安装失败...退出脚本 \033[0m"
    else
        echo -e "\033[42;37m 恭喜你安装成功！！！！！！\033[0m"
        echo -e "\033[33m 请到$rabbitAbsolutepath/Rabbit/Config目录下修改配置文件 \033[0m"
        echo -e "\033[33m 然后使用命令\033[0m \033[32m docker restart rabbit\033[0m \033[33m重启更新配置\033[0m"
        echo -e "\033[43;37m 开始检测更新... \033[0m"
        echo -e "\033[43;31m 注意！如无法进行更新，请自行访问\033[0m\033[43;32m https://你的rabbit地址/api/update\033[0m\033[43;31m检查更新！ \033[0m"
        #检测更新倒计时
        Upgrade_Countdown
        #更新检测
        update_$RabbitImageName
    fi
}
function container_install_sy() {
    #容器端口设置
    container_port_settings_$RabbitImageName

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
    sudo docker run --name $RabbitImageName -p $rabbitPort:1234 -d -v $rabbitAbsolutepath/Rabbit/Config:/$osCoreurl/Config -it --privileged=true --restart=always ht944/$RabbitImageName:$rabbitVersion
    if [ $? -ne 0 ]; then
        echo -e "\033[41;37m 安装失败...退出脚本 \033[0m"
    else
        echo -e "\033[42;37m 恭喜你安装成功！！！！！！\033[0m"
        echo -e "\033[33m 请到$rabbitAbsolutepath/Rabbit/Config目录下修改配置文件 \033[0m"
        echo -e "\033[33m 然后使用命令\033[0m \033[32m docker restart rabbit\033[0m \033[33m重启更新配置\033[0m"
        echo -e "\033[43;37m 开始检测更新... \033[0m"
        echo -e "\033[43;31m 注意！如无法进行更新，请自行访问\033[0m\033[43;32m https://你的rabbit地址/api/update\033[0m\033[43;31m检查更新！ \033[0m"
        echo -e "\033[33m rabbit4.2.0版本已恢复快捷登录，如需使用快捷登录，请在原对接地址后加/rabbit \033[0m"
        #检测更新倒计时
        Upgrade_Countdown
        #更新检测
        update
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
    container_info=$(docker inspect rabbit | grep Mounts -A 20)
    container_info_cut=${container_info#*\"Source\": \"}
    container_path=${container_info_cut%%\"*}
    if [ -f "$container_path"/ipChina.conf ]; then
        inChina_path="$container_path/ipChina.conf"
        inChina_judge=$(sed -n '2p' /root/Rabbit/Config/ipChina.conf)
        inChina_proxy=$(sed -n '4p' /root/Rabbit/Config/ipChina.conf)
        if [ -z "$inChina_proxy" ]; then
            inChina_proxy=''
        fi

    else
        whereAreyou
    fi
}
function ipChina_touch() {
    touch $rabbitAbsolutepath/Rabbit/Config/ipChina.conf
    chmod 777 "$container_path"/ipChina.conf
    echo "#是否国内鸡（Yes/No）" >>"$container_path/ipChina.conf"
    echo "$inChina" >>"$rabbitAbsolutepath/Rabbit/Config/ipChina.conf"
    if [ -z "$rabbitProxyurl" ]; then
        rabbitProxyurl='不配置'
        echo "#GitHub加速地址" >>"$container_path/ipChina.conf"
        echo "$rabbitProxyurl" >>"$rabbitAbsolutepath/Rabbit/Config/ipChina.conf"
    else
        echo "#GitHub加速地址" >>"$container_path/ipChina.conf"
        echo "$rabbitProxyurl" >>"$rabbitAbsolutepath/Rabbit/Config/ipChina.conf"
    fi
}
function uninstall_cl_fastRabbit() {
    echo -e "\033[41;33m 是否确认卸载FastRabbit(y/n)【默认n】\033[0m" && read rabbitDelete
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
            echo -e "\033[41;33m 是否同时卸载FastRabbit镜像(y/n)【默认n】\033[0m" && read rabbitimageDelete
            if [ -z "${rabbitimageDelete}" ]; then
                rabbitimageDelete='n'
                echo "n"
            fi
            case $rabbitimageDelete in
            [yY])
                echo -e "\033[33m 卸载容器及镜像，清除配置路径文件\033[0m"
                container_info=$(docker inspect fastrabbit | grep Mounts -A 20)
                container_info_cut=${container_info#*\"Source\": \"}
                container_path=${container_info_cut%%\"*}
                cd $container_path || exit
                cd ..
                cd ..
                echo -e "\033[33m 停止容器\033[0m"
                docker stop fastrabbit
                echo -e "\033[33m 卸载容器\033[0m"
                docker rm -f fastrabbit
                echo -e "\033[33m 清除配置路径文件\033[0m"
                rm -rf Rabbit/
                echo -e "\033[33m 卸载镜像\033[0m"
                uninstall_imageJudge_fastRabbit
                ;;
            *)
                echo -e "\033[33m 卸载容器，清除配置路径文件，保留镜像\033[0m"
                container_info=$(docker inspect fastrabbit | grep Mounts -A 20)
                container_info_cut=${container_info#*\"Source\": \"}
                container_path=${container_info_cut%%\"*}
                cd $container_path || exit
                cd ..
                cd ..
                echo -e "\033[33m 停止容器\033[0m"
                docker stop fastrabbit
                echo -e "\033[33m 卸载容器\033[0m"
                docker rm -f fastrabbit
                echo -e "\033[33m 清除配置路径文件\033[0m"
                rm -rf Rabbit/
                ;;
            esac
            echo -e "\033[33m 卸载完成\033[0m"
            exit 0
            ;;
        *)
            echo -e "\033[41;33m 是否同时卸载rabbit镜像(y/n)【默认n】\033[0m" && read rabbitimageDelete
            if [ -z "${rabbitimageDelete}" ]; then
                rabbitimageDelete='n'
                echo "n"
            fi
            case $rabbitimageDelete in
            [yY])
                echo -e "\033[33m 卸载容器及镜像，保留配置路径文件\033[0m"

                echo -e "\033[33m 停止容器\033[0m"
                docker stop fastrabbit
                echo -e "\033[33m 卸载容器\033[0m"
                docker rm -f fastrabbit
                echo -e "\033[33m 卸载镜像\033[0m"
                uninstall_imageJudge_fastRabbit
                ;;
            *)
                echo -e "\033[33m 卸载容器，保留配置路径文件及镜像\033[0m"
                echo -e "\033[33m 停止容器\033[0m"
                docker stop fastrabbit
                echo -e "\033[33m 卸载容器\033[0m"
                docker rm -f fastrabbit
                ;;
            esac
            echo -e "\033[33m 卸载完成\033[0m"
            exit 0
            ;;
        esac
        ;;
    *)
        echo -e "\033[33m 取消卸载，返回菜单\033[0m"
        Cloud_manage_fastrabbit_menu
        ;;
    esac

}
function uninstall_sy_fastRabbit() {
    echo -e "\033[41;33m 是否确认卸载FastRabbit(y/n)【默认n】\033[0m" && read rabbitDelete
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
            echo -e "\033[41;33m 是否同时卸载FastRabbit镜像(y/n)【默认n】\033[0m" && read rabbitimageDelete
            if [ -z "${rabbitimageDelete}" ]; then
                rabbitimageDelete='n'
                echo "n"
            fi
            case $rabbitimageDelete in
            [yY])
                echo -e "\033[33m 卸载容器及镜像，清除配置路径文件\033[0m"
                container_info=$(docker inspect fastrabbit | grep Mounts -A 20)
                container_info_cut=${container_info#*\"Source\": \"}
                container_path=${container_info_cut%%\"*}
                cd $container_path || exit
                cd ..
                cd ..
                echo -e "\033[33m 停止容器\033[0m"
                docker stop fastrabbit
                echo -e "\033[33m 卸载容器\033[0m"
                docker rm -f fastrabbit
                echo -e "\033[33m 清除配置路径文件\033[0m"
                rm -rf Rabbit/
                echo -e "\033[33m 卸载镜像\033[0m"
                uninstall_imageJudge_fastRabbit
                ;;
            *)
                echo -e "\033[33m 卸载容器，清除配置路径文件，保留镜像\033[0m"
                container_info=$(docker inspect fastrabbit | grep Mounts -A 20)
                container_info_cut=${container_info#*\"Source\": \"}
                container_path=${container_info_cut%%\"*}
                cd $container_path || exit
                cd ..
                cd ..
                echo -e "\033[33m 停止容器\033[0m"
                docker stop fastrabbit
                echo -e "\033[33m 卸载容器\033[0m"
                docker rm -f fastrabbit
                echo -e "\033[33m 清除配置路径文件\033[0m"
                rm -rf Rabbit/
                ;;
            esac
            echo -e "\033[33m 卸载完成\033[0m"
            exit 0
            ;;
        *)
            echo -e "\033[41;33m 是否同时卸载rabbit镜像(y/n)【默认n】\033[0m" && read rabbitimageDelete
            if [ -z "${rabbitimageDelete}" ]; then
                rabbitimageDelete='n'
                echo "n"
            fi
            case $rabbitimageDelete in
            [yY])
                echo -e "\033[33m 卸载容器及镜像，保留配置路径文件\033[0m"

                echo -e "\033[33m 停止容器\033[0m"
                docker stop fastrabbit
                echo -e "\033[33m 卸载容器\033[0m"
                docker rm -f fastrabbit
                echo -e "\033[33m 卸载镜像\033[0m"
                uninstall_imageJudge_fastRabbit
                ;;
            *)
                echo -e "\033[33m 卸载容器，保留配置路径文件及镜像\033[0m"
                echo -e "\033[33m 停止容器\033[0m"
                docker stop fastrabbit
                echo -e "\033[33m 卸载容器\033[0m"
                docker rm -f fastrabbit
                ;;
            esac
            echo -e "\033[33m 卸载完成\033[0m"
            exit 0
            ;;
        esac
        ;;
    *)
        echo -e "\033[33m 取消卸载，返回菜单\033[0m"
        Synology_manage_fastrabbit_menu
        ;;
    esac

}
function uninstall_cl_madRabbit() {
    echo -e "\033[41;33m 是否确认卸载madrabbit(y/n)【默认n】\033[0m" && read rabbitDelete
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
            echo -e "\033[41;33m 是否同时卸载madrabbit镜像(y/n)【默认n】\033[0m" && read rabbitimageDelete
            if [ -z "${rabbitimageDelete}" ]; then
                rabbitimageDelete='n'
                echo "n"
            fi
            case $rabbitimageDelete in
            [yY])
                echo -e "\033[33m 卸载容器及镜像，清除配置路径文件\033[0m"
                container_info=$(docker inspect madrabbit | grep Mounts -A 20)
                container_info_cut=${container_info#*\"Source\": \"}
                container_path=${container_info_cut%%\"*}
                cd $container_path || exit
                cd ..
                cd ..
                echo -e "\033[33m 停止容器\033[0m"
                docker stop madrabbit
                echo -e "\033[33m 卸载容器\033[0m"
                docker rm -f madrabbit
                echo -e "\033[33m 清除配置路径文件\033[0m"
                rm -rf Rabbit/
                echo -e "\033[33m 卸载镜像\033[0m"
                uninstall_imageJudge_madRabbit
                ;;
            *)
                echo -e "\033[33m 卸载容器，清除配置路径文件，保留镜像\033[0m"
                container_info=$(docker inspect madrabbit | grep Mounts -A 20)
                container_info_cut=${container_info#*\"Source\": \"}
                container_path=${container_info_cut%%\"*}
                cd $container_path || exit
                cd ..
                cd ..
                echo -e "\033[33m 停止容器\033[0m"
                docker stop madrabbit
                echo -e "\033[33m 卸载容器\033[0m"
                docker rm -f madrabbit
                echo -e "\033[33m 清除配置路径文件\033[0m"
                rm -rf Rabbit/
                ;;
            esac
            echo -e "\033[33m 卸载完成\033[0m"
            exit 0
            ;;
        *)
            echo -e "\033[41;33m 是否同时卸载madrabbit镜像(y/n)【默认n】\033[0m" && read rabbitimageDelete
            if [ -z "${rabbitimageDelete}" ]; then
                rabbitimageDelete='n'
                echo "n"
            fi
            case $rabbitimageDelete in
            [yY])
                echo -e "\033[33m 卸载容器及镜像，保留配置路径文件\033[0m"

                echo -e "\033[33m 停止容器\033[0m"
                docker stop madrabbit
                echo -e "\033[33m 卸载容器\033[0m"
                docker rm -f madrabbit
                echo -e "\033[33m 卸载镜像\033[0m"
                uninstall_imageJudge_madRabbit
                ;;
            *)
                echo -e "\033[33m 卸载容器，保留配置路径文件及镜像\033[0m"
                echo -e "\033[33m 停止容器\033[0m"
                docker stop madrabbit
                echo -e "\033[33m 卸载容器\033[0m"
                docker rm -f madrabbit
                ;;
            esac
            echo -e "\033[33m 卸载完成\033[0m"
            exit 0
            ;;
        esac
        ;;
    *)
        echo -e "\033[33m 取消卸载，返回菜单\033[0m"
        Cloud_manage_madrabbit_menu
        ;;
    esac

}
function uninstall_sy_madRabbit() {
    echo -e "\033[41;33m 是否确认卸载madrabbit(y/n)【默认n】\033[0m" && read rabbitDelete
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
            echo -e "\033[41;33m 是否同时卸载madrabbit镜像(y/n)【默认n】\033[0m" && read rabbitimageDelete
            if [ -z "${rabbitimageDelete}" ]; then
                rabbitimageDelete='n'
                echo "n"
            fi
            case $rabbitimageDelete in
            [yY])
                echo -e "\033[33m 卸载容器及镜像，清除配置路径文件\033[0m"
                container_info=$(docker inspect madrabbit | grep Mounts -A 20)
                container_info_cut=${container_info#*\"Source\": \"}
                container_path=${container_info_cut%%\"*}
                cd $container_path || exit
                cd ..
                cd ..
                echo -e "\033[33m 停止容器\033[0m"
                docker stop madrabbit
                echo -e "\033[33m 卸载容器\033[0m"
                docker rm -f madrabbit
                echo -e "\033[33m 清除配置路径文件\033[0m"
                rm -rf Rabbit/
                echo -e "\033[33m 卸载镜像\033[0m"
                uninstall_imageJudge_madRabbit
                ;;
            *)
                echo -e "\033[33m 卸载容器，清除配置路径文件，保留镜像\033[0m"
                container_info=$(docker inspect madrabbit | grep Mounts -A 20)
                container_info_cut=${container_info#*\"Source\": \"}
                container_path=${container_info_cut%%\"*}
                cd $container_path || exit
                cd ..
                cd ..
                echo -e "\033[33m 停止容器\033[0m"
                docker stop madrabbit
                echo -e "\033[33m 卸载容器\033[0m"
                docker rm -f madrabbit
                echo -e "\033[33m 清除配置路径文件\033[0m"
                rm -rf Rabbit/
                ;;
            esac
            echo -e "\033[33m 卸载完成\033[0m"
            exit 0
            ;;
        *)
            echo -e "\033[41;33m 是否同时卸载madrabbit镜像(y/n)【默认n】\033[0m" && read rabbitimageDelete
            if [ -z "${rabbitimageDelete}" ]; then
                rabbitimageDelete='n'
                echo "n"
            fi
            case $rabbitimageDelete in
            [yY])
                echo -e "\033[33m 卸载容器及镜像，保留配置路径文件\033[0m"

                echo -e "\033[33m 停止容器\033[0m"
                docker stop madrabbit
                echo -e "\033[33m 卸载容器\033[0m"
                docker rm -f madrabbit
                echo -e "\033[33m 卸载镜像\033[0m"
                uninstall_imageJudge_madRabbit
                ;;
            *)
                echo -e "\033[33m 卸载容器，保留配置路径文件及镜像\033[0m"
                echo -e "\033[33m 停止容器\033[0m"
                docker stop madrabbit
                echo -e "\033[33m 卸载容器\033[0m"
                docker rm -f madrabbit
                ;;
            esac
            echo -e "\033[33m 卸载完成\033[0m"
            exit 0
            ;;
        esac
        ;;
    *)
        echo -e "\033[33m 取消卸载，返回菜单\033[0m"
        Synology_manage_madrabbit_menu
        ;;
    esac

}
function uninstall_cl_rabbit() {
    echo -e "\033[41;33m 是否确认卸载rabbit(y/n)【默认n】\033[0m" && read rabbitDelete
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
            echo -e "\033[41;33m 是否同时卸载rabbit镜像(y/n)【默认n】\033[0m" && read rabbitimageDelete
            if [ -z "${rabbitimageDelete}" ]; then
                rabbitimageDelete='n'
                echo "n"
            fi
            case $rabbitimageDelete in
            [yY])
                echo -e "\033[33m 卸载容器及镜像，清除配置路径文件\033[0m"
                container_info=$(docker inspect rabbit | grep Mounts -A 20)
                container_info_cut=${container_info#*\"Source\": \"}
                container_path=${container_info_cut%%\"*}
                cd $container_path || exit
                cd ..
                cd ..
                echo -e "\033[33m 停止容器\033[0m"
                docker stop rabbit
                echo -e "\033[33m 卸载容器\033[0m"
                docker rm -f rabbit
                echo -e "\033[33m 清除配置路径文件\033[0m"
                rm -rf Rabbit/
                echo -e "\033[33m 卸载镜像\033[0m"
                uninstall_imageJudge_rabbit
                ;;
            *)
                echo -e "\033[33m 卸载容器，清除配置路径文件，保留镜像\033[0m"
                container_info=$(docker inspect rabbit | grep Mounts -A 20)
                container_info_cut=${container_info#*\"Source\": \"}
                container_path=${container_info_cut%%\"*}
                cd $container_path || exit
                cd ..
                cd ..
                echo -e "\033[33m 停止容器\033[0m"
                docker stop rabbit
                echo -e "\033[33m 卸载容器\033[0m"
                docker rm -f rabbit
                echo -e "\033[33m 清除配置路径文件\033[0m"
                rm -rf Rabbit/
                ;;
            esac
            echo -e "\033[33m 卸载完成\033[0m"
            exit 0
            ;;
        *)
            echo -e "\033[41;33m 是否同时卸载rabbit镜像(y/n)【默认n】\033[0m" && read rabbitimageDelete
            if [ -z "${rabbitimageDelete}" ]; then
                rabbitimageDelete='n'
                echo "n"
            fi
            case $rabbitimageDelete in
            [yY])
                echo -e "\033[33m 卸载容器及镜像，保留配置路径文件\033[0m"

                echo -e "\033[33m 停止容器\033[0m"
                docker stop rabbit
                echo -e "\033[33m 卸载容器\033[0m"
                docker rm -f rabbit
                echo -e "\033[33m 卸载镜像\033[0m"
                uninstall_imageJudge_rabbit
                ;;
            *)
                echo -e "\033[33m 卸载容器，保留配置路径文件及镜像\033[0m"
                echo -e "\033[33m 停止容器\033[0m"
                docker stop rabbit
                echo -e "\033[33m 卸载容器\033[0m"
                docker rm -f rabbit
                ;;
            esac
            echo -e "\033[33m 卸载完成\033[0m"
            exit 0
            ;;
        esac
        ;;
    *)
        echo -e "\033[33m 取消卸载，返回菜单\033[0m"
        Cloud_manage_rabbit_menu
        ;;
    esac

}
function uninstall_sy_rabbit() {
    echo -e "\033[41;33m 是否确认卸载rabbit(y/n)【默认n】\033[0m" && read rabbitDelete
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
            echo -e "\033[41;33m 是否同时卸载rabbit镜像(y/n)【默认n】\033[0m" && read rabbitimageDelete
            if [ -z "${rabbitimageDelete}" ]; then
                rabbitimageDelete='n'
                echo "n"
            fi
            case $rabbitimageDelete in
            [yY])
                echo -e "\033[33m 卸载容器及镜像，清除配置路径文件\033[0m"
                container_info=$(docker inspect rabbit | grep Mounts -A 20)
                container_info_cut=${container_info#*\"Source\": \"}
                container_path=${container_info_cut%%\"*}
                cd $container_path || exit
                cd ..
                cd ..
                echo -e "\033[33m 停止容器\033[0m"
                docker stop rabbit
                echo -e "\033[33m 卸载容器\033[0m"
                docker rm -f rabbit
                echo -e "\033[33m 清除配置路径文件\033[0m"
                rm -rf Rabbit/
                echo -e "\033[33m 卸载镜像\033[0m"
                uninstall_imageJudge_rabbit
                ;;
            *)
                echo -e "\033[33m 卸载容器，清除配置路径文件，保留镜像\033[0m"
                container_info=$(docker inspect rabbit | grep Mounts -A 20)
                container_info_cut=${container_info#*\"Source\": \"}
                container_path=${container_info_cut%%\"*}
                cd $container_path || exit
                cd ..
                cd ..
                echo -e "\033[33m 停止容器\033[0m"
                docker stop rabbit
                echo -e "\033[33m 卸载容器\033[0m"
                docker rm -f rabbit
                echo -e "\033[33m 清除配置路径文件\033[0m"
                rm -rf Rabbit/
                ;;
            esac
            echo -e "\033[33m 卸载完成\033[0m"
            exit 0
            ;;
        *)
            echo -e "\033[41;33m 是否同时卸载rabbit镜像(y/n)【默认n】\033[0m" && read rabbitimageDelete
            if [ -z "${rabbitimageDelete}" ]; then
                rabbitimageDelete='n'
                echo "n"
            fi
            case $rabbitimageDelete in
            [yY])
                echo -e "\033[33m 卸载容器及镜像，保留配置路径文件\033[0m"

                echo -e "\033[33m 停止容器\033[0m"
                docker stop rabbit
                echo -e "\033[33m 卸载容器\033[0m"
                docker rm -f rabbit
                echo -e "\033[33m 卸载镜像\033[0m"
                uninstall_imageJudge_rabbit
                ;;
            *)
                echo -e "\033[33m 卸载容器，保留配置路径文件及镜像\033[0m"
                echo -e "\033[33m 停止容器\033[0m"
                docker stop rabbit
                echo -e "\033[33m 卸载容器\033[0m"
                docker rm -f rabbit
                ;;
            esac
            echo -e "\033[33m 卸载完成\033[0m"
            exit 0
            ;;
        esac
        ;;
    *)
        echo -e "\033[33m 取消卸载，返回菜单\033[0m"
        Synology_manage_rabbit_menu
        ;;
    esac

}
function uninstall_imageJudge_fastRabbit() {
    osCore=$(uname -m)
    osArm1='arm'
    osArm2='aarch'
    echo -e "检测内核为 \033[34m $osCore \033[0m "
    if [[ $osCore =~ $osArm1 ]] || [[ $osCore =~ $osArm2 ]]; then
        docker rmi ht944/fastrabbit:arm
    else
        docker rmi ht944/fastrabbit:latest
    fi
}
function uninstall_imageJudge_madRabbit() {
    osCore=$(uname -m)
    osArm1='arm'
    osArm2='aarch'
    echo -e "检测内核为 \033[34m $osCore \033[0m "
    if [[ $osCore =~ $osArm1 ]] || [[ $osCore =~ $osArm2 ]]; then
        docker rmi ht944/madrabbit:arm
    else
        docker rmi ht944/madrabbit:latest
    fi
}
function uninstall_imageJudge_rabbit() {
    osCore=$(uname -m)
    osArm1='arm'
    osArm2='aarch'
    echo -e "检测内核为 \033[34m $osCore \033[0m "
    if [[ $osCore =~ $osArm1 ]] || [[ $osCore =~ $osArm2 ]]; then
        docker rmi ht944/rabbit:arm
    else
        docker rmi ht944/rabbit:latest
    fi
}
system_Judgment
