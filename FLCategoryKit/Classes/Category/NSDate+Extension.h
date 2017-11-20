//
//  NSDate+Extension.h
//  GLW
//
//  Created by 薛飞龙 on 2016/12/16.
//  Copyright © 2016年 薛飞龙. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (Extension)
/**
 *  判断某个时间是否为今年
 */
- (BOOL)isThisYear;
/**
 *  判断某个时间是否为昨天
 */
- (BOOL)isYesterday;
/**
 *  判断某个时间是否为今天
 */
- (BOOL)isToday;

/**
 *  算年龄
 *
 *  @param date 生日
 *
 *  @return 年龄
 */
+ (NSString*)fromDateToAge:(NSString*)date;


+ (NSString *)getThisMonth;
+ (NSString *)getThisYear;

+ (NSString *)getValiDayAddDays:(NSString *)day;





@end
