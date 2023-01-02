build_jar : 
	echo ":export build jar---"
	make clean && mkdir -p build/out
	find ./java -type f -name "*.java" > build/sources.txt
	javac -d ./build/out  @build/sources.txt
	cd build/out/ && jar -cvf ../out.jar ./*  && cd .. && cd ..
	echo "done build jar"

build_linux_so:
	echo ":export file header---"
	rm -r cpp/jni && mkdir -p cpp/jni
	grep -rnw './java' -e 'native' | cut -d":" -f1 | xargs javac -h cpp/jni

	echo ":build so---"
	gcc -fPIC -I"${JAVA_HOME}/include" \
		-I"${JAVA_HOME}/include/linux" \
		-shared -o build/libhello.so cpp/*.c

linux:
	make build_jar
	make build_linux_so
	java -Djava.library.path=./build -classpath build/out.jar org.yeshen.test.Test

android:
	echo "android"
	make build_jar
	cd ./build && dx --dex --output=classes.dex out.jar \
		&& aapt add android_out.jar classes.dex && cd ..
	adb push build/android_out.jar /sdcard/Download/ 
	adb shell dalvikvm -classpath /sdcard/Download/android_out.jar org.yeshen.test.Test

clean :
	rm -rf build

