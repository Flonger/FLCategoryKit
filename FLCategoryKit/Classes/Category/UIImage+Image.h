//
//  UIImage+Image.h
//  GLW
//
//  Created by 薛飞龙 on 2016/12/14.
//  Copyright © 2016年 薛飞龙. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Image)
// 加载不要被渲染的图片
+ (UIImage *)imageWithOriginalRenderingMode:(NSString *)imageName;

//给定高宽
- (UIImage*)transformWidth:(CGFloat)width
                    height:(CGFloat)height;

@end
