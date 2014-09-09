//
//  PhonemicMacSpeechFunction.h
//  CocoaSpeech
//
//  Created by Justine PORCHEROT on 8/7/14.
//  Copyright (c) 2014 Software Engineering and Media Lab. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PhonemicMacSpeechFunction : NSObject

+ (BOOL) canPause;
+ (BOOL) canResume;
+ (BOOL) canStop;
+ (BOOL) canSetVoice;
+ (BOOL) canSetVolume;
+ (BOOL) canSetSpeed;
+ (BOOL) canSetPitch;
+ (void) reinitialize;
+ (void) respeak;
+ (void) resume;
+ (void) setVolume:(double_t) vol;
+ (void) setSpeed:(double_t) speed;
+ (void) setPitch:(double_t) pitch;
+ (void) setVoice:(NSString *) voice;
+ (void) stop;
+ (void) setSpeechEnable;
+ (void) setTextToSpeechEngine;


+ (void) speak:(NSString *)text;
+ (BOOL) canSpeak;
+ (BOOL) isSpeaking;
+ (NSString *) getCurrentVoice;
+ (double_t) getVolume;
+ (double_t) getPitch;
+ (void) pause;
+ (BOOL) isSpeechEnable;
+ (double_t) getVersion;
+ (NSString *) getTextToSpeechEngine;

@end
