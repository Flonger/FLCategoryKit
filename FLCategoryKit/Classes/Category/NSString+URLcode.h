//
//  NSString+URLcode.h
//  YunDB
//
//  Created by 薛飞龙 on 16/5/17.
//  Copyright © 2016年 薛飞龙. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (URLcode)
- (NSString *)encodeURL;
- (NSString *)decodeURL;
@end
