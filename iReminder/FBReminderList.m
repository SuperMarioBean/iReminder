//
//  FBReminderList.m
//  iReminder
//
//  Created by 傅 斌 on 11/8/13.
//  Copyright (c) 2013 傅 斌. All rights reserved.
//

#import "FBReminderList.h"
@interface FBReminderList()
+ (void)cancelReminderWithIndexPath:(NSIndexPath *)indexPath;
@end


@implementation FBReminderList

+ (void)cancelReminderWithIndexPath:(NSIndexPath *)indexPath{
    NSArray * array = [[UIApplication sharedApplication] scheduledLocalNotifications];
    UILocalNotification *localNotification = array[indexPath.row];
    [[UIApplication sharedApplication] cancelLocalNotification:localNotification];
}

+ (NSInteger)numberOfSections{
    return 1;
}

+ (NSInteger)numberOfRowsInSection:(NSInteger)section{
    return [[[UIApplication sharedApplication] scheduledLocalNotifications] count];
}

+ (NSDictionary *)dictionaryForRowAtIndexPath:(NSIndexPath *)indexPath{
    UILocalNotification* localNotification = [[[UIApplication sharedApplication] scheduledLocalNotifications] objectAtIndex:indexPath.row];
    NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:localNotification.alertBody,@"Title",localNotification.fireDate,@"Subtitle", nil];
    return dict;
}

+ (void)scheduleReminderItemWithFireDate:(NSDate *)fireDate alertBody:(NSString *)alertBody{
    UILocalNotification* localNotification = [[UILocalNotification alloc] init];
    localNotification.fireDate = fireDate;
    localNotification.alertBody = alertBody;
    localNotification.alertAction = @"展示提醒内容";
    localNotification.timeZone = [NSTimeZone defaultTimeZone];
    localNotification.applicationIconBadgeNumber = [[UIApplication sharedApplication] applicationIconBadgeNumber] + 1;
    localNotification.soundName = UILocalNotificationDefaultSoundName;
    [[UIApplication sharedApplication] scheduleLocalNotification:localNotification];
}

+ (void)reScheduleReminderItemWithFormerIndexPath:(NSIndexPath *)indexPath FireDate:(NSDate *)fireDate alertBody:(NSString *)alertBody{
    [FBReminderList cancelReminderWithIndexPath:indexPath];
    [FBReminderList scheduleReminderItemWithFireDate:fireDate alertBody:alertBody];
}

@end
