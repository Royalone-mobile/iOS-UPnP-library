//
//  MediaServerManager.m
//  UPnP
//
//  Created by Patrick Denney on 8/13/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "MediaServerManager.h"
#include "DDLog.h"

#ifdef DEBUG
static const int ddLogLevel = LOG_LEVEL_INFO;
#else
static const int ddLogLevel = LOG_LEVEL_WARN;
#endif

@implementation MediaServerManager

- (id)init
{
    self = [super init];
    if (self)
    {

    }
    
    return self;
}

static MediaServerManager *sharedInstance;

+ (id)sharedInstance
{
    if (!sharedInstance) 
    {
        @synchronized(self)
        {
            sharedInstance = [[self alloc] init];  
        }
    }
    return sharedInstance;
}

- (void)startMediaServer
{
    DDLogInfo(@"Starting media server...");
    [[SSDP sharedInstance] setUUID:@"cc93dae6-6b8b-4260-87c9-228c36b5b0e8"];
    NSArray *services = [NSArray arrayWithObjects:@"urn:schemas-upnp-org:service:ConnectionManager:1",
                                                  @"urn:schemas-upnp-org:service:ContentDirectory:1",
                                                  @"urn:schemas-upnp-org:device:MediaServer:1",nil];
    [[SSDP sharedInstance] startServiceBroadcastWithServices:services];
    DDLogInfo(@"Media server started.");
}

- (void)stopMediaServer
{
    DDLogInfo(@"Stoping media server...");
    [[SSDP sharedInstance] stopServiceBroadcast];
    DDLogInfo(@"Media server stopped.");
}

// ************************************************************************************************
#pragma mark SSDPDelegate
// ************************************************************************************************

- (BOOL)handleServiceRequest:(NSString *)serviceRequest
{
    return NO;
}

- (void)didStartBroadcastingServices
{
    //TODO: update the UI
}

- (void)didStopBroadcastingServices
{
    //TODO: update the UI
}

- (void)errorReceivingPackets
{
    //TODO: update the UI with the error
}

- (void)errorSendingPackets
{
    //TODO: update the UI with the error
}

@end
