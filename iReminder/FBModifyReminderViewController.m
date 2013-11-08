//
//  FBModifyReminderViewController.m
//  iReminder
//
//  Created by 傅 斌 on 11/8/13.
//  Copyright (c) 2013 傅 斌. All rights reserved.
//

#import "FBModifyReminderViewController.h"

@interface FBModifyReminderViewController ()

@end

@implementation FBModifyReminderViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.hidesBackButton = YES;
    self.itemModifyTextField.delegate = self;
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.itemModifyTextField.placeholder = self.dict[@"Title"];
    self.dateModifier.minimumDate = [NSDate date];
    self.dateModifier.date = self.dict[@"Subtitle"];
}

- (void)viewDidUnload {
    [self setDateModifier:nil];
    [self setItemModifyTextField:nil];
    [super viewDidUnload];
}

- (IBAction)enterClick:(id)sender {
    [self.itemModifyTextField resignFirstResponder];
    
    if (self.delegate&&[self.delegate conformsToProtocol:@protocol(FBModifyReminderDelegate)]) {
        [self.delegate willmMdifyReminderViewController:self];
        if ([self.delegate shouldModifyReminderViewController:self]) {
            // modify something
            [self.delegate didModifyReminderViewController:self];
        }
        else{
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"提示"
                                                                message:@"您的修改不符合要求，提示事项名称至少需要一个名称"
                                                               delegate:self
                                                      cancelButtonTitle:@"我明白了！"
                                                      otherButtonTitles:nil];
            [alertView show];
        }
    }
}

#pragma mark - UITextFieldDelegate Method
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [self.itemModifyTextField resignFirstResponder];
    return NO;
}
@end
