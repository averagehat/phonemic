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
    
    
    server = [[PhonemicMacSpeechServer alloc] initWithPortNumber:56103 delegate:self];
    
    
   
    
    NSArray * informationList = [[NSArray alloc]init];
    NSMutableArray * waitingList = [[NSMutableArray alloc]init];
    
    NSString* message = @"speak:MEDIUM_HIGH:0:Hello everybody";
    NSString* message2 = @"speak:LOWEST:0:Hello everybody";
    NSString* message3 = @"speak:HIGHEST:0:Hello everybody";
    NSArray * informationList2 = [[NSArray alloc]init];
    NSArray * informationList3 = [[NSArray alloc]init];
    
    informationList =[PhonemicMacSpeechServer separateMessage:message];
    informationList2 =[PhonemicMacSpeechServer separateMessage:message2];
    informationList3 =[PhonemicMacSpeechServer separateMessage:message3];
    
    NSArray * emptyList = [[NSArray alloc]initWithObjects:@"Empty", @"NULL", nil];
    [waitingList addObject:emptyList];
    
    [waitingList insertObject:informationList2 atIndex:0];
    [waitingList insertObject:informationList3 atIndex:0];

    
    
    
    
    for (int nb=0; nb<[waitingList count]; nb++)
    {
        NSLog(@"action : %@",[waitingList objectAtIndex:nb]);
    }
    
    NSString * myVariable =[informationList objectAtIndex:0];
    NSString * myPriority =[informationList objectAtIndex:1];
    NSString * emptyCondition =[waitingList objectAtIndex:0];

    if ([myVariable  isNotEqualTo:@"speak"] && [myVariable isNotEqualTo:@"speakBlocking"])
    {
        if ([emptyCondition isEqualTo:@"Empty"])
        {
            [waitingList insertObject:informationList atIndex:0];
        }
        else
        {
            [waitingList insertObject:informationList atIndex:[waitingList count]-1];
            
        }
        
        for (int nb=0; nb<[waitingList count]; nb++)
         {
         NSLog(@"action : %@",[waitingList objectAtIndex:nb]);
         }
        
    }
    else if ([myVariable isEqualToString:@"speak"] || [myVariable isEqualToString:@"speakBlocking"])
    {
        if ([emptyCondition isEqualTo:@"Empty"])
        {
             [waitingList insertObject:informationList atIndex:0];
        }
        else if ([myPriority isEqualTo:@"BLOCKING"])
        {
            [waitingList insertObject:informationList atIndex:0];
        }
        else if ([myPriority isEqualTo: @"HIGHEST"])
        {
            NSString * priority = nil;
            int index = 0;
            int i=0;
             do{
                
                    NSString * object = [[waitingList objectAtIndex:i] objectAtIndex:1];
                    NSString * object2 = [[waitingList objectAtIndex:i] objectAtIndex:0];
                 
                 if ([object isEqualTo:@"HIGH"] || [object isEqualTo:@"MEDIUM_HIGH"] || [object isEqualTo:@"MEDIUM"] || [object isEqualTo:@"MEDIUM_LOW"] || [object isEqualTo:@"LOW"] || [object isEqualTo:@"LOWEST"] || [object2 isEqualTo:@"Empty"])
                    {
                        priority = @"HIGHEST";
                        
                    }
                    else
                    {
                        priority = @"NULL";
                    }
                 i++;
            }
            while ([priority isNotEqualTo:@"HIGHEST"]);
            index = i-1;
        
            // on insere l'instruction
            [waitingList insertObject:informationList atIndex:index];
        }
        else if ([myPriority isEqualTo: @"HIGH"])
        {
            NSString * priority = nil;
            int index =0;
            int i=0;
            
            do{
                NSString * object = [[waitingList objectAtIndex:i] objectAtIndex:1];
                NSString * object2 = [[waitingList objectAtIndex:i] objectAtIndex:0];
                
                if ([object isEqualTo:@"MEDIUM_HIGH"] || [object isEqualTo:@"MEDIUM"] || [object isEqualTo:@"MEDIUM_LOW"] || [object isEqualTo:@"LOW"] || [object isEqualTo:@"LOWEST"] || [object2 isEqualTo:@"Empty"])
                    {
                        priority = @"HIGH";
                        
                    }
                    else
                    {
                        priority = @"NULL";
                    }
                    i++;
            }
            while ([priority isNotEqualTo:@"HIGH"]);
            index = i-1;
            // on insere l'instruction
            [waitingList insertObject:informationList atIndex:index];
            
        }
        else if ([myPriority isEqualTo: @"MEDIUM_HIGH"])
        {
            NSString * priority = nil;
            int index =0;
            int i=0;
            do{
                
                    NSString * object = [[waitingList objectAtIndex:i] objectAtIndex:1];
                    NSString * object2 = [[waitingList objectAtIndex:i] objectAtIndex:0];
                    
                    if ([object isEqualTo:@"MEDIUM"] || [object isEqualTo:@"MEDIUM_LOW"] || [object isEqualTo:@"LOW"] || [object isEqualTo:@"LOWEST"] || [object2 isEqualTo:@"Empty"])
                    {
                        priority = @"MEDIUM_HIGH";
                        
                    }
                    else
                    {
                        priority = @"NULL";
                    }
                i++;

            }
            while ([priority isNotEqualTo:@"MEDIUM_HIGH"]);
            index = i-1;
            // on insere l'instruction
            [waitingList insertObject:informationList atIndex:index];
        }
        else if ([myPriority isEqualTo: @"MEDIUM"])
        {
            NSString * priority = @"NULL";
            int index=0;
            int i=0;
            
             do {
                    NSString * object = [[waitingList objectAtIndex:i] objectAtIndex:1];
                    NSString * object2 = [[waitingList objectAtIndex:i]objectAtIndex:0];
                    
                    if ([object isEqualTo:@"MEDIUM_LOW"] || [object isEqualTo:@"LOW"] || [object isEqualTo:@"LOWEST"] || [object2 isEqualTo:@"Empty"])
                    {
                        priority = @"MEDIUM";
                        
                    }
                    else
                    {
                        priority = @"NULL";
                    }
                 i++;
            }
            while ([priority  isNotEqualTo:@"MEDIUM"]);
            index = i-1;
            // on insere l'instruction
            [waitingList insertObject:informationList atIndex:index];
            
        }
        else if ([myPriority isEqualTo: @"MEDIUM_LOW"])
        {
            NSString * priority = @"NULL";
            int index=0;
            int i=0;
            
            do {
                
                    NSString * object = [[waitingList objectAtIndex:i] objectAtIndex:1];
                    NSString * object2 = [[waitingList objectAtIndex:i]objectAtIndex:0];
                    
                    if ([object isEqualTo:@"LOW"] || [object isEqualTo:@"LOWEST"] || [object2 isEqualTo:@"Empty"])
                    {
                        priority = @"MEDIUM-LOW";
                        
                    }
                    else
                    {
                        priority = @"NULL";
                    }
                i++;
            }
            while ([priority isNotEqualTo:@"MEDIUM_LOW"]);
            index = i-1;
            
            // on insere l'instruction
            [waitingList insertObject:informationList atIndex:index];
        }
        else if ([myPriority isEqualTo: @"LOW"])
        {
            NSString * priority = nil;
            int index =0;
            int i=0;
            
            do{
                    NSString * object = [[waitingList objectAtIndex:i] objectAtIndex:1];
                    NSString * object2 = [[waitingList objectAtIndex:i] objectAtIndex:0];
                    
                    if ([object isEqualTo:@"LOWEST"] || [object2 isEqualTo:@"Empty"])
                    {
                        priority = @"LOW";
                        
                    }
                    else
                    {
                        priority = @"NULL";
                    }
                i++;
            }
            while ([priority isNotEqualTo:@"LOW"]);
            index = i-1;
            // on insere l'instruction
            [waitingList insertObject:informationList atIndex:index];
            
        }
        else if([myPriority isEqualTo:@"LOWEST"])
        {
            [waitingList insertObject:informationList atIndex:[waitingList count]-1];
        }
            
        for (int nb=0; nb<[waitingList count]; nb++)
        {
            NSLog(@"action : %@",[waitingList objectAtIndex:nb]);
        }

    }
    
    
    
   
    /*for (int i=0; i<=[waitingList count]; i++)
    {
        if ([[[waitingList objectAtIndex:i]objectAtIndex:0] isEqualTo: @"pause"]){
            
            [PhonemicMacSpeechFunction pause];
        }
        
        else if ([[[waitingList objectAtIndex:i]objectAtIndex:0] isEqualTo: @"stop"]){
            
            [PhonemicMacSpeechFunction stop];
        }
        
        else if ([[[waitingList objectAtIndex:i]objectAtIndex:0] isEqualTo: @"setVoice"]){
            
            [PhonemicMacSpeechFunction setVoice:[informationList objectAtIndex:1]];
        }
        
        else if ([[[waitingList objectAtIndex:i]objectAtIndex:0] isEqualTo: @"setVolume"]){
            
            double_t volume = [[informationList objectAtIndex:1] doubleValue];
            [PhonemicMacSpeechFunction setVolume: volume];
        }
        
        else if ([[[waitingList objectAtIndex:i]objectAtIndex:0] isEqualTo: @"setSpeed"]){
            
            double_t speed = [[informationList objectAtIndex:1] doubleValue];
            [PhonemicMacSpeechFunction setSpeed: speed];
        }
        
        
        else if ([[[waitingList objectAtIndex:i]objectAtIndex:0] isEqualTo: @"reinitialize"]){
            
            [PhonemicMacSpeechFunction reinitialize];
        }
        
        
        else if ([[[waitingList objectAtIndex:i]objectAtIndex:0] isEqual: @"isSpeaking"]){
            
            BOOL isSpeaking =[PhonemicMacSpeechFunction isSpeaking];
        }
        
        else if ([[[waitingList objectAtIndex:i]objectAtIndex:0] isEqual: @"getCurrentVoice"]){
            
            NSString* currentVoice =[PhonemicMacSpeechFunction getCurrentVoice];
        }
        
        else if ([[[waitingList objectAtIndex:i]objectAtIndex:0] isEqual: @"getVolume"]){
            
            int volume =[PhonemicMacSpeechFunction getVolume];
        }
        
        else if ([[[waitingList objectAtIndex:i]objectAtIndex:0] isEqual: @"getVersion"] ){
            
            int version =[PhonemicMacSpeechFunction getVersion];
        }
        
        else if ([[[waitingList objectAtIndex:i]objectAtIndex:0] isEqual: @"speak"] ){
            
            [PhonemicMacSpeechFunction speak :[[waitingList objectAtIndex:0]objectAtIndex:3]];
        }
        
        else if ([[[waitingList objectAtIndex:i]objectAtIndex:0] isEqual: @"speakBlocking"] ){
            
            [PhonemicMacSpeechFunction speak :[[waitingList objectAtIndex:0]objectAtIndex:3]];
        }
    }*/
    
}


@end
