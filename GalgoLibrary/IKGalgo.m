//
//  Galgo.m
//  Galgo
//
//  Created by Andres on 1/5/15.
//  Copyright (c) 2015 Andres Canal. All rights reserved.
//

#import "IKGalgo.h"

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
        _loggerWindow = [[UIWindow alloc] initWithFrame:screenSize];
        _loggerWindow.windowLevel = UIWindowLevelStatusBar;
        _loggerWindow.userInteractionEnabled = NO;
        _loggerWindow.backgroundColor = [UIColor clearColor];
        _loggerWindow.hidden = NO;

        screenSize.size.height = screenSize.size.height - 20;
        screenSize.origin.y = 20;

        _loggerTextView = [[UITextView alloc] initWithFrame:screenSize];
        _loggerTextView.editable = NO;
        _loggerTextView.textContainerInset = UIEdgeInsetsZero;
        _loggerTextView.backgroundColor = [UIColor clearColor];

        [_loggerWindow addSubview:_loggerTextView];

        _backGroundColor = [UIColor lightGrayColor];
        _fontColor = [UIColor blackColor];
        _fontSize = 12;

        _lines = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)log:(NSString *)logMessage{

    [self.lines addObject:logMessage];
    if (self.lines.count > self.numberOfLines) {
        [self.lines removeObjectAtIndex:0];
    }

    UIColor *backColor = [self.backGroundColor colorWithAlphaComponent:0.40];

    NSMutableAttributedString *mutableAttributedString;
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] init];
    for (NSString *line in self.lines) {
        mutableAttributedString = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"\n%@",line]];
        [mutableAttributedString addAttribute:NSBackgroundColorAttributeName value:backColor range:NSMakeRange(1, line.length)];
        [mutableAttributedString addAttribute:NSForegroundColorAttributeName value:self.fontColor range:NSMakeRange(1, line.length)];
        [mutableAttributedString addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:self.fontSize] range:NSMakeRange(1, line.length)];
        [attributedString appendAttributedString:mutableAttributedString];
    }
    
    self.loggerTextView.attributedText = attributedString;
}

- (void)setNumberOfLines:(NSInteger)numberOfLines{
    _numberOfLines = numberOfLines;
}

@end
