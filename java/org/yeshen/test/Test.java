package org.yeshen.test;

import org.yeshen.test.hello.HiHi;
import org.yeshen.test.hello.Jni;

public final class Test {
  public static final String s1 = "hello Yeshen";

  public static void main(String[] args) {
    HiHi hi = new HiHi(s1);
    Jni jni = new Jni();
    System.out.println(hi.get());
    System.out.println(jni.stringFromJNI());
  }
}
