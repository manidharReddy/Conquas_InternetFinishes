//
//  GraphView1.m
//  Conquas
//
//  Created by Aparna Reddy Challa on 05/09/12.
//  Copyright (c) 2012 MobTwo Pte Ltd. All rights reserved.
//

#import "GraphView1.h"

@implementation GraphView1

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, 0.6);
    CGContextSetStrokeColorWithColor(context, [[UIColor lightGrayColor] CGColor]);
    int howMany = (kDefaultGraphWidth - kOffsetX) / kStepX;
    // Here the lines go
    for (int i = 0; i < howMany; i++)
    {
        CGContextMoveToPoint(context,kOffsetX + i * kStepX, kGraphTop);
        CGContextAddLineToPoint(context, kOffsetX + i * kStepX,kGraphBottom);
        
        
    }
    int howManyHorizontal = (kGraphBottom - kGraphTop - kOffsetY) / kStepY;
    for (int i = 0; i <= howManyHorizontal; i++)
    {
        CGContextMoveToPoint(context, kOffsetX, kGraphBottom - kOffsetY - i * kStepY);
        CGContextAddLineToPoint(context, kDefaultGraphWidth, kGraphBottom - kOffsetY - i * kStepY);
    }
    
    int howManyVertical = (kGraphBottom1 -kGraphTop1 - kOffsetX1) / kStepX1;
     for (int i = 0; i <= howManyVertical; i++)
     {
     CGContextMoveToPoint(context, kOffsetY1,kGraphBottom1 - kOffsetX1 -i * kStepX1 );
     CGContextAddLineToPoint(context, kDefaultGraphWidth1 ,kGraphBottom1 - kOffsetX1 - i * kStepX1);
     }
    CGContextStrokePath(context);
}

@end
