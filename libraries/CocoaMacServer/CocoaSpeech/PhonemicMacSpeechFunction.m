//
//  PhonemicMacSpeechFunction.m
//  CocoaSpeech
//
//  Created by Justine PORCHEROT on 8/7/14.
//  Copyright (c) 2014 Software Engineering and Media Lab. All rights reserved.
//

#import "PhonemicMacSpeechFunction.h"

@implementation PhonemicMacSpeechFunction

NSString *textMessage;
BOOL speakingValue;
BOOL currentPause;
double_t currentVolume;
double_t pitch;
NSString *currentVoice;
NSString * textToSpeechEngine;
double_t version;
float * nextPitch;
float * nextSpeed;
BOOL canPause;
BOOL canResume;
BOOL canStop;
BOOL canSpeak;
BOOL canSetVoice;
BOOL canSetVolume;
BOOL canSetSpeed;
BOOL canSetPitch;
BOOL speechEnable;

NSSpeechSynthesizer * speechSynth;

+ (void) speak {
    
    NSString * texte= @"hello everybody";
    NSSpeechSynthesizer * speechSynth = [[NSSpeechSynthesizer alloc]init];
    speechSynth = [NSSpeechSynthesizer new];
    [speechSynth startSpeakingString:texte ];
    
    NSLog(@"fonction speach ");
}

+ (BOOL) canPause{
    return canPause=TRUE;
}

+ (void) pause{
    [speechSynth pauseSpeakingAtBoundary:NSSpeechImmediateBoundary];
}

+ (BOOL) canResume{
    return canResume=0;
}

+ (void) resume{
}


+ (BOOL) canStop{
    return canStop=TRUE;
}

+ (void) stop{
    
    [speechSynth stopSpeaking];
}

+ (BOOL) canSetVoice{
    return canSetVoice=TRUE;
}

+ (void) setVoice:(NSString *) voice{
    [speechSynth setVoice:voice];
}

+ (NSString *) getCurrentVoice{
    currentVoice = [speechSynth voice];
    return currentVoice;
}

+ (BOOL) canSetVolume{
    return canSetVolume=TRUE;
}

+ (void) setVolume: (double_t) vol{
    [speechSynth setVolume:vol];
}

+ (double_t) getVolume{
    currentVolume = [speechSynth volume];
    return currentVolume;
}

+ (BOOL) canSetSpeed{
    return canSetSpeed=TRUE;
}

+ (void) setSpeed:(double_t) speed{
    [speechSynth setRate:speed];
}

+ (BOOL) canSetPitch{
    return canSetPitch=FALSE;
}


+ (void) setPitch:(double_t) pitch{
    //   [speechSynth setObject:NSSpeechStatusProperty forProperty:NSSpeechPitchModProperty error:nil];
    //   [[speechSynth objectForProperty:NSSpeechPitchBaseProperty error:nil] pitch];
    
}

+ (double_t) getPitch{
    return pitch;
}


+ (void) reinitialize{
    speechSynth = [[NSSpeechSynthesizer alloc]init];
    [speechSynth setObject:nil forProperty:NSSpeechResetProperty error:nil];
}


+ (BOOL) isSpeaking{
    speakingValue = [speechSynth isSpeaking];
    return speakingValue;
}


+ (double_t) getVersion{
    return version;
}

+ (BOOL) isSpeechEnable{
    return speechEnable;
}

+ (void) setSpeechEnable{
    speechEnable=1;
}

+ (BOOL) canSpeak{
    return canSpeak=TRUE;
}

+ (NSString *) getTextToSpeechEngine{
    return textToSpeechEngine;
}

+ (void) setTextToSpeechEngine{
    textToSpeechEngine = @"APPLE_COCOA";
}

+ (void) respeak{
    
}



@end
