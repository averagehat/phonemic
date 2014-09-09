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
    
    NSString* message = @"speak:MEDIUM_HIGH:0:Hello everybody how are you doing ?";
    NSString* message2 = @"speak:HIGH:0:My name is Justine";
    //NSString* message3 = @"speak:HIGHEST:0:Hello everybody";
    NSArray * informationList2 = [[NSArray alloc]init];
    //NSArray * informationList3 = [[NSArray alloc]init];
    
    informationList =[PhonemicMacSpeechServer separateMessage:message];
    informationList2 =[PhonemicMacSpeechServer separateMessage:message2];
    //informationList3 =[PhonemicMacSpeechServer separateMessage:message3];
    
    NSArray * emptyList = [[NSArray alloc]initWithObjects:@"Empty", @"NULL", nil];
    [waitingList addObject:emptyList];
    
    [waitingList insertObject:informationList2 atIndex:0];
    //[waitingList insertObject:informationList3 atIndex:0];

    
    
    
    /* FOR TEST
    for (int nb=0; nb<[waitingList count]; nb++)
    {
        NSLog(@"action : %@",[waitingList objectAtIndex:nb]);
    }*/
    
    NSString * myVariable =[informationList objectAtIndex:0];
    NSString * myPriority =[informationList objectAtIndex:1];
    NSString * emptyCondition =[waitingList objectAtIndex:0];
    BOOL isSpeaking = YES;

    /* **************************************** Priority Part ************************************** */
    
    
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
            do {
               isSpeaking =[PhonemicMacSpeechFunction isSpeaking];
            }
            while (isSpeaking == YES);
        }
        
        else if ([myPriority isEqualTo: @"HIGHEST"])
        {
            NSString * object = [[waitingList objectAtIndex:0] objectAtIndex:1];
            NSString * object2 = [[waitingList objectAtIndex:0] objectAtIndex:0];

            if ([object isEqualTo:@"HIGH"] || [object isEqualTo:@"MEDIUM_HIGH"] || [object isEqualTo:@"MEDIUM"] || [object isEqualTo:@"MEDIUM_LOW"] || [object isEqualTo:@"LOW"] || [object isEqualTo:@"LOWEST"] || [object2 isEqualTo:@"Empty"])
            {
                 [waitingList insertObject:informationList atIndex:0];
                
            }
            else
            {
                [informationList release];
            }
        }
        
        else if ([myPriority isEqualTo: @"HIGH"])
        {
            NSString * object = [[waitingList objectAtIndex:0] objectAtIndex:1];
            NSString * object2 = [[waitingList objectAtIndex:0] objectAtIndex:0];
            
            if ([object isEqualTo:@"MEDIUM_HIGH"] || [object isEqualTo:@"MEDIUM"] || [object isEqualTo:@"MEDIUM_LOW"] || [object isEqualTo:@"LOW"] || [object isEqualTo:@"LOWEST"] || [object2 isEqualTo:@"Empty"])
            {
               [waitingList insertObject:informationList atIndex:0];
            }
            else
            {
                [informationList release];
            }
        }
        
        else if ([myPriority isEqualTo: @"MEDIUM_HIGH"])
        {
            NSString * object = [[waitingList objectAtIndex:0] objectAtIndex:1];
            NSString * object2 = [[waitingList objectAtIndex:0] objectAtIndex:0];
            
            if ([object isEqualTo:@"MEDIUM"] || [object isEqualTo:@"MEDIUM_LOW"] || [object isEqualTo:@"LOW"] || [object isEqualTo:@"LOWEST"] || [object2 isEqualTo:@"Empty"])
            {
                [waitingList replaceObjectAtIndex:0 withObject:informationList];
            }
            else
            {
                [informationList release];
            }
        }
        
        else if ([myPriority isEqualTo: @"MEDIUM"])
        {
            NSString * object = [[waitingList objectAtIndex:0] objectAtIndex:1];
            NSString * object2 = [[waitingList objectAtIndex:0]objectAtIndex:0];
            
            if ([object isEqualTo:@"MEDIUM_LOW"] || [object isEqualTo:@"LOW"] || [object isEqualTo:@"LOWEST"] || [object2 isEqualTo:@"Empty"])
            {
                [waitingList insertObject:informationList atIndex:0];
            }
            else
            {
                [informationList release];
            }
        }

        else if ([myPriority isEqualTo: @"MEDIUM_LOW"])
        {
                    NSString * object = [[waitingList objectAtIndex:0] objectAtIndex:1];
                    NSString * object2 = [[waitingList objectAtIndex:0]objectAtIndex:0];
                    
                    if ([object isEqualTo:@"LOW"] || [object isEqualTo:@"LOWEST"] || [object2 isEqualTo:@"Empty"])
                    {
                        [waitingList insertObject:informationList atIndex:0];
                    }
                    else
                    {
                        [informationList release];
                    }
        }
        
        else if ([myPriority isEqualTo: @"LOW"])
        {
            NSString * object = [[waitingList objectAtIndex:0] objectAtIndex:1];
            NSString * object2 = [[waitingList objectAtIndex:0] objectAtIndex:0];
            
            if ([object isEqualTo:@"LOWEST"] || [object2 isEqualTo:@"Empty"])
            {
                [waitingList insertObject:informationList atIndex:0];
            }
            else
            {
                [informationList release];
            }
        }
        
        else if([myPriority isEqualTo:@"LOWEST"])
        {
            NSString * object2 = [[waitingList objectAtIndex:0] objectAtIndex:0];
            if ([object2 isEqualTo:@"Empty"])
            {
                [waitingList insertObject:informationList atIndex:0];
            }
            else
            {
                [informationList release];
            }
        }
    }
 
    /* **************************************** Command Part ************************************** */
  
    /*    if ([[[waitingList objectAtIndex:0]objectAtIndex:0] isEqualTo: @"pause"]){
            
            [PhonemicMacSpeechFunction pause];
        }
        
        else if ([[[waitingList objectAtIndex:0]objectAtIndex:0] isEqualTo: @"stop"]){
            
            [PhonemicMacSpeechFunction stop];
        }
        
        else if ([[[waitingList objectAtIndex:0]objectAtIndex:0] isEqualTo: @"setVoice"]){
            
            [PhonemicMacSpeechFunction setVoice:[[waitingList objectAtIndex:0] objectAtIndex:1]];
        }
        
        else if ([[[waitingList objectAtIndex:0]objectAtIndex:0] isEqualTo: @"setVolume"]){
            
            double_t volume = [[[waitingList objectAtIndex:0] objectAtIndex:1] doubleValue];
            [PhonemicMacSpeechFunction setVolume: volume];
        }
        
        else if ([[[waitingList objectAtIndex:0]objectAtIndex:0] isEqualTo: @"setSpeed"]){
            
            double_t speed = [[[waitingList objectAtIndex:0] objectAtIndex:1] doubleValue];
            [PhonemicMacSpeechFunction setSpeed: speed];
        }
        
        
        else if ([[[waitingList objectAtIndex:0]objectAtIndex:0] isEqualTo: @"reinitialize"]){
            
            [PhonemicMacSpeechFunction reinitialize];
        }
        
        
        else if ([[[waitingList objectAtIndex:0]objectAtIndex:0] isEqual: @"isSpeaking"]){
            
            BOOL isSpeaking =[PhonemicMacSpeechFunction isSpeaking];
        }
        
        else if ([[[waitingList objectAtIndex:0]objectAtIndex:0] isEqual: @"getCurrentVoice"]){
            
            NSString * currentVoice =[PhonemicMacSpeechFunction getCurrentVoice];
        }
        
        else if ([[[waitingList objectAtIndex:0]objectAtIndex:0] isEqual: @"getVolume"]){
            
            int volume =[PhonemicMacSpeechFunction getVolume];
        }
        
        else if ([[[waitingList objectAtIndex:0]objectAtIndex:0] isEqual: @"getVersion"] ){
            
            int version =[PhonemicMacSpeechFunction getVersion];
        }
        
        else if ([[[waitingList objectAtIndex:0]objectAtIndex:0] isEqual: @"speak"] ){
            BOOL isSpeaking = YES;
            [PhonemicMacSpeechFunction speak :[[waitingList objectAtIndex:0]objectAtIndex:3]];
        }
    
        else if ([[[waitingList objectAtIndex:0]objectAtIndex:0] isEqual: @"speakBlocking"] ){
            
            [PhonemicMacSpeechFunction speak :[[waitingList objectAtIndex:0]objectAtIndex:3]];
            
        }
        for (int nb=0; nb<[waitingList count]; nb++)
        {
            NSLog(@"action : %@",[waitingList objectAtIndex:nb]);
        }*/
    
}


@end
