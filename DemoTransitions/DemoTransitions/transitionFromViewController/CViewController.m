//
//  CViewController.m
//  DemoTransitions
//
//  Created by Chris Hu on 16/7/15.
//  Copyright © 2016年 icetime17. All rights reserved.
//

#import "CViewController.h"

@interface CViewController ()

@end

@implementation CViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor blueColor];
    
    [self addLabel];
    
    [self addBtns];
}

- (void)addLabel {
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 100)];
    label.text = [NSString stringWithFormat:@"C - %@", NSStringFromClass([self class])];
    [self.view addSubview:label];
    
    label.center = self.view.center;
    label.textAlignment = NSTextAlignmentCenter;
    label.numberOfLines = 0;
}

- (void)addBtns{
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height - 100, self.view.frame.size.width, 50)];
    [btn setTitle:@"C - Back" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
    [btn addTarget:self action:@selector(actionBack:) forControlEvents:UIControlEventTouchUpInside];
    btn.layer.borderColor = [UIColor redColor].CGColor;
    btn.layer.borderWidth = 2.0f;
    [self.view addSubview:btn];
}

@end
