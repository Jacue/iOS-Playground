//
//  ScrollViewController.m
//  DemoUIScrollViewZoomScale
//
//  Created by Chris Hu on 15/12/31.
//  Copyright © 2015年 icetime17. All rights reserved.
//

#import "ScrollViewController.h"

@interface ScrollViewController () <UIScrollViewDelegate>

@end

@implementation ScrollViewController {

    UIScrollView *_scrollView;
    UIImageView *_imageView;

}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self addScrollView];
    [self addBtnBack];
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    _scrollView.zoomScale = _globalZoomScale;
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - scrollView

- (void)addScrollView {
    _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(20, 100, self.view.frame.size.width - 40, 400)];
    _scrollView.backgroundColor = [UIColor lightGrayColor];
    _scrollView.bounces = NO;
    _scrollView.delegate = self;
    _scrollView.minimumZoomScale = 1.f;
    _scrollView.maximumZoomScale = 10.f;
    [self.view addSubview:_scrollView];
    
    _imageView = [[UIImageView alloc] initWithFrame:_scrollView.bounds];
    _imageView.image = [UIImage imageNamed:@"Model.jpg"];
    [_scrollView addSubview:_imageView];
}

#pragma mark - <UIScrollViewDelegate>

- (nullable UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    return _imageView;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    NSLog(@"contentOffset : %@", NSStringFromCGPoint(scrollView.contentOffset));
}

- (void)scrollViewDidZoom:(UIScrollView *)scrollView {
    NSLog(@"zoomScale : %f", scrollView.zoomScale);
}

#pragma mark - button back

- (void)addBtnBack {
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 50, 50, 30)];
    [btn setTitle:@"Back" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
    [btn addTarget:self action:@selector(back:) forControlEvents:UIControlEventTouchUpInside];
    btn.layer.borderColor = [UIColor redColor].CGColor;
    btn.layer.borderWidth = 2.0f;
    [self.view addSubview:btn];
}

- (void)back:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
