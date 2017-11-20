//
//  UIButton+Extension.h
//  GLW
//
//  Created by 薛飞龙 on 2016/12/23.
//  Copyright © 2016年 薛飞龙. All rights reserved.
//

#import <UIKit/UIKit.h>
#define defaultInterval 1// 默认间隔时间
typedef void (^btnBlock)();

@interface UIButton (Extension)
/**
 *  设置点击时间间隔
 */
@property (nonatomic, assign) NSTimeInterval timeInterVal;

//设置btn文字图片距离
//左右
- (void)horizontalCenterTitleAndImageRight:(CGFloat)spacing;
//上下
- (void)verticalImageAndTitle:(CGFloat)spacing;

//btn点击
- (void)addActionWithBlock:(btnBlock)block;

@end
