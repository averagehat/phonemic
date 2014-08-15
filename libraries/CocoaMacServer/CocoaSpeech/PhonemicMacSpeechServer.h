//
//  PhonemicMacSpeechServer.h
//  CocoaSpeech
//
//  Created by Justine PORCHEROT on 8/7/14.
//  Copyright (c) 2014 Software Engineering and Media Lab. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface PhonemicMacSpeechServer : NSObject <NSStreamDelegate>

{
    NSString * tmessage;
    char message;
    
    int portNumber;
    id delegate;
    
    NSSocketPort *socketPort;
    NSFileHandle *fileHandle;
    
    NSMutableArray *connections;
    NSMutableArray *requests;
    
    NSInputStream *inputStream;
    NSOutputStream *outputStream; 
}

+ (NSString *) translateMessage:(char)message;
+ (id) separateMessage:(NSString *)tMessage;

- (void)initWithPortNumber:(int)pn;
- (void) newConnection;
- (void)dealloc;


@end
