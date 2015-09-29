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
#import "KGUserRequestManager.h"

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
    if (self.userNameTextField.text.length > 0 && self.passwordTextField.text.length > 0)
        [self requestUserCredentials];
}

- (IBAction)registerButtonAction:(id)sender
{
    KGRegisterViewController *registerViewController = [[KGRegisterViewController alloc] init];
    [self.navigationController pushViewController:registerViewController animated:YES];
}

#pragma mark - API Request
- (void)requestUserCredentials
{
    RequestFinishedBlock requestFinishedBlock = ^(NSDictionary *params) {
        
        NSDictionary *dataDictionary = [params objectForKey:@"data"];
        NSDictionary *userDictionary = [dataDictionary objectForKey:@"User"];
        BOOL isValid = [[dataDictionary objectForKey:@"is_credentials_valid"] boolValue];
        
        if (isValid) {
            [[AppDelegate sharedAppDelegate] setApplicationAccount:[userDictionary objectForKey:@"username"]];
            [[AppDelegate sharedAppDelegate] showHomeViewController];
        } else {
            NSLog(@"Login Failed");
        }
    };
    
    RequestErrorBlock errorBlock = ^(NSError *error, NSDictionary *params) {
        
    };
    
    RequestCancelBlock cancelBlock = ^(void) {
        
    };
    
    KGUserRequestManager *userManager = [[KGUserRequestManager alloc] init];

    [userManager requestVerifyCredentials:self.userNameTextField.text
                                 password:self.passwordTextField.text
                            finishedBlock:requestFinishedBlock
                               errorBlock:errorBlock
                              cancelBlock:cancelBlock];
}

@end
