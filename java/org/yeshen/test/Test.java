package org.yeshen.test;

import org.yeshen.test.hello.HiHi;

public final class Test{
  public static final String  s1 = "hello Yeshen";
  public static void main(String[] args){
    HiHi hi = new HiHi(s1);
    System.out.println(hi.get());
  }
}

