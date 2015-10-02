//
//  KGRootViewController+TabBarTransition.m
//  Kgag
//
//  Created by Lart Ace Ignacio on 10/2/15.
//  Copyright (c) 2015 Lart Ace Ignacio. All rights reserved.
//

#import "KGRootViewController+TabBarTransition.h"

static const CGFloat kKGTabBarAnimationDuration = 1.0f;

@implementation KGRootViewController (TabBarTransition)

- (IBAction)tabBarAnimationButtonAction:(id)sender
{
    CGRectGetMinY(self.tabBarView.frame) == CGRectGetMaxY(self.view.frame) ? [self showTabBar] : [self hideTabBar];
}

- (void)showTabBar
{
    [UIView animateWithDuration:kKGTabBarAnimationDuration
                     animations:^{
                         CGFloat tabBarHeight = CGRectGetHeight(self.tabBarView.frame);
                         
                         CGRect tabBarFrame = self.tabBarView.frame;
                         tabBarFrame.origin.y = CGRectGetMinY(tabBarFrame) - tabBarHeight;
                         self.tabBarView.frame = tabBarFrame;
                         
                         CGRect tabBarTransitionButtonFrame = self.tabBarAnimationButton.frame;
                         tabBarTransitionButtonFrame.origin.y = CGRectGetMinY(tabBarTransitionButtonFrame) - tabBarHeight;
                         self.tabBarAnimationButton.frame = tabBarTransitionButtonFrame;
                     }];
}

- (void)hideTabBar
{
    [UIView animateWithDuration:kKGTabBarAnimationDuration
                     animations:^{
                         CGFloat tabBarHeight = CGRectGetHeight(self.tabBarView.frame);
                         
                         CGRect tabBarFrame = self.tabBarView.frame;
                         tabBarFrame.origin.y = CGRectGetMinY(tabBarFrame) + tabBarHeight;
                         self.tabBarView.frame = tabBarFrame;
                         
                         CGRect tabBarTransitionButtonFrame = self.tabBarAnimationButton.frame;
                         tabBarTransitionButtonFrame.origin.y = CGRectGetMinY(tabBarTransitionButtonFrame) + tabBarHeight;
                         self.tabBarAnimationButton.frame = tabBarTransitionButtonFrame;
                     }];
}

@end
