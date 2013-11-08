//
//  FBReminderList.h
//  iReminder
//
//  Created by 傅 斌 on 11/8/13.
//  Copyright (c) 2013 傅 斌. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface FBReminderList : NSObject
+ (NSInteger)numberOfSections;
+ (NSInteger)numberOfRowsInSection:(NSInteger)section;
+ (NSDictionary *)dictionaryForRowAtIndexPath:(NSIndexPath *)indexPath;
+ (void)scheduleReminderItemWithFireDate:(NSDate *)fireDate alertBody:(NSString *)alertBody;

+ (void)reScheduleReminderItemWithFormerIndexPath:(NSIndexPath *)indexPath FireDate:(NSDate *)fireDate alertBody:(NSString *)alertBody;
@end
