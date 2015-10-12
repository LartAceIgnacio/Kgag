//
//  KGGagCell.h
//  Kgag
//
//  Created by Lart Ace Ignacio on 07/10/2015.
//  Copyright © 2015 Lart Ace Ignacio. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KGTableViewCell.h"
#import "KGGag.h"

@interface KGGagCell : KGTableViewCell

@property (strong, nonatomic) IBOutlet UITextView *textView;

- (void)setGagCell:(KGGag *)gag;

@end
