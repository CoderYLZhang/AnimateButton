//
//  EZButton.m
//  EZButton
//
//  Created by 张银龙 on 2017/11/5.
//  Copyright © 2017年 张银龙. All rights reserved.
//

#import "EZButton.h"

@interface EZButton ()<CAAnimationDelegate>

@property (nonatomic, strong) CAGradientLayer *gradient;

@end

@implementation EZButton

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.animatedScaleWhenHighlighted = 1.0;
        self.animatedScaleDurationWhenHightlighted = 0.2;
        self.animatedScaleWhenSelected = 1.0;
        self.animatedScaleDurationWhenSelected = 0.2;
        
        self.isGradientHorizontal = YES;
        
        self.rippleColor = [UIColor colorWithWhite:1 alpha:0.5];
        self.rippleSpeed = 1;
    }
    return self;
}

#pragma mark - 方便设置

- (void)setBorderColor:(UIColor *)borderColor {
    self.layer.borderColor = borderColor.CGColor;
    _borderColor = borderColor;
}

- (void)setBorderWidth:(CGFloat)borderWidth {
    self.layer.borderWidth = borderWidth;
    _borderWidth = borderWidth;
}

- (void)setCornerRadius:(CGFloat)cornerRadius {
    self.layer.cornerRadius = cornerRadius;
    _cornerRadius = cornerRadius;
}

- (void)setShadowColor:(UIColor *)shadowColor {
    self.layer.shadowColor = shadowColor.CGColor;
    _shadowColor = shadowColor;
}

- (void)setShadowOpacity:(CGFloat)shadowOpacity {
    self.layer.shadowOpacity = shadowOpacity;
    _shadowOpacity = shadowOpacity;
}

- (void)setShadowOffset:(CGSize)shadowOffset {
    self.layer.shadowOffset = shadowOffset;
    _shadowOffset = shadowOffset;
}

- (void)setShadowRadius:(CGFloat)shadowRadius {
    self.layer.shadowRadius = shadowRadius;
    _shadowRadius = shadowRadius;
}

#pragma mark - 渐变颜色

- (void)setGradientEnabled:(BOOL)gradientEnabled {
    _gradientEnabled = gradientEnabled;
    [self setupGradient];
}

- (void)setGradientStartColor:(UIColor *)gradientStartColor {
    _gradientStartColor = gradientStartColor;
    [self setupGradient];
}

- (void)setGradientEndColor:(UIColor *)gradientEndColor {
    _gradientEndColor = gradientEndColor;
    [self setupGradient];
}

- (void)setupGradient {
    if (!_gradientEnabled) return;
    if (!self.gradientStartColor || !self.gradientEndColor) return;
    
    
    [self.gradient removeFromSuperlayer];
    self.gradient = [CAGradientLayer layer];
    
    
    self.gradient.frame = self.layer.bounds;
    self.gradient.colors = @[(__bridge id)self.gradientStartColor.CGColor, (__bridge id)self.gradientEndColor.CGColor];
    self.gradient.startPoint = CGPointMake(0, 0);
    self.gradient.endPoint = self.isGradientHorizontal ? CGPointMake(1, 0) : CGPointMake(0, 1);
    self.gradient.cornerRadius = self.cornerRadius;
    
    [self.layer insertSublayer:self.gradient below:self.imageView.layer];
    
}

#pragma mark - 动画相关

- (void)setHighlighted:(BOOL)highlighted {
    [super setHighlighted:highlighted];
    if (self.animatedScaleWhenHighlighted == 1) return;
    
    if (highlighted) {
        [UIView animateWithDuration:self.animatedScaleDurationWhenHightlighted animations:^{
            self.transform = CGAffineTransformMakeScale(self.animatedScaleWhenHighlighted, self.animatedScaleWhenHighlighted);
        }];
    }
    else{
        [UIView animateWithDuration:self.animatedScaleDurationWhenHightlighted animations:^{
            self.transform = CGAffineTransformIdentity;
        }];
    }
}

- (void)setSelected:(BOOL)selected {
    [super setSelected:selected];
    if (self.animatedScaleWhenSelected == 1) return;
    
    [UIView animateWithDuration:self.animatedScaleDurationWhenSelected*0.5
                     animations:^{
                         self.transform = CGAffineTransformMakeScale(self.animatedScaleWhenSelected, self.animatedScaleWhenSelected);
                     } completion:^(BOOL finished) {
                         [UIView animateWithDuration:self.animatedScaleDurationWhenSelected*0.5 animations:^{
                             self.transform = CGAffineTransformIdentity;
                         }];
                     }];
}

#pragma mark - Ripple相关

- (BOOL)beginTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event {
    if (!self.rippleEnabled) return YES;
    
    CGPoint touchLocation = [touch locationInView:self];
    
    CALayer *alayer = [CALayer layer];
    alayer.backgroundColor = self.rippleColor.CGColor;
    CGFloat layerWH = 20;
    alayer.frame = CGRectMake(0, 0, layerWH, layerWH);
    alayer.cornerRadius = layerWH * 0.5;
    alayer.masksToBounds = YES;
    alayer.position = touchLocation;
    
    [self.layer insertSublayer:alayer below:self.titleLabel.layer];
    
    // 比例动画
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    animation.toValue = @(MAX(self.frame.size.width, self.frame.size.height) * 0.5);
    animation.duration = self.rippleSpeed;
    animation.removedOnCompletion = NO;
    animation.fillMode = kCAFillModeForwards;
    
    // 渐变动画
    CAKeyframeAnimation *keyAnimation = [CAKeyframeAnimation animationWithKeyPath:@"opacity"];
    keyAnimation.values = @[@1.0, @0.8, @0.5, @0.3, @0];
    keyAnimation.duration = self.rippleSpeed * 0.5;
    
    
    // 动画组
    CAAnimationGroup *group = [CAAnimationGroup animation];
    group.duration = self.rippleSpeed * 0.5;
    group.delegate = self;
    group.animations = @[animation, keyAnimation];
    [group setValue:alayer forKey:@"animationLayer"];
    
    [alayer addAnimation:group forKey:@"scale & opacity"];
    
    return YES;
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    
    CALayer *alayer = [anim valueForKey:@"animationLayer"];
    if (alayer) {
        [alayer removeAnimationForKey:@"scale & opacity"];
        [alayer removeFromSuperlayer];
    }
}


#pragma mark - addTarget
- (void)addTarget:(id)target action:(SEL)action {
    [self addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
}

@end
