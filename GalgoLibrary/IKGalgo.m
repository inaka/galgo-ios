//
//  Galgo.m
//  Galgo
//
//  Created by Andres on 1/5/15.
//  Copyright (c) 2015 Andres Canal. All rights reserved.
//

#import "IKGalgo.h"
#import <UIKit/UIKit.h>

@interface IKGalgo()

@property (nonatomic, strong) UITextView *loggerTextView;
@property (nonatomic, strong) UIWindow *loggerWindow;
@end

@implementation IKGalgo

+ (id)sharedLogger {
    static IKGalgo *sharedLogger = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedLogger = [[self alloc] init];
    });
    return sharedLogger;
}

- (id)init {
    if (self = [super init]) {
        CGRect screenSize = [UIScreen mainScreen].bounds;
        self.loggerWindow = [[UIWindow alloc] initWithFrame:screenSize];
        self.loggerWindow.windowLevel = UIWindowLevelStatusBar;
        self.loggerWindow.userInteractionEnabled = NO;
        self.loggerWindow.backgroundColor = [UIColor clearColor];
        self.loggerWindow.hidden = NO;
        
        screenSize.size.height = screenSize.size.height - 20;
        screenSize.origin.y = 20;
        
        self.loggerTextView = [[UITextView alloc] initWithFrame:screenSize];
        self.loggerTextView.text = @"HOLA HOLA";
        self.loggerTextView.backgroundColor = [UIColor clearColor];

        [self.loggerWindow addSubview:self.loggerTextView];
    }
    return self;
}

@end
