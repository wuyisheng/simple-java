A ide-less java build environment.


# Usage

```bash
make android
# build jar which run in android device(dalvikvm)
# export file at build/android_out.jar
# java -Djava.library.path=./build -classpath build/out.jar org.yeshen.test.Test

make linux
# build jar which run in linux
# export file at build/out.jar
# adb shell dalvikvm -Djava.library.path=/data/local/tmp -classpath /sdcard/Download/android_out.jar org.yeshen.test.Test

make clean
```

# Before make android

```bash
sudo update-alternatives --config javac
# select /usr/lib/jvm/java-8-openjdk-amd64/bin/javac 
sudo update-alternatives --config java
# select /usr/lib/jvm/java-8-openjdk-amd64/bin/java
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
# sudo apt-get install openjdk-8-jdk


export ANDROID_BUILD_HOME=${your-dir-of-ndk-bundle-toolchains}
export PATH=${your-dir-of-Android-build-tools}:$PATH
export PATH=${your-dir-of-Android-platform-tools}:$PATH
# eg: 
# export ANDROID_BUILD_HOME=/home/yeshen/Android/Sdk/ndk-bundle/toolchains/llvm/prebuilt/linux-x86_64
# export PATH=/home/yeshen/Android/Sdk/build-tools/30.0.3:$PATH
# export PATH=/home/yeshen/Android/Sdk/platform-tools:$PATH
#
# How to get this (I mean Android-build-tools) ?
# See: 
# 1. https://developer.android.google.cn/studio/install?hl=zh-cn
# 2. https://developer.android.google.cn/studio/command-line?hl=zh-cn#tools-build
```

# Docs

1. https://blog.csdn.net/yeshennet/article/details/84928520


