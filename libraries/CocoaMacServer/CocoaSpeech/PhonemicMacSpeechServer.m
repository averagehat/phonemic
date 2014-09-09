//
//  PhonemicMacSpeechServer.m
//  CocoaSpeech
//
//  Created by Justine PORCHEROT on 8/7/14.
//  Copyright (c) 2014 Software Engineering and Media Lab. All rights reserved.
//

#import "PhonemicMacSpeechServer.h"
#import <Foundation/NSURLConnection.h>




@implementation PhonemicMacSpeechServer

char * message;
NSFileHandle * listeningHandle;
NSString *tmessage;



+ (NSString *) translateMessage:(char)message{
    NSLog(@"translate methode");
    tmessage= [NSString stringWithUTF8String:&message];
    return tmessage;
}


+ (id) separateMessage:(NSString *)tmessage{
    
    NSLog(@"separate methode");
    // create an arrayList to contain the information
    NSArray * itemsList = [[NSArray alloc]init];
    
    // initialize the separator of the message
    NSCharacterSet *separator = [NSCharacterSet characterSetWithCharactersInString:@":"];
    
    // initialize the message to separate
    NSString *list = tmessage;
    
    // insert the information separated
    itemsList = [list componentsSeparatedByCharactersInSet:separator];
    
    // write in the console the informations to be sure
    for (int j=0; j<[itemsList count];j++) {
        NSLog(@"%d. %@\n", j, [itemsList objectAtIndex:j]);
    }
    return itemsList;
}

- (id)initWithPortNumber:(int)pn delegate:(id)dl{
    
    
    NSLog(@"Start connection");
    
    socketPort = [[NSSocketPort alloc] initWithTCPPort:pn];
    int fd = [socketPort socket];
    fileHandle = [[NSFileHandle alloc] initWithFileDescriptor:fd closeOnDealloc:YES];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(newConnection:)
                                                name:NSFileHandleConnectionAcceptedNotification
                                                    object:fileHandle];
    
    [fileHandle acceptConnectionInBackgroundAndNotify];
    
    NSLog(@"Socket created");
    return self;
    
}
    
- (void) newConnection:(NSString *)path{
    
    NSLog(@"Connection accepted");
    
    CFReadStreamRef readStream;
    CFWriteStreamRef writeStream;
    
    
   NSLog(@"1 partie");
    CFStreamCreatePairWithSocketToHost(NULL, (CFStringRef)@"localhost", 56103, &readStream, &writeStream);
   
    /*if (readStream && writeStream)
    {
        CFReadStreamSetProperty(readStream,
                                kCFStreamPropertyShouldCloseNativeSocket,
                                kCFBooleanTrue);
        CFWriteStreamSetProperty(writeStream,
                                 kCFStreamPropertyShouldCloseNativeSocket,
                                 kCFBooleanTrue);*/
    NSLog(@"2 partie");
    inputStream = (NSInputStream *)readStream;
    outputStream = (NSOutputStream *)writeStream;
    
    [inputStream retain];
    [outputStream retain];
    
    NSLog(@"3 partie");
    
    [inputStream setDelegate:self];
    [outputStream setDelegate:self];
    
    [inputStream scheduleInRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
    [outputStream scheduleInRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode ];
    
    [inputStream open];
    [outputStream open];
    
}

- (void)stream:(NSStream *)stream handleEvent:(NSStreamEvent)eventCode {
   
    NSMutableArray *_data;
    NSLog(@"stream:handleEvent: is invoked...");
    
    switch(eventCode) {
        
        
        case NSStreamEventEndEncountered:
            [stream close];
            [stream removeFromRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
            NSLog(@"Problem with Server");
            break;
            
        case NSStreamEventHasBytesAvailable: ;
            NSLog(@"Read Input NSStreamEventHasBytesAvailable");
            
            if(!_data) {
                _data = [[NSMutableData data] retain];
            }
            uint8_t buf[1024];
            unsigned int len = 0;
            len = [(NSInputStream *)stream read:buf maxLength:1024];
            if(len) {
                [_data appendBytes:(const void *)buf length:len];
                [bytesRead setIntValue:[bytesRead intValue]+len];
            } else {
                NSLog(@"no buffer!");
            }
            break;
            
        case NSStreamEventErrorOccurred:
            NSLog(@"NSStreamEventErrorOccurred.");
            NSError* error = [stream streamError];

            NSString* errorMessage = [NSString stringWithFormat:@"%@ (Code = %d)",
                                      [error localizedDescription],
                                      [error code]];
            NSLog(@"%@",errorMessage);
            break;
        
        case NSStreamEventHasSpaceAvailable:;
            
            NSLog(@"Write output NSStreamEventHasSpaceAvailable");
            NSString * string =@"OK\n";
            //[NSString stringWithFormat: @"%@\n", string];
            NSData * data = [string dataUsingEncoding:NSUTF8StringEncoding];
            [outputStream write:[data bytes] maxLength:[data length]];

            break;
            
        case NSStreamEventNone:
            [stream close];
            [stream removeFromRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
            NSLog(@"server problem");
            break;
            
        case NSStreamEventOpenCompleted:
            NSLog(@"%@ Stream Open",stream);
           
            break;
    }
}
/*- (void)closeStream:(NSStream *)stream {
    [stream close];
    [stream removeFromRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
    [stream release];
    stream = nil;
}*/

- (void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    [super dealloc];
}


@end
