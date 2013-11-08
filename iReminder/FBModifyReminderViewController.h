//
//  FBModifyReminderViewController.h
//  iReminder
//
//  Created by 傅 斌 on 11/8/13.
//  Copyright (c) 2013 傅 斌. All rights reserved.
//

#import <UIKit/UIKit.h>
@class FBModifyReminderViewController;

@protocol FBModifyReminderDelegate <NSObject>

- (void)willmMdifyReminderViewController:(FBModifyReminderViewController *)viewController;
- (BOOL)shouldModifyReminderViewController:(FBModifyReminderViewController *)viewController;
- (void)didModifyReminderViewController:(FBModifyReminderViewController *)viewcontroller;

@end

@interface FBModifyReminderViewController : UIViewController<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UIDatePicker *dateModifier;
@property (weak, nonatomic) IBOutlet UITextField *itemModifyTextField;
@property (strong, nonatomic) NSIndexPath *indexPath;
@property (strong, nonatomic) NSDictionary *dict;
@property (weak, nonatomic) id <FBModifyReminderDelegate> delegate;
- (IBAction)enterClick:(id)sender;
@end
