//
//  ContentDirectoryContainer.m
//  UPnP
//
//  Created by Patrick Denney on 8/21/11.
//

#import "ContentDirectoryContainer.h"
#import "NSString+UPnP.h"

@implementation ContentDirectoryContainer

@synthesize searchClass = _searchClass;
@synthesize createClass = _createClass;
@synthesize isSearchable = _isSearchable;
@synthesize childCount = _childCount;

- (id)initObjectFromDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if (self) 
    {
        [self setValuesForKeysWithDictionary:dictionary]; 
    }
    
    return self;
}

- (NSString *)xmlRepresentation:(NSString *)childElement
{
    NSString *containerTag = [NSString stringWithFormat:@"<container id=\"%@\" parentID=\"%@\" childCount=\"%i\" restricted=\"%@\">",
                              self.id,
                              self.parentId,
                              self.childCount,
                              [NSString convertFromBool:self.isRestricted]];
    
    NSString *titleTag = [NSString stringWithFormat:@"<dc:title>%@</dc:title>", self.title];
    return [NSString stringWithFormat:@"%@%@%@</container>",containerTag, titleTag, childElement];
}

- (void)dealloc
{
    self.searchClass = nil;
    self.createClass = nil;
    
    [super dealloc];
}

@end
