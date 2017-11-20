//
//  NSString+URLcode.m
//  YunDB
//
//  Created by 薛飞龙 on 16/5/17.
//  Copyright © 2016年 薛飞龙. All rights reserved.
//

#import "NSString+URLcode.h"

@implementation NSString (URLcode)
- (NSString *)encodeURL
{
    NSMutableString *escaped = [NSMutableString stringWithString:self];
    
    [escaped replaceOccurrencesOfString:@"$" withString:@"%24" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [escaped length])];
    [escaped replaceOccurrencesOfString:@"&" withString:@"%26" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [escaped length])];
    [escaped replaceOccurrencesOfString:@"+" withString:@"%2B" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [escaped length])];
    [escaped replaceOccurrencesOfString:@"," withString:@"%2C" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [escaped length])];
    [escaped replaceOccurrencesOfString:@"/" withString:@"%2F" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [escaped length])];
    [escaped replaceOccurrencesOfString:@":" withString:@"%3A" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [escaped length])];
    [escaped replaceOccurrencesOfString:@";" withString:@"%3B" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [escaped length])];
    [escaped replaceOccurrencesOfString:@"=" withString:@"%3D" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [escaped length])];
    [escaped replaceOccurrencesOfString:@"?" withString:@"%3F" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [escaped length])];
    [escaped replaceOccurrencesOfString:@"@" withString:@"%40" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [escaped length])];
    [escaped replaceOccurrencesOfString:@" " withString:@"%20" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [escaped length])];
    [escaped replaceOccurrencesOfString:@"\t" withString:@"%09" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [escaped length])];
    [escaped replaceOccurrencesOfString:@"#" withString:@"%23" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [escaped length])];
    [escaped replaceOccurrencesOfString:@"<" withString:@"%3C" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [escaped length])];
    [escaped replaceOccurrencesOfString:@">" withString:@"%3E" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [escaped length])];
    [escaped replaceOccurrencesOfString:@"\"" withString:@"%22" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [escaped length])];
    [escaped replaceOccurrencesOfString:@"\n" withString:@"%0A" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [escaped length])];
    [escaped replaceOccurrencesOfString:@"¥" withString:@"%A5" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [escaped length])];
    [escaped replaceOccurrencesOfString:@"£" withString:@"%A3" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [escaped length])];
    [escaped replaceOccurrencesOfString:@"•" withString:@"%95" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [escaped length])];
    
    
    return escaped;
}

- (NSString *)decodeURL
{
    NSMutableString *escaped = [NSMutableString stringWithString:self];
    
    [escaped replaceOccurrencesOfString:@"%24" withString:@"$" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [escaped length])];
    [escaped replaceOccurrencesOfString:@"%26" withString:@"&" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [escaped length])];
    [escaped replaceOccurrencesOfString:@"%2B" withString:@"+" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [escaped length])];
    [escaped replaceOccurrencesOfString:@"%2C" withString:@"," options:NSCaseInsensitiveSearch range:NSMakeRange(0, [escaped length])];
    [escaped replaceOccurrencesOfString:@"%2F" withString:@"/" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [escaped length])];
    [escaped replaceOccurrencesOfString:@"%3A" withString:@":" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [escaped length])];
    [escaped replaceOccurrencesOfString:@"%3B" withString:@";" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [escaped length])];
    [escaped replaceOccurrencesOfString:@"%3D" withString:@"=" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [escaped length])];
    [escaped replaceOccurrencesOfString:@"%3F" withString:@"?" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [escaped length])];
    [escaped replaceOccurrencesOfString:@"%40" withString:@"@" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [escaped length])];
    [escaped replaceOccurrencesOfString:@"%20" withString:@" " options:NSCaseInsensitiveSearch range:NSMakeRange(0, [escaped length])];
    [escaped replaceOccurrencesOfString:@"%09" withString:@"\t" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [escaped length])];
    [escaped replaceOccurrencesOfString:@"%23" withString:@"#" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [escaped length])];
    [escaped replaceOccurrencesOfString:@"%3C" withString:@"<" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [escaped length])];
    [escaped replaceOccurrencesOfString:@"%3E" withString:@">" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [escaped length])];
    [escaped replaceOccurrencesOfString:@"%22" withString:@"\"" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [escaped length])];
    [escaped replaceOccurrencesOfString:@"%0A" withString:@"\n" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [escaped length])];
    [escaped replaceOccurrencesOfString:@"%A5" withString:@"¥" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [escaped length])];
    [escaped replaceOccurrencesOfString:@"%A3" withString:@"£" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [escaped length])];
    [escaped replaceOccurrencesOfString:@"%95" withString:@"•" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [escaped length])];
    
    return escaped;
}

@end
