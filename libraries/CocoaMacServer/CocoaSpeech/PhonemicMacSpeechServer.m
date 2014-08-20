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
    
    
            NSLog(@"Start connection");
    
            socketPort = [[NSSocketPort alloc] initWithTCPPort:pn];
            int fd = [socketPort socket];
            fileHandle = [[NSFileHandle alloc] initWithFileDescriptor:fd closeOnDealloc:YES];
    
            [[NSNotificationCenter defaultCenter] addObserver:self
                                                     selector:@selector(newConnection:)
                                                                name:NSFileHandleConnectionAcceptedNotification
                                                                    object:fileHandle];
    
            [fileHandle acceptConnectionInBackgroundAndNotify];
    
            NSLog(@"Socket cree");
    
        
            return self;
    }
    
- (void) newConnection:(NSString *)path{
    
    NSLog(@"Connection accpeted");
    
    CFReadStreamRef readStream;
    CFWriteStreamRef writeStream;
    
    NSLog(@"1 partie");
    CFStreamCreatePairWithSocketToHost(NULL, (CFStringRef)@"localhost", 56101, &readStream, &writeStream);
   
    
    NSLog(@"2 partie");
    inputStream = (NSInputStream *)readStream;
    outputStream = (NSOutputStream *)writeStream;
    
    NSLog(@"3 partie");
    
    [inputStream setDelegate:self];
    [outputStream setDelegate:self];
    
    [inputStream scheduleInRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
    [outputStream scheduleInRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
    
    [inputStream open];
    [outputStream open];
    
    NSLog(@"write output 1");
    
    NSString * string =@"OK";
    NSData * data = [string dataUsingEncoding:NSUTF8StringEncoding];
    [outputStream write:[data bytes] maxLength:[data length]];
    
    
    
    
    
   /* NSLog(@"Start Listening");
    uint8_t buffer[1024];
    NSInteger len;
    NSMutableString *total = [[NSMutableString alloc]init];
    while([inputStream hasBytesAvailable])
    {
        len = [inputStream read:buffer maxLength:sizeof(buffer)];
        if (len>0) {
            [total appendString:[[NSString alloc] initWithBytes:buffer length:len encoding:NSASCIIStringEncoding]];
        }
    }*/

    
    /*[inputStream close];
    [outputStream close];*/
    
}

- (void)stream:(NSStream *)stream handleEvent:(NSStreamEvent)eventCode {
    
    switch(eventCode) {
        
        case NSStreamEventEndEncountered:
            [stream close];
            [stream removeFromRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
            NSLog(@"Problem with Server");
            break;
            
        case NSStreamEventHasBytesAvailable: ;
            NSLog(@"Read Input ");
            uint8_t buffer[100];
            NSUInteger lenght = [inputStream read:buffer maxLength:sizeof(buffer)];
            NSString *resultat = [[NSString alloc] initWithBytes:buffer length:lenght encoding:NSASCIIStringEncoding];
            if (nil != resultat) {
                NSLog(@"Server said :%@", resultat);
                
            }
            NSLog(@"%@",resultat);
            break;
            
        case NSStreamEventErrorOccurred:
            NSLog(@"Can connect to the server.");
            break;
        
        case NSStreamEventHasSpaceAvailable:;
            NSLog(@"write output 2");
            
            NSString * string =@"OK";
            NSData * data = [string dataUsingEncoding:NSUTF8StringEncoding];
            [outputStream write:[data bytes] maxLength:[data length]];
            break;
            
        case NSStreamEventNone:
            [stream close];
            [stream removeFromRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
            NSLog(@"server problem");
            break;
            
        case NSStreamEventOpenCompleted:;
            NSLog(@"%@ Stream Open",stream);
            break;
            
            
    }
}
- (void)closeStream:(NSStream *)stream {
    [stream close];
    [stream removeFromRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
    [stream release];
    stream = nil;
}

/*- (id)startListening:(NSString *)path{
   
    NSLog(@"Start Listening");
    uint8_t buffer[1024];
    NSInteger len;
    NSMutableString *total = [[NSMutableString alloc]init];
    while([inputStream hasBytesAvailable])
    {
        len = [inputStream read:buffer maxLength:sizeof(buffer)];
        if (len>0) {
            [total appendString:[[NSString alloc] initWithBytes:buffer length:len encoding:NSASCIIStringEncoding]];
        }
    }
    
    
    NSLog(@"%@",total);
    return total;

}*/

/*- (id) receiveIncomingDataNotification{
    if (CFHTTPMessageIsHeaderComplete(inputStream)) {
        NSFileHandle *handler = NSFileHandleNotificationDataItem;
        
    }
}*/


- (void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    [super dealloc];
}


@end
