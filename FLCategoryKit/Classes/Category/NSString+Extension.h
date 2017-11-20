//
//  NSString+Extension.h
//  GLW
//
//  Created by 薛飞龙 on 2016/12/16.
//  Copyright © 2016年 薛飞龙. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Extension)
- (CGSize)sizeWithFont:(UIFont *)font maxW:(CGFloat)maxW maxH:(CGFloat)maxH;
- (CGSize)sizeWithFont:(UIFont *)font maxW:(CGFloat)maxW;
- (CGSize)sizeWithFont:(UIFont *)font;

/**
 *具体时间
 */
+ (NSString *)dateDetailTime:(NSString *)dateStr;

/**
 *具体时间到日期
 */
+ (NSString *)dateOnlyDate:(NSString *)dateStr;
/**
 *  将秒转换成时分秒
 *
 *  @param seconds 字符串秒
 *
 *  @return 返回一个字符串例如23:02:12
 */
+ (NSString*)TimeformatFromSeconds:(NSString *)seconds;

//时间戳转换时间
+ (NSString *)dateWithTimeInterval:(NSTimeInterval)time;

+ (NSString *)lr_stringDate;
@end
