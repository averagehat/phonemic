/* DO NOT EDIT THIS FILE - it is machine generated */
#include <jni.h>
/* Header for class org_sodbeans_phonemic_tts_impl_LinuxSpeak */

#ifndef _Included_org_sodbeans_phonemic_tts_impl_LinuxSpeak
#define _Included_org_sodbeans_phonemic_tts_impl_LinuxSpeak
#ifdef __cplusplus
extern "C" {
#endif
/*
 * Class:     org_sodbeans_phonemic_tts_impl_LinuxSpeak
 * Method:    speakNative
 * Signature: (Ljava/lang/String;)Z
 */
JNIEXPORT jboolean JNICALL Java_org_sodbeans_phonemic_tts_impl_LinuxSpeak_speakNative
  (JNIEnv *, jobject, jstring);

/*
 * Class:     org_sodbeans_phonemic_tts_impl_LinuxSpeak
 * Method:    speakCharNative
 * Signature: (C)Z
 */
JNIEXPORT jboolean JNICALL Java_org_sodbeans_phonemic_tts_impl_LinuxSpeak_speakCharNative
  (JNIEnv *env, jobject jobj, jstring c);

/*
 * Class:     org_sodbeans_phonemic_tts_impl_LinuxSpeak
 * Method:    speakBlockingNative
 * Signature: (Ljava/lang/String;)Z
 */
JNIEXPORT jboolean JNICALL Java_org_sodbeans_phonemic_tts_impl_LinuxSpeak_speakBlockingNative
  (JNIEnv *, jobject, jstring);

/*
 * Class:     org_sodbeans_phonemic_tts_impl_LinuxSpeak
 * Method:    speakCharBlockingNative
 * Signature: (C)Z
 */
JNIEXPORT jboolean JNICALL Java_org_sodbeans_phonemic_tts_impl_LinuxSpeak_speakCharBlockingNative
  (JNIEnv *env, jobject jobj, jstring c);
/*
 * Class:     org_sodbeans_phonemic_tts_impl_LinuxSpeak
 * Method:    stopNative
 * Signature: ()Z
 */
JNIEXPORT jboolean JNICALL Java_org_sodbeans_phonemic_tts_impl_LinuxSpeak_stopNative
  (JNIEnv *, jobject);

/*
 * Class:     org_sodbeans_phonemic_tts_impl_LinuxSpeak
 * Method:    pauseNative
 * Signature: ()Z
 */
JNIEXPORT jboolean JNICALL Java_org_sodbeans_phonemic_tts_impl_LinuxSpeak_pauseNative
  (JNIEnv *, jobject);

/*
 * Class:     org_sodbeans_phonemic_tts_impl_LinuxSpeak
 * Method:    resumeNative
 * Signature: ()Z
 */
JNIEXPORT jboolean JNICALL Java_org_sodbeans_phonemic_tts_impl_LinuxSpeak_resumeNative
  (JNIEnv *, jobject);

/*
 * Class:     org_sodbeans_phonemic_tts_impl_LinuxSpeak
 * Method:    getVoicesNative
 * Signature: ()Ljava/lang/String;
 */
JNIEXPORT jstring JNICALL Java_org_sodbeans_phonemic_tts_impl_LinuxSpeak_getVoicesNative
  (JNIEnv *, jobject);

/*
 * Class:     org_sodbeans_phonemic_tts_impl_LinuxSpeak
 * Method:    getVoiceNative
 * Signature: ()Ljava/lang/String;
 */
JNIEXPORT jstring JNICALL Java_org_sodbeans_phonemic_tts_impl_LinuxSpeak_getVoiceNative
  (JNIEnv *, jobject);

/*
 * Class:     org_sodbeans_phonemic_tts_impl_LinuxSpeak
 * Method:    setVoiceNative
 * Signature: (Ljava/lang/String;)Z
 */
JNIEXPORT jboolean JNICALL Java_org_sodbeans_phonemic_tts_impl_LinuxSpeak_setVoiceNative
  (JNIEnv *, jobject, jstring);

/*
 * Class:     org_sodbeans_phonemic_tts_impl_LinuxSpeak
 * Method:    setVolumeNative
 * Signature: (D)Z
 */
JNIEXPORT jboolean JNICALL Java_org_sodbeans_phonemic_tts_impl_LinuxSpeak_setVolumeNative
  (JNIEnv *, jobject, jint);

/*
 * Class:     org_sodbeans_phonemic_tts_impl_LinuxSpeak
 * Method:    setSpeedNative
 * Signature: (D)Z
 */
JNIEXPORT jboolean JNICALL Java_org_sodbeans_phonemic_tts_impl_LinuxSpeak_setSpeedNative
  (JNIEnv *, jobject, jint);

/*
 * Class:     org_sodbeans_phonemic_tts_impl_LinuxSpeak
 * Method:    setSpeedNative
 * Signature: (D)Z
 */
JNIEXPORT jboolean JNICALL Java_org_sodbeans_phonemic_tts_impl_LinuxSpeak_setPitchNative
  (JNIEnv *, jobject, jint);
/*
 * Class:     org_sodbeans_phonemic_tts_impl_LinuxSpeak
 * Method:    isSpeakingNative
 * Signature: ()Z
 */
JNIEXPORT jboolean JNICALL Java_org_sodbeans_phonemic_tts_impl_LinuxSpeak_isSpeakingNative
  (JNIEnv *, jobject);

/*
 * Class:     org_sodbeans_phonemic_tts_impl_LinuxSpeak
 * Method:    initializeNative
 * Signature: ()V
 */
JNIEXPORT void JNICALL Java_org_sodbeans_phonemic_tts_impl_LinuxSpeak_initializeNative
  (JNIEnv *, jobject);

/*
 * Class:     org_sodbeans_phonemic_tts_impl_LinuxSpeak
 * Method:    reinitializeNative
 * Signature: ()V
 */
JNIEXPORT void JNICALL Java_org_sodbeans_phonemic_tts_impl_LinuxSpeak_reinitializeNative
  (JNIEnv *, jobject);

/*
 * Class:     org_sodbeans_phonemic_tts_impl_LinuxSpeak
 * Method:    destroyNative
 * Signature: ()V
 */
JNIEXPORT void JNICALL Java_org_sodbeans_phonemic_tts_impl_LinuxSpeak_destroyNative
  (JNIEnv *, jobject);

#ifdef __cplusplus
}
#endif
#endif
