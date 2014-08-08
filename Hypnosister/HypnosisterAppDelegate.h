//
//  HypnosisterAppDelegate.h
//  Hypnosister
//
//  Created by Bin Liu on 8/8/14.
//  Copyright (c) 2014 Bin Liu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HypnosisView.h"

@interface HypnosisterAppDelegate : UIResponder <UIApplicationDelegate, UIScrollViewDelegate>{
    HypnosisView * view;
}

@property (strong, nonatomic) UIWindow *window;

@end
