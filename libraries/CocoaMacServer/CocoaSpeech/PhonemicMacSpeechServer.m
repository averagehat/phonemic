//
//  PhonemicMacSpeechServer.m
//  CocoaSpeech
//
//  Created by Justine PORCHEROT on 8/7/14.
//  Copyright (c) 2014 Software Engineering and Media Lab. All rights reserved.
//

#import "PhonemicMacSpeechServer.h"



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
    NSArray * listItems = [[NSArray alloc]init];
    
    // initialize the separator of the message
    NSCharacterSet *separator = [NSCharacterSet characterSetWithCharactersInString:@":"];
    
    // initialize the message to separate
    NSString *list = tmessage;
    
    // insert the information separated
    listItems = [list componentsSeparatedByCharactersInSet:separator];
    
    // write in the console the informations to be sure
    for (int j=0; j<[listItems count];j++) {
        NSLog(@"%d. %@\n", j, [listItems objectAtIndex:j]);
    }
    return listItems;
}

- (id)initWithPortNumber:(int)pn delegate:(id)dl{
   
        
        connections = [[NSMutableArray alloc] init];
        requests = [[NSMutableArray alloc] init];
        
        
        socketPort = [[NSSocketPort alloc] initWithTCPPort:pn];
        int fd = [socketPort socket];
        fileHandle = [[NSFileHandle alloc] initWithFileDescriptor:fd closeOnDealloc:YES];
        
        NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
        
        [fileHandle acceptConnectionInBackgroundAndNotify];
        
        NSLog(@"Socket cree");

    
    return self;
}

- (void) newConnection:(int)portNo{
    
    
    CFReadStreamRef readStream;
    CFWriteStreamRef writeStream;
    
    CFStreamCreatePairWithSocketToHost(NULL, (CFStringRef)@"localhost", portNo, &readStream, &writeStream);
    
    inputStream = (__bridge NSInputStream *)readStream;
    outputStream = (__bridge NSOutputStream *)writeStream;
    
    
    [inputStream setDelegate:self];
    [outputStream setDelegate:self];
    
    /*[inputStream sheduleInRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
    [outputStream sheduleInRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];*/
    
    [inputStream open];
    [outputStream open];
    
    CFReadStreamSetProperty(readStream, kCFStreamPropertyShouldCloseNativeSocket, kCFBooleanTrue);
    
    CFWriteStreamSetProperty(writeStream, kCFStreamPropertyShouldCloseNativeSocket, kCFBooleanTrue);
    
   
    
    
    
}

/*
- (id) start{
    
    CFStringRef hostname;
    CFHost host;
    host  = CFHostCreateWithName (kCFAllocDefault, hostname);
    
    CFSocketRef socket;
    CFReadStreamRef readStream;
    CFWriteStreamRef writeStream;
    socket = CFSocketCreate(kCFAllocatorDefault, <#SInt32 protocolFamily#>, <#SInt32 socketType#>, <#SInt32 protocol#>, <#CFOptionFlags callBackTypes#>, <#CFSocketCallBack callout#>, <#const CFSocketContext *context#>)
    socket = CFStreamCreatePairWithSocket(kCFAllocatorDefault, <#CFSocketNativeHandle sock#>, readStream , writeStream);
    
    socketPort = [[NSSocketPort alloc] initWithTCPPort:portNumber];
    int fileDescriptor = [socketPort socket];
    
    listeningHandle = [[NSFileHandle alloc] initWithFileDescriptor:fileDescriptor closeOnDealloc:YES];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(receiveIncomingConnectionNotification:)
                name:NSFileHandleConnectionAcceptedNotification
                object:nil];
    
    [listeningHandle acceptConnectionInBackgroundAndNotify];
    return
}

- (id) receiveIncomingDataNotification{
    if (CFHTTPMessageIsHeaderComplete(incomingRequest)) {
        NSFileHandle *handler = NSFileHandleNotificationDataItem;
        
    }
}*/


- (void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}


@end
