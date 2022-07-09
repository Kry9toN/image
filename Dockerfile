FROM ubuntu:focal
LABEL maintainer "Kry9toN <dhimasbagusprayoga@gmail.com>"

# Indonesian timezone (GMT+7)	
ENV TZ=Asia/Jakarta
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Tidy-up
RUN apt-get update -qq && \
    apt-get upgrade -y && \
    apt-get install --no-install-recommends -y \
	autoconf \
	autogen \
	automake \
	autotools-dev \
	bc \
	binutils \
	binutils-aarch64-linux-gnu \
	binutils-arm-linux-gnueabi \
	bison \
	bzip2 \
	ca-certificates \
	coreutils \
	cmake \
	curl \
        cpio \
	expect \
	flex \
	g++ \
	gawk \
	gcc \
	git \
	gnupg \
	gperf \
	help2man \
	lftp \
	libc6-dev \
	libelf-dev \
	libgomp1-* \
	liblz4-tool \
	libncurses5-dev \
	libssl-dev \
	libstdc++6 \
	libtool \
	libtool-bin \
	m4 \
	make \
	nano \
	openjdk-8-jdk \
	openssh-client \
	openssl \
	ovmf \
	patch \
	pigz \
	python3 \
	python \
	rsync \
	shtool \
	subversion \
	sshpass \
	tar \
	texinfo \
	tzdata \
	u-boot-tools \
	unzip \
	wget \
	xz-utils \
	zip \
	zlib1g-dev \
	zstd

# SSH Folder
RUN mkdir ~/.ssh/

# Git
RUN git config --global user.email "dhimasbagusprayoga@gmail.com"
RUN git config --global user.name "Kry9toN"

# Clang 13
RUN git clone https://github.com/Kry9toN/clang -b dev/13.0 --depth=1 --single-branch /root/tools/clang13

# proton
RUN git clone https://github.com/kdrag0n/proton-clang.git -b 20210206 --depth=1 --single-branch /root/tools/proton

# twisted-clang
RUN git clone https://github.com/TwistedPrime/twisted-clang.git -b master --depth=1 --single-branch /root/tools/twisted

# GCC
RUN git clone https://github.com/mvaisakh/gcc-arm64.git -b gcc-master --depth=1 --single-branch /root/tools/gcc

# GCC-ARM
RUN git clone https://github.com/mvaisakh/gcc-arm.git -b gcc-master --single-branch /root/tools/gccarm

# AK3
RUN git clone https://github.com/Kry9toN/AnyKernel3 /root/AnyKernel

