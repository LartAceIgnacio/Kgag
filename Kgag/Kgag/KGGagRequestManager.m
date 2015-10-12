//
//  KGGagRequestManager.m
//  Kgag
//
//  Created by Lart Ace Ignacio on 07/10/2015.
//  Copyright © 2015 Lart Ace Ignacio. All rights reserved.
//

#import "KGGagRequestManager.h"

@implementation KGGagRequestManager

- (void)requestGagList:(RequestFinishedBlock)finishedBlock
            errorBlock:(RequestErrorBlock)errorBlock
           cancelBlock:(RequestCancelBlock)cancelBlock
{
    RequestFinishedBlock requestFinishedBlock = ^(NSDictionary *params) {
        [self setPaginationParameters:params];
        finishedBlock(params);
    };
    
    NSDictionary *requestParameters = [NSDictionary dictionaryWithObject:[NSNumber numberWithInteger:self.nextPage] forKey:@"page"];
    
    [self apiRequestWithURL:urlViewGags
              requestParams:requestParameters
                 requestTag:0
              finishedBlock:requestFinishedBlock
                 errorBlock:errorBlock
                cancelBlock:cancelBlock];
}

@end
