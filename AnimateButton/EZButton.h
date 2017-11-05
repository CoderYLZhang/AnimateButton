//
//  EZButton.h
//  EZButton
//
//  Created by 张银龙 on 2017/11/5.
//  Copyright © 2017年 张银龙. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EZButton : UIButton

// 方便设置
@property (nonatomic, strong) UIColor *borderColor;

@property (nonatomic, assign) CGFloat borderWidth;

@property (nonatomic, assign) CGFloat cornerRadius;

@property (nonatomic, strong) UIColor *shadowColor;

@property (nonatomic, assign) CGFloat shadowOpacity;

@property (nonatomic, assign) CGSize shadowOffset;

@property (nonatomic, assign) CGFloat shadowRadius;

// 渐变颜色
@property (nonatomic, assign) BOOL gradientEnabled;

@property (nonatomic, strong) UIColor *gradientStartColor;

@property (nonatomic, strong) UIColor *gradientEndColor;
/* 渐变色方向 默认 yes (水平方向渐变)*/
@property (nonatomic, assign) BOOL  isGradientHorizontal;


// 动画相关
/* 高亮时的比例 默认1.0 */
@property (nonatomic, assign) CGFloat animatedScaleWhenHighlighted;
/* 高亮动画时间 默认0.2 */
@property (nonatomic, assign) CGFloat animatedScaleDurationWhenHightlighted;
/* 选择时的比例 默认1.0 */
@property (nonatomic, assign) CGFloat animatedScaleWhenSelected;
/* 选择动画时间 默认0.2 */
@property (nonatomic, assign) CGFloat animatedScaleDurationWhenSelected;


// Ripple相关
/* 默认 NO */
@property (nonatomic, assign) BOOL rippleEnabled;
/* 默认  [UIColor colorWithWhite:1 alpha:0.3] */
@property (nonatomic, strong) UIColor *rippleColor;
/* 默认 1s */
@property (nonatomic, assign) CGFloat rippleSpeed;



// addTarget
- (void)addTarget:(id)target action:(SEL)action;

@end
