//
//  KGRootViewController.m
//  Kgag
//
//  Created by Lart Ace Ignacio on 9/19/15.
//  Copyright (c) 2015 Lart Ace Ignacio. All rights reserved.
//

#import "KGRootViewController.h"
#import "AppDelegate.h"
#import "KGLoginViewController.h"

@interface KGRootViewController ()
@property (strong, nonatomic) IBOutlet UITabBar *tabBarView;
@property (strong, nonatomic) IBOutlet UIButton *tabBarAnimationButton;

@end

@implementation KGRootViewController

- (id)init
{
    self = [super init];
    
    if (self)
    {
     
    }
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - IBActions
- (IBAction)logOutButtonAction:(id)sender
{
    [[AppDelegate sharedAppDelegate] setApplicationAccount:nil];
    [[AppDelegate sharedAppDelegate] showLoginViewController];
}

- (IBAction)tabBarViewButton:(id)sender
{
    CGRectGetMinY(self.tabBarView.frame) == CGRectGetMaxY(self.view.frame) ? [self showTabBar] : [self hideTabBar];
}

- (void)showTabBar
{
    [UIView animateWithDuration:1.0f
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
    [UIView animateWithDuration:1.0f
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
