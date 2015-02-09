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
@property (nonatomic, strong) NSMutableArray *lines;

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
        self.loggerTextView.editable = NO;
        self.loggerTextView.textContainerInset = UIEdgeInsetsZero;
        self.loggerTextView.alpha = 0.9f;
        self.loggerTextView.backgroundColor = [UIColor clearColor];
        self.loggerTextView.backgroundColor = [UIColor redColor];

        [self.loggerWindow addSubview:self.loggerTextView];

        _lines = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)log:(NSString *)logMessage{

    [self.lines addObject:logMessage];
    if (self.lines.count > self.numberOfLines) {
        [self.lines removeObjectAtIndex:0];
    }

    NSString *logs = [self.lines componentsJoinedByString:@"\n"];
    self.loggerTextView.text = logs;
}

- (void)setNumberOfLines:(NSInteger)numberOfLines{
    _numberOfLines = numberOfLines;
}

@end
