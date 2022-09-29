# MadRabbit_Install使用指南

## *MadRabbit作者地址：https://github.com/HT944/MadRabbit* 

* 初写，不太完善，在改进中，可以反馈  
* 目前只测试了centos  x86_64(amd) 单青龙
>理论上适配了arm，如有问题期待反馈
* 群晖写了，没测试过,可以运行国内鸡测试  
* 侵删
## Rabbit一键安装命令
 
**如提示curl command not found，请先安装curl**  
~~最近改代码较勤快，可以等稳定了再来~~
* **一键配置 配置文件建议自行后台配置青龙**（偷懒了，单青龙、多青龙以及不配置青龙都用的一个函数，所以建议青龙自行配置）

### 国内鸡
```bash
bash <(curl -s -L https://ghproxy.com/https://raw.githubusercontent.com/AyeSt0/MadRabbit_Install/master/RabbitInstall.sh)
```
>**如果无法下载，请自行更换加速站前缀，亦或者自建加速站  
教程[指路](https://www.kejiwanjia.com/jiaocheng/105320.html)**
### 国外鸡
```bash
bash <(curl -s -L https://raw.githubusercontent.com/AyeSt0/MadRabbit_Install/master/RabbitInstall.sh)
```
## 不切实际的未来计划
* *完善脚本，让脚本能循环利用😀*  

## 不靠谱的更新日志

* *20220929 v1.0.7 尝试修复一键管理面板选择问题
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
