//
//  FBAddReminderItemViewController.m
//  iReminder
//
//  Created by 傅 斌 on 11/8/13.
//  Copyright (c) 2013 傅 斌. All rights reserved.
//

#import "FBAddReminderItemViewController.h"

@interface FBAddReminderItemViewController ()

@end

@implementation FBAddReminderItemViewController

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
	// Do any additional setup after loading the view.
    
    self.itemTextField.delegate = self;
    self.datePicker.minimumDate = [NSDate date];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setItemTextField:nil];
    [self setDatePicker:nil];
    [super viewDidUnload];
}

- (IBAction)cancelClick:(id)sender {
    [self.presentingViewController dismissModalViewControllerAnimated:YES];
}

- (IBAction)saveClick:(id)sender {
    [self.itemTextField resignFirstResponder];
    UIAlertView *alertView;
    
    if ([self.itemTextField.text length]==0) {
        alertView = [[UIAlertView alloc] initWithTitle:@"提示"
                                                            message:@"您尚未输入需要添加的提示事项名称"
                                                           delegate:self
                                                  cancelButtonTitle:@"我明白了！"
                                                  otherButtonTitles:nil];
        alertView.tag = 1;
    }
    else{
        alertView = [[UIAlertView alloc] initWithTitle:@"确认"
                                                            message:[NSString stringWithFormat:@"iReminder将为你安排于日期%@关于%@的提醒服务", [self.datePicker date], self.itemTextField.text]
                                                           delegate:self
                                                  cancelButtonTitle:@"等下，错了!"
                                                  otherButtonTitles:@"好的，走你~",nil];
        alertView.tag = 2;
    }
    [alertView show];
}

#pragma mark - UITextFieldDelegate Method
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [self.itemTextField resignFirstResponder];
    return NO;
}

#pragma mark - UIAlertViewDelegate Method

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (alertView.tag == 1) {
        /* 提示 返回重新编辑 */
    }
    else if (alertView.tag == 2){
        NSLog(@"%d", buttonIndex);
        if (buttonIndex == 1) {
            /* 确认 生成本地通知并安排发送 */
            
            // MARK: 这里需要model来完成
            [[NSNotificationCenter defaultCenter] postNotificationName:@"reloadData" object:self];
            [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
        }
        else if (buttonIndex == 0){
            /* 确认 返回重新编辑 */
        }
    }
}
@end
