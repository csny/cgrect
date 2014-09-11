//
//  MyDrawView.m
//  cgrect
//
//  Created by macbook on 2014/09/10.
//  Copyright (c) 2014年 macbook. All rights reserved.
//

#import "MyDrawView.h"

@implementation MyDrawView


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    // 描画管理の構造体contextを初期化
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    // 色を定義
    CGFloat red[4] = {1.0f, 0.0f, 0.0f, 1.0f};
    CGFloat blue[4] = {0.0f, 0.0f, 1.0f, 1.0f};
    CGFloat cyan[4] = {0.5f, 0.8f, 1.0f, 1.0f};
    CGFloat green[4] = {0.0f, 1.0f, 0.0f, 1.0f};
    
    // グリッドを描画
    CGContextSetStrokeColor(context, cyan);
    CGContextBeginPath(context);
    CGContextSetLineWidth(context, .5f);
    for (int y = 50; y < self.bounds.size.height; y+=50) {
        CGContextMoveToPoint(context, 0, y);
        CGContextAddLineToPoint(context, self.bounds.size.width, y);
    }
    for (int x = 50; x < self.bounds.size.width; x+=50) {
        CGContextMoveToPoint(context, x, 0);
        CGContextAddLineToPoint(context, x, self.bounds.size.height);
    }
    CGContextStrokePath(context);
    
    // 矩形を描画
    CGContextSetFillColor(context, green);
    CGContextFillRect(context, CGRectMake(50, 50, 50, 50));
    
    // 円を描画
    CGContextSetFillColor(context, blue);
    CGContextFillEllipseInRect(context, CGRectMake(100, 100, 50, 100));
    
    // 多角形を描画
    CGContextSetFillColor(context, red);
    CGContextBeginPath(context);
    CGContextMoveToPoint(context, 200, 150);
    CGContextAddLineToPoint(context, 250, 200);
    CGContextAddLineToPoint(context, 250, 100);
    CGContextFillPath(context);
    
    // テキストを描画
    UIFont *font = [UIFont fontWithName:@"AvenirNext-Italic" size:20.0f];
    [[UIColor colorWithRed:.8f green:0 blue:0 alpha:1.0f] set];
    [@"click green square" drawAtPoint:CGPointMake(50, 300) withAttributes:@{NSFontAttributeName:font}];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    CGPoint pt = [[touches anyObject] locationInView:self];
    if (CGRectContainsPoint(CGRectMake(50,50,50,50),pt)) {
        NSLog(@"あたり");
    }
}

@end