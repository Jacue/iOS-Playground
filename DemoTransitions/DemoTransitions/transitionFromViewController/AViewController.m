//
//  AViewController.m
//  DemoTransitions
//
//  Created by Chris Hu on 16/7/15.
//  Copyright © 2016年 icetime17. All rights reserved.
//

#import "AViewController.h"

@interface AViewController ()

@end

@implementation AViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor redColor];
    
    [self addLabel];
    
    [self addBtns];
}

- (void)addLabel {
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 100)];
    label.text = [NSString stringWithFormat:@"A - %@", NSStringFromClass([self class])];
    [self.view addSubview:label];
    
    label.center = self.view.center;
    label.textAlignment = NSTextAlignmentCenter;
    label.numberOfLines = 0;
}

- (void)addBtns{
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height - 100, self.view.frame.size.width, 50)];
    [btn setTitle:@"A - Back" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
    [btn addTarget:self action:@selector(actionBack:) forControlEvents:UIControlEventTouchUpInside];
    btn.layer.borderColor = [UIColor redColor].CGColor;
    btn.layer.borderWidth = 2.0f;
    [self.view addSubview:btn];
}

- (void)actionBack:(UIButton *)sender {
    if ([self.name isEqualToString:@"presentViewController"]) {
        [self dismissViewControllerAnimated:YES completion:nil];
    } else {
        [super actionBack:sender];
    }
}

@end
