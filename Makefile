build_jar : 
	echo -e "\n\n---build jar---"
	make clean && mkdir -p build/out
	find ./java -type f -name "*.java" > build/sources.txt
	javac -d ./build/out  @build/sources.txt
	cd build/out/ && jar -cvf ../out.jar ./*  && cd .. && cd ..
	ls -alh build/out.jar

build_linux_so:
	echo -e "\n\n---building so---"
	rm -r cpp/jni && mkdir -p cpp/jni
	grep -rnw './java' -e 'native' | cut -d":" -f1 | xargs javac -h cpp/jni

	gcc -fPIC -I"${JAVA_HOME}/include" \
		-I"${JAVA_HOME}/include/linux" \
		-shared -o build/libhello.so cpp/*.c
	ls -alh build/libhello.so

linux:
	make build_jar
	make build_linux_so
	java -Djava.library.path=./build -classpath build/out.jar org.yeshen.test.Test


build_android_jar:
	make build_jar
	cd ./build && dx --dex --output=classes.dex out.jar \
		&& aapt add android_out.jar classes.dex && cd ..
	ls -alh build/android_out.jar


build_android_arm64_so:
	echo -e "\n\n---building so---"
	rm -r cpp/jni && mkdir -p cpp/jni
	grep -rnw './java' -e 'native' | cut -d":" -f1 | xargs javac -h cpp/jni

	${ANDROID_BUILD_HOME}/bin/aarch64-linux-android30-clang  \
		-fPIC -I"${ANDROID_BUILD_HOME}/sysroot/usr/include" \
		-I"${ANDROID_BUILD_HOME}/sysroot/usr/include/android" \
		-shared -o build/libhello.so cpp/*.c
	ls -alh build/libhello.so


copy_and_exec_at_cell_phone:
	echo -e "\n\n---copy and exec at cell phone---"
	adb shell mkdir -p /data/local/tmp
	adb push build/libhello.so /data/local/tmp
	adb push build/android_out.jar /sdcard/Download/ 
	adb shell dalvikvm -Djava.library.path=/data/local/tmp \
		-classpath /sdcard/Download/android_out.jar org.yeshen.test.Test

android:
	make build_android_jar
	make build_android_arm64_so
	make copy_and_exec_at_cell_phone

clean :
	rm -rf build

