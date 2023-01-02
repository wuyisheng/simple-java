package org.yeshen.test.hello;

public final class Jni {
    static {
        System.loadLibrary("hello");
    }

    public native String stringFromJNI();

    public native String stringToJNI(String string);

}