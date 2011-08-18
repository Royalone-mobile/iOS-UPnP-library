//
//  MediaServerManager.h
//  UPnP
//
//  Created by Patrick Denney on 8/13/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#include "SSDP.h"

@interface MediaServerManager : NSObject <SSDPDelegate>
{

}

+ (id)sharedInstance;

// Loads up the protocol stack and starts broadcasting the media server.
- (void)startMediaServer;

// Breaks down the protocol stack and sends the appropriate messages, stopping the media server.
- (void)stopMediaServer;

@end
