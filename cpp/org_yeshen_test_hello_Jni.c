#include <jni.h>
#include <stdio.h>
#include "jni/org_yeshen_test_hello_Jni.h"

JNIEXPORT jstring JNICALL Java_org_yeshen_test_hello_Jni_stringFromJNI(JNIEnv *env, jobject obj)
{
  const char *hello = "Hello from jni";
  return (*env)->NewStringUTF(env, hello);
}

JNIEXPORT jstring JNICALL Java_org_yeshen_test_hello_Jni_stringToJNI(JNIEnv *env, jobject obj, jstring str)
{
  const char *hello = "echo:";
  return (*env)->NewStringUTF(env, hello);
}