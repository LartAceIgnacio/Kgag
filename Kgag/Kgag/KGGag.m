//
//  KGGag.m
//  Kgag
//
//  Created by Lart Ace Ignacio on 07/10/2015.
//  Copyright © 2015 Lart Ace Ignacio. All rights reserved.
//

#import "KGGag.h"

@implementation KGGag

- (id)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    
    if (self)
    {
        self.identity = [[dictionary objectForKey:@"id"] integerValue];
        self.message = [dictionary objectForKey:@"message"];
    }
    
    return self;
}

@end
