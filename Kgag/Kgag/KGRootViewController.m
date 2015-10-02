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

@interface KGRootViewController ()

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

@end
