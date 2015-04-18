//
//  AnimationView.m
//  cgrect
//
//  Created by macbook on 2014/09/13.
//  Copyright (c) 2014年 macbook. All rights reserved.
//

#import "AnimationView.h"

BOOL isGreen[7][10]; // 方眼のタッチ有無を格納する配列

@implementation AnimationView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
    }
    // 配列初期化
    for(int i=0;i<7;i++){
        for(int j=0;j<10;j++){
            isGreen[i][j]=NO;
        }
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    // 描画管理の構造体contextを初期化
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    // 色を定義
    CGFloat white[4] = {0.0f, 0.0f, 0.0f, 0.0f}; // 透明
    CGFloat green[4] = {0.0f, 1.0f, 0.0f, 0.7f}; // 半透明
    CGFloat cyan[4] = {0.5f, 0.8f, 1.0f, 1.0f};
    
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
    
    // フラグに応じて矩形を描画、イベントで一部再読み込みされる
    for(int i=0;i<7;i++){
        for(int j=0;j<10;j++){
            if(isGreen[i][j]==YES){
                CGContextSetFillColor(context, green); // 色指定
                CGContextFillRect(context, CGRectMake(i*50,j*50,50,50)); // 範囲塗りつぶし
            }else{
                CGContextSetFillColor(context, white);
                CGContextFillRect(context, CGRectMake(i*50,j*50,50,50));
            }
            
        }
    }
    
    // テキストを描画
    UIFont *font = [UIFont fontWithName:@"AvenirNext-Italic" size:20.0f];
    [[UIColor colorWithRed:.8f green:0 blue:0 alpha:1.0f] set];
    [@"touch any square" drawAtPoint:CGPointMake(50, 300) withAttributes:@{NSFontAttributeName:font}];
}

// タッチイベント
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    // タッチ位置を点で取得
    CGPoint pt = [[touches anyObject] locationInView:self];
    for(int i=0;i<7;i++){
        for(int j=0;j<10;j++){
            // タッチ位置と方眼位置を比較
            if (CGRectContainsPoint(CGRectMake(i*50,j*50,50,50),pt)) {
                if(isGreen[i][j]==NO){
                    isGreen[i][j]=YES;
                }else{
                    isGreen[i][j]=NO;
                }
                // 範囲を限定してCGRectを再読み込・再描画
                [self setNeedsDisplayInRect:CGRectMake(i*50,j*50,50,50)];
            }
        }
    }
}


@end
