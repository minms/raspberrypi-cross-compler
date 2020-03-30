FROM ubuntu:18.04

# 更新ubuntu源, 安装编译工具
RUN sed -i s/archive.ubuntu.com/mirrors.aliyun.com/g /etc/apt/sources.list && \
	sed -i s/security.ubuntu.com/mirrors.aliyun.com/g /etc/apt/sources.list && \
	apt update && \
	apt install -y cmake build-essential 

# 创建toolchain目录
RUN mkdir -p /toolchain/arm-bcm2708

# 将工具解压到toolchain目录, 并删除压缩包
COPY include/gcc-linaro-arm-linux-gnueabihf-raspbian-x64.tar.gz /toolchain/
RUN tar -zxf /toolchain/gcc-linaro-arm-linux-gnueabihf-raspbian-x64.tar.gz -C /toolchain/arm-bcm2708/ && \
	rm -rf /toolchain/gcc-linaro-arm-linux-gnueabihf-raspbian-x64.tar.gz

# 添加到环境变量
RUN echo "export PATH=$PATH:/toolchain/arm-bcm2708/gcc-linaro-arm-linux-gnueabihf-raspbian-x64/bin" >> ~/.bashrc