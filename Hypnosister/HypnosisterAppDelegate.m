//
//  HypnosisterAppDelegate.m
//  Hypnosister
//
//  Created by Bin Liu on 8/8/14.
//  Copyright (c) 2014 Bin Liu. All rights reserved.
//

#import "HypnosisterAppDelegate.h"


@implementation HypnosisterAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    
    [[UIApplication sharedApplication] setStatusBarHidden:YES ];
    CGRect screenRect = [[self window] bounds];
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:screenRect];
    
    CGRect bigRect = screenRect;

    view = [[HypnosisView alloc] initWithFrame:screenRect];
    [scrollView addSubview:view];
    
    
    [scrollView setDelegate:self];
    
    [scrollView setMinimumZoomScale:1];
    [scrollView setMaximumZoomScale:5];
    [scrollView setContentSize:bigRect.size];
    //[scrollView setContentOffset:CGPointMake(bigRect.size.width/4, 0) animated:YES];
    [self.window addSubview:scrollView];
    

    BOOL succ  =  [view becomeFirstResponder];
    if(succ){
        NSLog(@"became first responder");
    }else{
        NSLog(@"cannot become first responder");
    }
    
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

-(UIView*) viewForZoomingInScrollView:(UIScrollView *)scrollView{
    return view;
}
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
