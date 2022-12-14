# MadRabbit_Utils使用指南

## *MadRabbit作者地址：https://github.com/HT944/MadRabbit* 
* 只是MadRabbit的普通用户，心血来潮做的一键，除购买Rabbit授权以外，与MadRabbit没有任何经济往来  
* 只要我还有兴趣敲代码orMad没跑，就可能改进，可以反馈  
* 初测试平台是centos8 x86_64(amd),理论上适配了arm，目前没有收到其它问题反馈，所以不知道运行结果  
* 群晖可以运行国内鸡测试（咱也没群晖，也不知道实际情况咋样）  
* 已有rabbit容器会启动管理脚本  
* 未安装rabbit的会启动安装脚本    
* 侵删  
## Rabbit一键命令
 
**如提示curl command not found，请先安装curl**  
~~最近改代码较勤快，可以等稳定了再来~~
* **一键配置 配置文件建议自行后台配置青龙**（偷懒了，单青龙、多青龙以及不配置青龙都用的一个函数，所以建议青龙自行配置）

### 国内鸡
```bash
bash <(curl -s -L https://ghproxy.com/https://raw.githubusercontent.com/AyeSt0/MadRabbit_Utils/master/RabbitUtils.sh)
```
>**如果无法下载，请自行更换加速站前缀，亦或者自建加速站  
教程[指路](https://www.kejiwanjia.com/jiaocheng/105320.html)**

### 国外鸡
```bash
bash <(curl -s -L https://raw.githubusercontent.com/AyeSt0/MadRabbit_Utils/master/RabbitUtils.sh)
```
#### 旧版Rabbit一键（稳定版）
```bash
bash <(curl -s -L https://ghproxy.com/https://raw.githubusercontent.com/AyeSt0/MadRabbit_Utils/master/RabbitManage.sh)
```
```bash
bash <(curl -s -L https://raw.githubusercontent.com/AyeSt0/MadRabbit_Utils/master/RabbitManage.sh)
```
## 不切实际的未来计划
* *完善脚本，让脚本能循环利用😀*  

## 不靠谱的更新日志
* *20230104 v1.2.5 修复本地版本号显示问题，修改远程版本显示逻辑（Mad网站崩了，获取不到远程版本号）*
* *20221130 v1.2.0 增加Rabbit的多版本支持*
* *20221017 v1.1.5 修复卸载镜像功能，增加对系统内核判断，理论上适配了ARM*
* *20221017 v1.1.4 修复短信登录配置问题，恢复强制打码默认项为true。如需对接快捷登录请在原对接地址后加/rabbit*
* *20221017 v1.1.3 一键管理脚本新增卸载镜像功能；由于Rabbit4.2.0恢复快捷登录，修改配置配置文件打码默认设置为true，并增加部分提示*
* *20221008 v1.1.2 增加授权提示，优化了部分代码，美化了部分UI，修正了部分错别字，强化了卸载功能。*
* *20221001 v1.1.1国庆特别版🎉 增加端口设置二次判断，避免大家回车成习惯忘了改端口；移除安装脚本中更新选项。祝大家国庆快乐！*
* *20220929 v1.1.0 修改配置国内镜像源部分代码及逻辑，默认源更改为网易镜像源*
* *20220929 v1.0.9 修复更新功能，取消浪费时间的启动倒计时*
* *20220929 v1.0.8 由于rabbit暂未提供远程最新版本号，将更新功能暂时换成强制更新*
* *20220929 v1.0.7 尝试修复一键管理面板选择问题*
* *20220929 v1.0.6 更新一键管理面板-卸载功能*
* *20220928 v1.0.5 修改镜像源默认逻辑*
* *20220928 v1.0.4 修复了一些文本错误，修改了更新指令逻辑*
* *20220928 v1.0.3 调整更新命令*
* *20220928 v1.0.2 优化了脚本结构，增加了更新功能，并添加了一键管理脚本雏形，同时添加了未知Bug等待发现*
* *20220928 v1.0.1 更新了国内鸡Docker镜像源检测及修改*
* *20220926 v1.0.0 Ohhhh大版本更新！！！（更新了一键配置配置文件，现在看起来是个相较完整的线性一键脚本了*  
* *20220925 v0.0.3~v0.9.9 别问我为啥跳版本，其实脚本在本地已经迭代好几个版本了,修复了一些bug，并塞入了更多bug...*  
* *20220925 v0.0.3 支持了检测docker存在性，并塞入了更多bug...*  
* *20220924 v0.0.2 内部修复了一些bug，并塞入了更多bug...*  
* *20220924 v0.0.1 初版诞生*  
