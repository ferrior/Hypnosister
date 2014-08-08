//
//  HypnosisView.m
//  Hypnosister
//
//  Created by Bin Liu on 8/8/14.
//  Copyright (c) 2014 Bin Liu. All rights reserved.
//

#import "HypnosisView.h"

@implementation HypnosisView

-(id) initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    
    if(self){
        [self setBackgroundColor:[UIColor clearColor]];
    }
    
    return self;
}
-(void) drawRect:(CGRect)rect{
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGRect bounds = [self bounds];
    
    CGPoint center;
    center.x = bounds.origin.x + bounds.size.width/2;
    center.y = bounds.origin.y + bounds.size.height/2;
    
    float maxRadius =  hypot(bounds.size.width,bounds.size.height)/2;
    
    CGContextSetLineWidth(ctx, 5);
    
    CGContextSetRGBStrokeColor(ctx, 0.6, 0.6, 0.6, 1.0);
    
    for(float currentRadius = maxRadius; currentRadius > 0; currentRadius -=20){
        CGContextAddArc(ctx, center.x, center.y, currentRadius, 0, M_PI * 2, YES);
    
        CGContextStrokePath(ctx);
    }
}
@end
