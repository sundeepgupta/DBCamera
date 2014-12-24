//
//  DBHoleView.m
//  DBCamera
//
//  Created by Sundeep Gupta on 2014-12-24.
//  Copyright (c) 2014 PSSD - Daniele Bogo. All rights reserved.
//

#import "DBHoleView.h"

@interface DBHoleView ()
@property (nonatomic, retain) UIColor *fillColor;
@property CGRect holeFrame;
@end

@implementation DBHoleView

- (instancetype)initWithFrame:(CGRect)frame fillColor:(UIColor *)fillColor holeFrame:(CGRect)holeFrame {
    self = [super initWithFrame:frame];
    if (self) {
        self.opaque = NO;
        self.fillColor = fillColor;
        self.holeFrame = holeFrame;
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    [self.fillColor setFill];
    UIRectFill(rect);
    
    CGRect intersectionFrame = CGRectIntersection(self.holeFrame, rect);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    if(CGRectIntersectsRect(intersectionFrame, rect)) {
        CGContextAddEllipseInRect(context, intersectionFrame);
        CGContextClip(context);
        CGContextClearRect(context, intersectionFrame);
        CGContextSetFillColorWithColor(context, [UIColor clearColor].CGColor);
        CGContextFillRect( context, intersectionFrame);
    }
}


@end
