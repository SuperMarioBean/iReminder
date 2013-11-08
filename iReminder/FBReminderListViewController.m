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
    // MARK: model类的工作，提供数据集有多少个区间
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // MARK: model类的工作，提供相应数据集区间中的个数
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    /* 设置cell的工作 */
    
    // MARK: model类的工作，提供具体数据集区间数据列的数据对象
    
    cell.textLabel.text = nil;
    cell.detailTextLabel.text = nil;
    
    return cell;
}



#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

}

@end
