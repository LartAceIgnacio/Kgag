//
//  KGRegisterViewController.m
//  Kgag
//
//  Created by Lart Ace Ignacio on 9/19/15.
//  Copyright (c) 2015 Lart Ace Ignacio. All rights reserved.
//

#import "KGRegisterViewController.h"
#import "AppDelegate.h"
#import "KGUserRequestManager.h"
#import "KGUser.h"

@interface KGRegisterViewController ()
@property (strong, nonatomic) IBOutlet UITextField *userNameTextField;
@property (strong, nonatomic) IBOutlet UITextField *passwordTextField;
@property (strong, nonatomic) IBOutlet UITextField *firstNameTextField;
@property (strong, nonatomic) IBOutlet UITextField *lastNameTextField;

@end

@implementation KGRegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - IBActions
- (IBAction)backButtonAction:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)registerButtonAction:(id)sender
{
    [self requestRegisterUser];
}

#pragma mark - IBActions
- (void)requestRegisterUser
{
    RequestFinishedBlock finishedBlock = ^(NSDictionary *params) {
        [[AppDelegate sharedAppDelegate] setApplicationAccount:@"Lart"];
        [[AppDelegate sharedAppDelegate] showHomeViewController];
    };
    
    RequestErrorBlock errorBlock = ^(NSError *error, NSDictionary *params) {
        
    };
    
    RequestCancelBlock cancelBlock = ^(void) {
        
    };
    
    KGUserRequestManager *userManager = [[KGUserRequestManager alloc] init];
    
    KGUser *user = [[KGUser alloc] init];
    user.userName = self.userNameTextField.text;
    user.password = self.passwordTextField.text;
    user.firstName = self.firstNameTextField.text;
    user.lastName = self.lastNameTextField.text;
    
    [userManager requestAddUser:user
                  finishedBlock:finishedBlock
                     errorBlock:errorBlock
                    cancelBlock:cancelBlock];
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
