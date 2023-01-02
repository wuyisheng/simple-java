build_jar : 
	make clean && mkdir -p build/out
	find ./java -type f -name "*.java" > build/sources.txt
	javac -d ./build/out  @build/sources.txt
	cd build/out/ && jar -cvf ../out.jar ./*  && cd .. && cd ..
	@echo "Happing ending~"

test :
	make build_jar
	java -classpath build/out.jar org.yeshen.test.Test

clean :
	rm -rf build

