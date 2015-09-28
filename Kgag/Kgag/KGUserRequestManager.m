//
//  KGUserRequestManager.m
//  Kgag
//
//  Created by Lart Ace Ignacio on 9/28/15.
//  Copyright (c) 2015 Lart Ace Ignacio. All rights reserved.
//

#import "KGUserRequestManager.h"

@implementation KGUserRequestManager

- (void)requestUserDetails:(NSString *)userName
             finishedBlock:(RequestFinishedBlock)finishedBlock
                errorBlock:(RequestErrorBlock)errorBlock
               cancelBlock:(RequestCancelBlock)cancelBlock
{
    RequestFinishedBlock requestFinishedBlock = ^(NSDictionary *params) {
        finishedBlock(params);
    };
    
    NSString *urlPath = [NSString stringWithFormat:urlViewUser, userName];
    
    [self apiRequestWithURL:urlPath
              requestParams:nil
                 requestTag:0
              finishedBlock:requestFinishedBlock
                 errorBlock:errorBlock
                cancelBlock:cancelBlock];
}

@end
