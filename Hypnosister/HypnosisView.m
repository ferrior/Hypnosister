//
//  HypnosisView.m
//  Hypnosister
//
//  Created by Bin Liu on 8/8/14.
//  Copyright (c) 2014 Bin Liu. All rights reserved.
//

#import "HypnosisView.h"

@implementation HypnosisView

@synthesize circleColor;

-(id) initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    
    if(self){
        [self setBackgroundColor:[UIColor clearColor]];
        [self setCircleColor:[UIColor lightGrayColor]];
    }
    
    return self;
}

-(void) setCircleColor:(UIColor *)clr{
    circleColor = clr;
    [self setNeedsDisplay];
}

-(BOOL) canBecomeFirstResponder{
    return YES;
}

-(void)motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event{
    NSLog(@"motionBegan");
    if(motion ==  UIEventSubtypeMotionShake){
        NSLog(@"device started shaking1");
        [self setCircleColor:[UIColor redColor]];
    }
}


-(void) drawRect:(CGRect)rect{
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGRect bounds = [self bounds];
    
    CGPoint center;
    center.x = bounds.origin.x + bounds.size.width/2;
    center.y = bounds.origin.y + bounds.size.height/2;
    
    float maxRadius =  hypot(bounds.size.width,bounds.size.height)/2;
    
    CGContextSetLineWidth(ctx, 5);
    
   // CGContextSetRGBStrokeColor(ctx, 0.6, 0.6, 0.6, 1.0);
    [[self circleColor] setStroke];
    
    for(float currentRadius = maxRadius; currentRadius > 0; currentRadius -=20){
        CGContextAddArc(ctx, center.x, center.y, currentRadius, 0, M_PI * 2, YES);
        CGContextStrokePath(ctx);
    }
    
    NSString* text = @"You are getting sleepy.";
    UIFont *font = [UIFont boldSystemFontOfSize:28];
    
    CGRect textRect;
    
    textRect.size = [text sizeWithAttributes:@{NSFontAttributeName:font}];

    
    textRect.origin.x = center.x - textRect.size.width/2;
    textRect.origin.y = center.y - textRect.size.height/2;
    
    [[UIColor blackColor] setFill];
    
    CGSize offset = CGSizeMake(4, 3);
    CGColorRef color = [[UIColor darkGrayColor] CGColor];
    CGContextSetShadowWithColor(ctx, offset, 2.0, color);
    
    [text drawInRect:textRect withAttributes:@{NSFontAttributeName:font}];
    
    
}
@end
