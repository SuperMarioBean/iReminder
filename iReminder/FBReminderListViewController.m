//
//  FBReminderListViewController.m
//  iReminder
//
//  Created by 傅 斌 on 11/8/13.
//  Copyright (c) 2013 傅 斌. All rights reserved.
//

#import "FBReminderListViewController.h"

@interface FBReminderListViewController ()

@end

@implementation FBReminderListViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(reloadTable)
                                                 name:@"reloadData"
                                               object:nil];
}

- (void)reloadTable
{
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [FBReminderList numberOfSections];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [FBReminderList numberOfRowsInSection:section];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
                
    /* 设置cell的工作 */
    
    NSDictionary* dict = [FBReminderList dictionaryForRowAtIndexPath:indexPath];
    
    cell.textLabel.text = dict[@"Title"];
    cell.detailTextLabel.text = [dict[@"Subtitle"] description] ;
    
    return cell;
}


#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    FBModifyReminderViewController *viewController = [self.storyboard instantiateViewControllerWithIdentifier:@"modify"] ;
    viewController.indexPath = indexPath;
    NSDictionary *dict = [FBReminderList dictionaryForRowAtIndexPath:indexPath];

    viewController.dict = dict;
    viewController.delegate = self;
    [self.navigationController pushViewController:viewController animated:YES];
}



#pragma mark - FBModifyReminderDelegate delegate
- (void)willmMdifyReminderViewController:(FBModifyReminderViewController *)viewController{
    NSLog(@"will");
}
- (BOOL)shouldModifyReminderViewController:(FBModifyReminderViewController *)viewController{
      NSLog(@"should");
    BOOL ret = YES;
    
    if ([viewController.itemModifyTextField.text length] == 0) {
        ret = NO;
    }
    
    return ret;
}
- (void)didModifyReminderViewController:(FBModifyReminderViewController *)viewcontroller{
      NSLog(@"did");
    [FBReminderList reScheduleReminderItemWithFormerIndexPath:viewcontroller.indexPath FireDate:viewcontroller.dateModifier.date alertBody:viewcontroller.itemModifyTextField.text];
    [self.tableView reloadData];
    [viewcontroller.navigationController popViewControllerAnimated:YES];
}


@end
