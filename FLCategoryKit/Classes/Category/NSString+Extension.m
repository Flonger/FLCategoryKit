//
//  NSString+Extension.m
//  GLW
//
//  Created by 薛飞龙 on 2016/12/16.
//  Copyright © 2016年 薛飞龙. All rights reserved.
//

#import "NSString+Extension.h"
#import "NSDate+Extension.h"
@implementation NSString (Extension)
- (CGSize)sizeWithFont:(UIFont *)font maxW:(CGFloat)maxW maxH:(CGFloat)maxH
{
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    attrs[NSFontAttributeName] = font;
    CGSize maxSize = CGSizeMake(maxW, maxH);
    return [self boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size;
}
- (CGSize)sizeWithFont:(UIFont *)font maxW:(CGFloat)maxW
{
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    attrs[NSFontAttributeName] = font;
    CGSize maxSize = CGSizeMake(maxW, MAXFLOAT);
    return [self boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size;
}

- (CGSize)sizeWithFont:(UIFont *)font
{
    return [self sizeWithFont:font maxW:MAXFLOAT];
}

+ (NSString *)dateDetailTime:(NSString *)dateStr {
    
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    if (dateStr.length == 19) {
        [fmt setDateFormat:@"YYYY.MM.dd HH:mm:ss"]; // ----------设置你想要的格式,hh与HH的区别:分别表示12小时制,24小时制
        
    }else{
        [fmt setDateFormat:@"YYYY.MM.dd HH:mm"]; // ----------设置你想要的格式,hh与HH的区别:分别表示12小时制,24小时制
    }
    NSDate * datee = [fmt dateFromString:dateStr];
    
    // 当前时间
    NSDate *now = [NSDate date];
    
    // 日历对象（方便比较两个日期之间的差距）
    NSCalendar *calendar = [NSCalendar currentCalendar];
    // NSCalendarUnit枚举代表想获得哪些差值
    NSCalendarUnit unit = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    // 计算两个日期之间的差值
    NSDateComponents *cmps = [calendar components:unit fromDate:datee toDate:now options:0];
    
    if ([datee isThisYear]) { // 今年
        if ([datee isYesterday]) { // 昨天
            fmt.dateFormat = @"昨天 HH:mm";
            return [fmt stringFromDate:datee];
        } else if ([datee isToday]) { // 今天
            if (cmps.hour >= 1) {
                return [NSString stringWithFormat:@"%ld小时前", (long)cmps.hour];
            } else if (cmps.minute >= 1) {
                return [NSString stringWithFormat:@"%ld分钟前", (long)cmps.minute];
            } else {
                return @"刚刚";
            }
        } else { // 今年的其他日子
            fmt.dateFormat = @"MM.dd HH:mm";
            return [fmt stringFromDate:datee];
        }
    } else { // 非今年
        fmt.dateFormat = @"yyyy.MM.dd HH:mm";
        return [fmt stringFromDate:datee];
    }
    
}

+ (NSString *)dateOnlyDate:(NSString *)dateStr {
    
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    if (dateStr.length == 19) {
        [fmt setDateFormat:@"YYYY.MM.dd HH:mm:ss"]; // ----------设置你想要的格式,hh与HH的区别:分别表示12小时制,24小时制
        
    }else{
        [fmt setDateFormat:@"YYYY.MM.dd HH:mm"]; // ----------设置你想要的格式,hh与HH的区别:分别表示12小时制,24小时制
    }
    NSDate * datee = [fmt dateFromString:dateStr];
    
    fmt.dateFormat = @"yyyy.MM.dd";
    return [fmt stringFromDate:datee];
    
    
}

+ (NSString *)dateWithTimeInterval:(NSTimeInterval)time
{
    NSDate * date = [NSDate dateWithTimeIntervalSince1970:time];
    NSDateFormatter * df = [[NSDateFormatter alloc] init];
    [df setDateFormat:@"YYYY.MM.dd HH:mm:ss"];
    NSString * time1 = [df stringFromDate:date];
    return time1;
}

+ (NSString*)TimeformatFromSeconds:(NSString *)seconds
{
    NSInteger second = [seconds intValue];
    //format of hour
    NSString *str_hour = [NSString stringWithFormat:@"%02ld",second/3600];
    //format of minute
    NSString *str_minute = [NSString stringWithFormat:@"%02ld",(second%3600)/60];
    //format of second
    NSString *str_second = [NSString stringWithFormat:@"%02ld",second%60];
    //format of time
    NSString *format_time = [NSString stringWithFormat:@"%@:%@:%@",str_hour,str_minute,str_second];
    return format_time;
}
+ (NSString *)lr_stringDate {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"YYYY-MM-dd hh:mm:ss"];
    NSString *dateString = [dateFormatter stringFromDate:[NSDate date]];
    return dateString;
}

@end
