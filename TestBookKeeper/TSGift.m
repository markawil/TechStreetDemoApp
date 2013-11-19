//
//  TSGift.m
//  TestBookKeeper
//
//  Created by markw on 11/18/13.
//  Copyright (c) 2013 markw. All rights reserved.
//

#import "TSGift.h"

@implementation TSGift

- (NSString *)description {
    
    return self.name;    
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    
    self = [super init];
    if (self != nil) {
        _name = [aDecoder decodeObjectForKey:@"name"];
        _urlPath = [aDecoder decodeObjectForKey:@"urlPath"];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    
    [aCoder encodeObject:self.name forKey:@"name"];
    [aCoder encodeObject:self.urlPath forKey:@"urlPath"];
}

@end
