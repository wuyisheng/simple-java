package org.yeshen.test;

import org.yeshen.test.hello.HiHi;
import org.yeshen.test.hello.Jni;

public final class Test {
  public static final String s1 = "hello Yeshen";

  public static void main(String[] args) {
    System.out.println(new HiHi(s1).get());
    // System.out.println(new Jni().stringFromJNI());
  }
}
