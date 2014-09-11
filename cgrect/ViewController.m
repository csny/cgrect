//
//  ViewController.m
//  cgrect
//
//  Created by macbook on 2014/09/10.
//  Copyright (c) 2014年 macbook. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
    // UIViewクラスをサイズを指定して生成
    MyDrawView *drawView = [[MyDrawView alloc] initWithFrame:self.view.bounds];
    // サブビューの追加
    [self.view addSubview:drawView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
