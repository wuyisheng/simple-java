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
	gcc -fPIC -I"/usr/lib/jvm/java-11-openjdk-amd64/include" \
	-I"/usr/lib/jvm/java-11-openjdk-amd64/include/linux" \
	-shared -o build/libhello.so cpp/*.c

test:
	make build_jar
	make build_linux_so
	java -Djava.library.path=./build -classpath build/out.jar org.yeshen.test.Test

clean :
	rm -rf build

