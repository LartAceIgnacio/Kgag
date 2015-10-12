//
//  KGGag.h
//  Kgag
//
//  Created by Lart Ace Ignacio on 07/10/2015.
//  Copyright © 2015 Lart Ace Ignacio. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KGGag : NSObject

@property NSUInteger identity;
@property NSString *message;

- (id)initWithDictionary:(NSDictionary *)dictionary;

@end
