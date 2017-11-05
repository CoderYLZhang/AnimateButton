# EZButton



![image](https://github.com/CoderYLZhang/AnimateButton/blob/master/image.gif)



- ###常用属性 方便设置

```objective-c
// 方便设置
@property (nonatomic, strong) UIColor *borderColor;

@property (nonatomic, assign) CGFloat borderWidth;

@property (nonatomic, assign) CGFloat cornerRadius;

@property (nonatomic, strong) UIColor *shadowColor;

@property (nonatomic, assign) CGFloat shadowOpacity;

@property (nonatomic, assign) CGSize shadowOffset;

@property (nonatomic, assign) CGFloat shadowRadius;

- (void)addTarget:(id)target action:(SEL)action;

```



- ###渐变颜色 输入开始颜色和结束颜色

  ````objective-c
  // 渐变颜色
  @property (nonatomic, assign) BOOL gradientEnabled;

  @property (nonatomic, strong) UIColor *gradientStartColor;

  @property (nonatomic, strong) UIColor *gradientEndColor;
  /* 渐变色方向 默认 yes (水平方向渐变)*/
  @property (nonatomic, assign) BOOL  isGradientHorizontal;
  ````

- ### 支持设置点击动画 和 渐变波浪

  ```
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
  ```

  ​