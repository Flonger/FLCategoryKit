//
//  UIButton+Extension.m
//  GLW
//
//  Created by 薛飞龙 on 2016/12/23.
//  Copyright © 2016年 薛飞龙. All rights reserved.
//

#import "UIButton+Extension.h"
#import <objc/runtime.h>
static const char btnKey;
@interface UIButton (Extension)<CAAnimationDelegate>
/**
 *  bool 设置是否执行触及事件方法
 */
@property (nonatomic, assign) BOOL isExcuteEvent;
@end
@implementation UIButton (Extension)
+ (void)load
{
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        SEL oldSel = @selector(sendAction:to:forEvent:);
        SEL newSel = @selector(newSendAction:to:forEvent:);
        // 获取到上面新建的oldsel方法
        Method oldMethod = class_getInstanceMethod(self, oldSel);
        // 获取到上面新建的newsel方法
        Method newMethod = class_getInstanceMethod(self, newSel);
        // IMP 指方法实现的指针,每个方法都有一个对应的IMP,调用方法的IMP指针避免方法调用出现死循环问题
        /**
         *  给oldSel添加方法
         *
         *  @param self      被添加方法的类
         *  @param oldSel    被添加方法的方法名
         *  @param newMethod 实现这个方法的函数
         *  (@types 定义该函数返回值类型和参数类型的字符串)
         *  @return 是否添加成功
         想了解的可以查看下:
         http://blog.csdn.net/lvmaker/article/details/32396167
         */
        BOOL isAdd = class_addMethod(self, oldSel, method_getImplementation(newMethod), method_getTypeEncoding(newMethod));
        if (isAdd) {
            // 将newSel替换成oldMethod
            class_replaceMethod(self, newSel, method_getImplementation(oldMethod), method_getTypeEncoding(oldMethod));
        }else{
            // 给两个方法互换实现
            method_exchangeImplementations(oldMethod, newMethod);
        }
    });
}

- (void)newSendAction:(SEL)action to:(id)target forEvent:(UIEvent *)event
{
        self.timeInterVal = 0;
    
    
    
    if ([NSStringFromClass(self.class) isEqualToString:@"UIButton"]) {
        UITouch *touch = event.allTouches.allObjects.firstObject;
        CGPoint touchePoint = [touch locationInView:self];
        CGFloat maxX = touchePoint.x>(self.frame.size.width-touchePoint.x)?touchePoint.x:(self.frame.size.width-touchePoint.x);
        CGFloat maxY = touchePoint.y>(self.frame.size.width-touchePoint.y)?touchePoint.y:(self.frame.size.height-touchePoint.y);
        CGFloat circleWidth = maxX>maxY?maxX:maxY;
        UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(-circleWidth, -circleWidth, circleWidth*2, circleWidth*2) cornerRadius:circleWidth];
        CAShapeLayer *shapeLayer;
        shapeLayer = [CAShapeLayer layer];
        shapeLayer.opacity = 0.5;
        shapeLayer.lineWidth = 0.f;
        shapeLayer.anchorPoint = CGPointMake(0.5, 0.5);
        shapeLayer.position = touchePoint;
        shapeLayer.path = [path CGPath];
        shapeLayer.fillColor = [[UIColor whiteColor] CGColor];
        shapeLayer.strokeColor = [[UIColor clearColor] CGColor];
        [self.layer addSublayer:shapeLayer];
        self.layer.masksToBounds = YES;
        
        
        CABasicAnimation *scaleAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
        scaleAnimation.fromValue = @0;
        scaleAnimation.toValue = @1;
        scaleAnimation.duration = 0.3;
        scaleAnimation.delegate = self;
        [shapeLayer addAnimation:scaleAnimation forKey:@"animation"];
        
        
        if (self.isExcuteEvent == 0) {
            self.timeInterVal = self.timeInterVal = 0? defaultInterval:self.timeInterVal;
        }
        if (self.isExcuteEvent) return;
        if (self.timeInterVal > 0) {
            self.isExcuteEvent = YES;
            [self performSelector:@selector(setIsExcuteEvent:) withObject:nil afterDelay:self.timeInterVal];
        }
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [shapeLayer removeFromSuperlayer];
        });
    }
    [self newSendAction:action to:target forEvent:event];
}

- (NSTimeInterval)timeInterVal
{
    // 动态获取关联对象
    return [objc_getAssociatedObject(self, _cmd) doubleValue];
}

- (void)setTimeInterVal:(NSTimeInterval)timeInterVal
{
    // 动态设置关联对象
    objc_setAssociatedObject(self, @selector(timeInterVal), @(timeInterVal), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)setIsExcuteEvent:(BOOL)isExcuteEvent
{
    // 动态设置关联对象
    objc_setAssociatedObject(self, @selector(isExcuteEvent), @(isExcuteEvent), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (BOOL)isExcuteEvent
{
    // 动态获取关联对象
    return [objc_getAssociatedObject(self, _cmd) boolValue];
}


- (void)horizontalCenterTitleAndImageRight:(CGFloat)spacing
{
    // get the size of the elements here for readability
    CGSize imageSize = self.imageView.frame.size;
    CGSize titleSize = self.titleLabel.frame.size;
    
    // lower the text and push it left to center it
    self.titleEdgeInsets = UIEdgeInsetsMake(0.0, - imageSize.width, 0.0, 0.0);
    
    // the text width might have changed (in case it was shortened before due to
    // lack of space and isn't anymore now), so we get the frame size again
    titleSize = self.titleLabel.frame.size;
    
    // raise the image and push it right to center it
    self.imageEdgeInsets = UIEdgeInsetsMake(0.0, titleSize.width + imageSize.width + spacing, 0.0, - titleSize.width);
}
- (void)verticalImageAndTitle:(CGFloat)spacing
{
//    self.titleLabel.backgroundColor = [UIColor greenColor];
//    self.imageView.backgroundColor  = [UIColor flatPinkColor];
    CGSize imageSize = self.imageView.frame.size;
    CGSize titleSize = self.titleLabel.frame.size;
    CGSize textSize = [self.titleLabel.text sizeWithFont:self.titleLabel.font];
    CGSize frameSize = CGSizeMake(ceilf(textSize.width), ceilf(textSize.height));
    if (titleSize.width + 0.5 < frameSize.width) {
        titleSize.width = frameSize.width;
    }
    CGFloat totalHeight = (imageSize.height + titleSize.height + spacing);
    self.imageEdgeInsets = UIEdgeInsetsMake(- (totalHeight - imageSize.height), 0.0, 0.0, - titleSize.width);
    self.titleEdgeInsets = UIEdgeInsetsMake(0, - imageSize.width, - (totalHeight - titleSize.height), 0);
    
}
//btn点击
- (void)addActionWithBlock:(btnBlock)block
{
    if (block)
    {
        objc_setAssociatedObject(self, &btnKey, block, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    
    [self addTarget:self action:@selector(btnAction) forControlEvents:UIControlEventTouchUpInside];
}

- (void)btnAction
{
    btnBlock block = objc_getAssociatedObject(self, &btnKey);
    block();
}

@end
