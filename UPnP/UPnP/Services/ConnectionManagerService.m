//
//  ConnectionManagerService.m
//  UPnP
//
//  Created by Patrick Denney on 9/28/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "ConnectionManagerService.h"
#import "SharedDefinitions.h"
#import "ConnectionManagerServiceErrorCodes.h"

@implementation ConnectionManagerService

- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

#pragma mark Public API

#pragma mark UPnPService

// The service schema (e.x. urn:schemas-upnp-org:service:WANPPPConnection:1)
- (NSString *)serviceSchema
{
    return @"urn:schemas-upnp-org:service:ConnectionManager:1";
}

// The control URL (<controlURL>) found in the device definition
// POST messages will query against the control URL to perform actions
- (NSString *)controlURL
{
    return @"/upnp/control/connection_manager";
}

// The eventing URL (<eventSubURL>) found in the device definition 
// POST messages can subscribe to state variable changes using the event URL
- (NSString *)eventURL
{
    return @"/upnp/event/connection_manager";
}

// Give a response for the specified SOAP action. 
- (NSString *)responseForControlAction:(NSString *)action
{
    
}

// Give a response for the specified SOAP event message.
- (NSString *)responseForEventVariable:(NSString *)event
{
    
}

@end
