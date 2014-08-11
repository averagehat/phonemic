//
//  PhonemicMacSpeechServer.h
//  CocoaSpeech
//
//  Created by Justine PORCHEROT on 8/7/14.
//  Copyright (c) 2014 Software Engineering and Media Lab. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PhonemicMacSpeechServer : NSObject

{
    NSString * tmessage;
    char message;
}

+ (NSString *) translateMessage:(char)message;
+ (id) separateMessage:(NSString *)tMessage;

@end
