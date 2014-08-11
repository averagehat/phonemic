//
//  PhonemicMacSpeechServer.m
//  CocoaSpeech
//
//  Created by Justine PORCHEROT on 8/7/14.
//  Copyright (c) 2014 Software Engineering and Media Lab. All rights reserved.
//

#import "PhonemicMacSpeechServer.h"

@implementation PhonemicMacSpeechServer

NSString * tmessage;
char * message;

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

@end
