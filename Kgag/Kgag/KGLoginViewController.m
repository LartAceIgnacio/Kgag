//
//  KGLoginViewController.m
//  Kgag
//
//  Created by Lart Ace Ignacio on 9/19/15.
//  Copyright (c) 2015 Lart Ace Ignacio. All rights reserved.
//

#import "KGLoginViewController.h"
#import "KGRegisterViewController.h"
#import "AppDelegate.h"

@interface KGLoginViewController ()

@property (weak, nonatomic) IBOutlet UITextField *userNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;

@end

@implementation KGLoginViewController

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
- (IBAction)loginButtonAction:(id)sender
{
    [[AppDelegate sharedAppDelegate] setApplicationAccount:self.userNameTextField.text];
    [[AppDelegate sharedAppDelegate] showHomeViewController];
}

- (IBAction)registerButtonAction:(id)sender
{
    KGRegisterViewController *registerViewController = [[KGRegisterViewController alloc] init];
    [self.navigationController pushViewController:registerViewController animated:YES];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
