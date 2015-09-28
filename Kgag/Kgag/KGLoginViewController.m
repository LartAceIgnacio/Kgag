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
    if (self.userNameTextField.text.length > 0)
        [self requestUserDetailsWith:self.userNameTextField.text];
}

- (IBAction)registerButtonAction:(id)sender
{
    KGRegisterViewController *registerViewController = [[KGRegisterViewController alloc] init];
    [self.navigationController pushViewController:registerViewController animated:YES];
}

#pragma mark - API Request
- (void)requestUserDetailsWith:(NSString *)userName
{
    RequestFinishedBlock requestFinishedBlock = ^(NSDictionary *params) {
        
        NSDictionary *userDictionary = [[params objectForKey:@"data"] objectForKey:@"User"];
        
        if ([userDictionary count] > 0) {
            [[AppDelegate sharedAppDelegate] setApplicationAccount:[userDictionary objectForKey:@"username"]];
            [[AppDelegate sharedAppDelegate] showHomeViewController];
        } else {
            NSLog(@"No user found");
        }
    };
    
    RequestErrorBlock errorBlock = ^(NSError *error, NSDictionary *params) {
        
    };
    
    RequestCancelBlock cancelBlock = ^(void) {
        
    };
    
    KGUserRequestManager *userManager = [[KGUserRequestManager alloc] init];
    
    [userManager requestUserDetails:userName
                      finishedBlock:requestFinishedBlock
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
