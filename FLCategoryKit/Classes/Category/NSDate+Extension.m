//
//  NSDate+Extension.m
//  GLW
//
//  Created by 薛飞龙 on 2016/12/16.
//  Copyright © 2016年 薛飞龙. All rights reserved.
//

#import "NSDate+Extension.h"

@implementation NSDate (Extension)
/**
 *  判断某个时间是否为今年
 */
- (BOOL)isThisYear
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    // 获得某个时间的年月日时分秒
    NSDateComponents *dateCmps = [calendar components:NSCalendarUnitYear fromDate:self];
    NSDateComponents *nowCmps = [calendar components:NSCalendarUnitYear fromDate:[NSDate date]];
    return dateCmps.year == nowCmps.year;
}

/**
 *  判断某个时间是否为昨天
 */
- (BOOL)isYesterday
{
    NSDate *now = [NSDate date];
    
    // date ==  2014-04-30 10:05:28 --> 2014-04-30 00:00:00
    // now == 2014-05-01 09:22:10 --> 2014-05-01 00:00:00
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    fmt.dateFormat = @"yyyy-MM-dd";
    
    // 2014-04-30
    NSString *dateStr = [fmt stringFromDate:self];
    // 2014-10-18
    NSString *nowStr = [fmt stringFromDate:now];
    
    // 2014-10-30 00:00:00
    NSDate *date = [fmt dateFromString:dateStr];
    // 2014-10-18 00:00:00
    now = [fmt dateFromString:nowStr];
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    NSCalendarUnit unit = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay;
    NSDateComponents *cmps = [calendar components:unit fromDate:date toDate:now options:0];
    
    return cmps.year == 0 && cmps.month == 0 && cmps.day == 1;
}

/**
 *  判断某个时间是否为今天
 */
- (BOOL)isToday
{
    NSDate *now = [NSDate date];
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    fmt.dateFormat = @"yyyy-MM-dd";
    
    NSString *dateStr = [fmt stringFromDate:self];
    NSString *nowStr = [fmt stringFromDate:now];
    
    return [dateStr isEqualToString:nowStr];
}

+ (NSString*)fromDateToAge:(NSString*)date{
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    
    NSDate *myDate = [dateFormatter dateFromString:date];
    
    NSDate *nowDate = [NSDate date];
    
    
    
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    
    
    unsigned int unitFlags = NSCalendarUnitYear;
    
    
    NSDateComponents *comps = [calendar components:unitFlags fromDate:myDate toDate:nowDate options:0];
    
    
    NSInteger year = [comps year];
    
    
    return [NSString stringWithFormat:@"%ld",(long)year];
    
    
}


+ (NSString *)getThisMonth
{
    
    NSDate *currentDate = [NSDate date];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM"];
    
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *lastMonthComps = [[NSDateComponents alloc] init];
    //    [lastMonthComps setYear:1]; // year = 1表示1年后的时间 year = -1为1年前的日期，month day 类推
//    [lastMonthComps setMonth:-1];
    NSDate *newdate = [calendar dateByAddingComponents:lastMonthComps toDate:currentDate options:0];
    NSString *dateStr = [formatter stringFromDate:newdate];
    return  [NSString stringWithFormat:@"%@-01",dateStr];
    
}

+ (NSString *)getThisYear
{
    NSDate *currentDate = [NSDate date];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy"];
    
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *lastMonthComps = [[NSDateComponents alloc] init];
    //    [lastMonthComps setYear:1]; // year = 1表示1年后的时间 year = -1为1年前的日期，month day 类推
//    [lastMonthComps setMonth:-1];
    NSDate *newdate = [calendar dateByAddingComponents:lastMonthComps toDate:currentDate options:0];
    NSString *dateStr = [formatter stringFromDate:newdate];
    return  [NSString stringWithFormat:@"%@-01-01",dateStr];
    
}

+ (NSString *)getValiDayAddDays:(NSString *)day
{
    NSDateFormatter *dateFormatter = [NSDateFormatter new];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    
    NSDate *date = [NSDate date];
    NSDate *newDate = [date dateByAddingTimeInterval:60 * 60 * 24 * [day integerValue]];
    
    return [dateFormatter stringFromDate:newDate];
}



@end
