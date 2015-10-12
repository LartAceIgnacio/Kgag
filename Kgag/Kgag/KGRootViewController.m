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
#import "KGRootViewController+TabBarTransition.h"
#import "KGTopViewController.h"

@interface KGRootViewController () <UINavigationControllerDelegate>

@property (nonatomic, strong) UINavigationController *contentNavigationController;

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
    
    KGTopViewController *topViewController = [[KGTopViewController alloc] init];
    [self setTabBarViewController:topViewController];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setTabBarViewController:(UIViewController *)viewController
{
    [self.contentNavigationController.view removeFromSuperview];
    self.contentNavigationController = nil;
    
    self.contentNavigationController = [[UINavigationController alloc] initWithRootViewController:viewController];
    self.contentNavigationController.view.frame = self.contentView.bounds;
    self.contentNavigationController.delegate = self;
    [self.navigationController.navigationBar setTranslucent:NO];
    
    [self.contentView addSubview:self.contentNavigationController.view];
    
    CATransition *animation = [CATransition animation];
    animation.type = kCATransitionFade;
    [self.contentView.layer addAnimation:animation forKey:nil];
}

#pragma mark - IBActions
- (IBAction)logOutButtonAction:(id)sender
{
    [[AppDelegate sharedAppDelegate] setApplicationAccount:nil];
    [[AppDelegate sharedAppDelegate] showLoginViewController];
}

@end
