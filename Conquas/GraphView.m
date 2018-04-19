//
//  GraphView.m
//  Conquas
//
//  Created by Aparna Reddy Challa on 05/09/12.
//  Copyright (c) 2012 MobTwo Pte Ltd. All rights reserved.
//

#import "GraphView.h"

@implementation GraphView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}




// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect
 {
 CGContextRef context = UIGraphicsGetCurrentContext();
 CGContextSetLineWidth(context, 0.6);
 CGContextSetStrokeColorWithColor(context, [[UIColor lightGrayColor] CGColor]);
 // How many lines?
 int howMany = (kDefaultGraphWidth - kOffsetX) / kStepX;
 // Here the lines go
 for (int i = 1; i < howMany; i++)
 {
 CGContextMoveToPoint(context,kOffsetX + i * kStepX, kGraphTop);
 CGContextAddLineToPoint(context, kOffsetX + i * kStepX,kGraphBottom);
     
     
 }
     int howManyHorizontal = (kGraphBottom - kGraphTop - kOffsetY) / kStepY;
     for (int i = 1; i <= howManyHorizontal; i++)
     {
         CGContextMoveToPoint(context, kOffsetX, kGraphBottom - kOffsetY - i * kStepY);
         CGContextAddLineToPoint(context, kDefaultGraphWidth, kGraphBottom - kOffsetY - i * kStepY);
     }     
CGContextStrokePath(context);
 }

@end
