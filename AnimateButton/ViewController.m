//
//  ViewController.m
//  AnimateButton
//
//  Created by 张银龙 on 2017/11/5.
//  Copyright © 2017年 张银龙. All rights reserved.
//

#import "ViewController.h"
#import "EZButton.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    EZButton *btn = ({
        EZButton *btn = [[EZButton alloc] init];
        //[btn addTarget:self action:@selector(didclick) forControlEvents:UIControlEventTouchUpInside];
        btn.frame = CGRectMake(100, 100, 200, 80);
        btn.backgroundColor = [UIColor orangeColor];
        btn.animatedScaleWhenHighlighted = 0.9;
        btn.cornerRadius = 5;
        //btn.gradientEnabled = YES;
        btn.gradientStartColor = [UIColor redColor];
        btn.gradientEndColor = [UIColor greenColor];
        btn.rippleEnabled = YES;
        [self.view addSubview:btn];
        btn;
    });
    [btn setTitle:@"Normal" forState:UIControlStateNormal];
    [btn setTitle:@"Highlighted" forState:UIControlStateHighlighted];
    
    EZButton *btn2 = ({
        EZButton *btn = [[EZButton alloc] init];
        [btn addTarget:self action:@selector(didclick:) forControlEvents:UIControlEventTouchUpInside];
        btn.frame = CGRectMake(100, 200, 200, 80);
        btn.animatedScaleWhenSelected = 0.9;
        btn.cornerRadius = 5;
        btn.borderColor = [UIColor blueColor];
        btn.borderWidth = 4;
        btn.isGradientHorizontal = NO;
        btn.gradientEnabled = YES;
        btn.gradientStartColor = [UIColor redColor];
        btn.gradientEndColor = [UIColor greenColor];
        [self.view addSubview:btn];
        btn;
    });
    [btn2 setTitle:@"Normal" forState:UIControlStateNormal];
    [btn2 setTitle:@"Selected" forState:UIControlStateSelected];
}

- (void)didclick:(EZButton *)btn {
    btn.selected = !btn.selected;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
