#教程 #RM
# 1 GET start
## 1.1 简介
本教程简单介绍以下机器人操作系统-ROS 2。ROS 2 是在 ROS（Robot Operating System）的基础上开发的第二代机器人操作系统。ROS 本身并不是一个操作系统，而是一套软件库和工具集。
ROS 1 最早起源于 2007 年斯坦福大学人工智能实验室的 STAIR 项目与机器人技术公司 Willow Garage 的个人机器人项目之间的合作。2008 年之后，由 Willow Garage 公司推动其发展。经过近一年的测试，于 2010 年初推出了 ROS 1.0 版，并在当年三月份推出了正式发行版本：ROS Box Turtle。

| 特性     | ROS 1      | ROS 2                                   |
| ------ | ---------- | --------------------------------------- |
| 操作系统支持 | 主要是 Linux  | 多平台（Linux, Windows, MacOS, RTOS，甚至FPGA） |
| 通信机制   | TCP/UDP    | DDS（Data Distribution Service）          |
| 实时性    | 有限         | 改进，适合实时系统                               |
| 社区支持   | 广泛，但逐渐减少   | 日益增长，更活跃                                |
| 版本更新   | 2025年后不再更新 | 持续更新和改进                                 |

## 1.2 C++ ROS 2 客户端的安装
### 1.2.1 Windows 上
不建议，除非你有构建仿真插件的需求。
[最简单安装教程]([Using a ROS Package on Windows - ROS on Windows (ms-iot.github.io)](https://ms-iot.github.io/ROSOnWindows/GettingStarted/UsingROSonWindows.html))
### 1.2.2 Ubuntu 下
可以在 VMware 下安装，也可以在双系统中安装，个人感觉最方便的方式是在 WSL 2 中安装，（WSL 2 安装教程省略）。
犹记得当年大一的时候装环境，学长在我的电脑上打开了一个命令行，然后输入了一堆指令，给小小的我造成了一点心理上的震撼，当时还不知道学长给我用的就是 WSL 2，还埋怨占了我 40 个 G。最后用过了 VMvare，双系统，还是又回到了 WSL 2。
#### 1.2.2.1 手动构建
下载 ROS 2 官方仓库源代码，使用脚本进行构建。略。
#### 1.2.2.2 apt 源 install

```bash
sudo apt update # update your apt repo caches
sudo apt install ros-humble-desktop
```
#### 1.2.2.3 懒人专用
使用鱼香肉丝。换源+一键安装。
```shell
wget http://fishros.com/install -O fishros && . fishros
```
安装完成之后看一眼 `~/.bashrc`, 如果你用的是 zsh 就是 `~/.zshrc`
```bash
vim ~/.zshrc
```
应该有 `source /opt/ros/humble/setup.zsh` 或者 `source /opt/ros/humble/setup.bash`, 作用是每次打开终端声明环境变量。
# 2 C++ 中的 ROS2
下面我们将从简单的例子入手介绍一下 ROS 
## 2.1 ROS2工作区
ROS 2的工作区是一个用于组织和管理 ROS 2软件包的目录结构。它通常包含以下几个部分：
- **src (Source Space)**: 存放源代码的地方，包括各种ROS 2软件包的源文件。
- **build (Build Space)**: 编译过程中的临时文件存放地。
- **install (Install Space)**: 编译后的安装文件存放地，可以用来运行ROS 2程序。
- **log (Log Space)**: 构建过程中生成的日志文件存放地。
创建一个新的ROS 2工作区通常涉及以下步骤：
1. 创建一个新目录作为工作区的根目录，例如`dev_ws`。
2. 在根目录下创建`src`目录，并将所有的ROS 2软件包放在这里。
3. 使用`colcon build`命令来编译工作区中的软件包。
4. 使用`source`命令来设置环境，以便在当前终端中使用工作区中的软件包。
## 2.2 colcon
## 2.3 使用 Cmake

```bash
ros2 pkg create example_topic_rclcpp --build-type ament_cmake rclcpp
```


# 3 ROS2 奇技淫巧
``` c++
#include<iostream>
using name spacestd;
int main(){
return 0;
}
```
## 3.1 Micros
## 3.2 FPGA中的ROS2
## 3.3 用作机器人仿真
# 4 拓展阅读

| FPGA 与 ROS 2   |     |
| -------------- | --- |
| Zephyr 与 ROS 2 |     |
| unity 与 ROS 2  |     |
| UE 与 ROS 2     |     |
| nodejs 与 ROS 2 |     |

# 5 工作空间
 工作空间
	src
		包 1
			src
			include
		包 2
			src
			include