//
//  FBAddReminderItemViewController.h
//  iReminder
//
//  Created by 傅 斌 on 11/8/13.
//  Copyright (c) 2013 傅 斌. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FBAddReminderItemViewController : UIViewController<UITextFieldDelegate, UIAlertViewDelegate>
@property (weak, nonatomic) IBOutlet UITextField *itemTextField;
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;

- (IBAction)cancelClick:(id)sender;
- (IBAction)saveClick:(id)sender;

@end
