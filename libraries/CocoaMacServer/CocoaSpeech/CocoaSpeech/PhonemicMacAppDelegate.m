//
//  PhonemicMacAppDelegate.m
//  CocoaSpeech
//
//  Created by Justine PORCHEROT on 8/6/14.
//  Copyright (c) 2014 Software Engineering and Media Lab. All rights reserved.
//

#import "PhonemicMacAppDelegate.h"
#import <Foundation/Foundation.h>
#import "PhonemicMacSpeechFunction.h"
#import "PhonemicMacSpeechServer.h"
#import "PhonemicMacConnection.h"



@implementation PhonemicMacAppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    PhonemicMacSpeechServer *server;
    server = [[PhonemicMacSpeechServer alloc] initWithPortNumber:56101 delegate:self];
    
    PhonemicMacSpeechServer *socket = [[PhonemicMacSpeechServer alloc]init];
    [socket newConnection:56101]; 
   
    
   
    
    
    /* NSArray * listInformation = [[NSArray alloc]init];
    
    NSString* message = @"speak:0:0:Hello everybody";
    
    listInformation =[PhonemicMacSpeechServer separateMessage:message];
    
    
    if ([[listInformation objectAtIndex:0] isEqual: @"speak"] && [[listInformation objectAtIndex:2] isEqual: @"0"])
    {
        [PhonemicMacSpeechFunction speak];
    }
    
    if ([[listInformation objectAtIndex:0] isEqual: @"pause"] && [[listInformation objectAtIndex:2] isEqual: @"0"]){
        
        [PhonemicMacSpeechFunction pause];
    }
    
    if ([[listInformation objectAtIndex:0] isEqual: @"stop"] && [[listInformation objectAtIndex:2] isEqual: @"0"]){
        
        [PhonemicMacSpeechFunction stop];
    }
    
    if ([[listInformation objectAtIndex:0] isEqual: @"setVoice"] && [[listInformation objectAtIndex:2] isEqual: @"0"]){
        
        [PhonemicMacSpeechFunction setVoice:[listInformation objectAtIndex:3]];
    }
    
    if ([[listInformation objectAtIndex:0] isEqual: @"setVolume"] && [[listInformation objectAtIndex:2] isEqual: @"0"]){
        
        double_t volume = [[listInformation objectAtIndex:3] doubleValue];
        [PhonemicMacSpeechFunction setVolume: volume];
    }
    
    if ([[listInformation objectAtIndex:0] isEqual: @"setSpeed"] && [[listInformation objectAtIndex:2] isEqual: @"0"]){
        
        double_t speed = [[listInformation objectAtIndex:3] doubleValue];
        [PhonemicMacSpeechFunction setSpeed: speed];
    }
    
    
    if ([[listInformation objectAtIndex:0] isEqual: @"reinitialize"] && [[listInformation objectAtIndex:2] isEqual: @"0"]){
        
        [PhonemicMacSpeechFunction reinitialize];
    }
    
    
    if ([[listInformation objectAtIndex:0] isEqual: @"isSpeaking"] && [[listInformation objectAtIndex:2] isEqual: @"0"]){
        
        BOOL isSpeaking =[PhonemicMacSpeechFunction isSpeaking];
    }
    
    
    if ([[listInformation objectAtIndex:0] isEqual: @"getCurrentVoice"] && [[listInformation objectAtIndex:2] isEqual: @"0"]){
        
        NSString* currentVoice =[PhonemicMacSpeechFunction getCurrentVoice];
    }
    
    if ([[listInformation objectAtIndex:0] isEqual: @"getVolume"] && [[listInformation objectAtIndex:2] isEqual: @"0"]){
        
        int volume =[PhonemicMacSpeechFunction getVolume];
    }
    
    if ([[listInformation objectAtIndex:0] isEqual: @"getVersion"] && [[listInformation objectAtIndex:2] isEqual: @"0"]){
        
        int version =[PhonemicMacSpeechFunction getVersion];
    }*/
}


@end
