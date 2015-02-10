//
//  Galgo.h
//  Galgo
//
//  Created by Andres on 1/5/15.
//  Copyright (c) 2015 Andres Canal. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface IKGalgo : NSObject

@property (nonatomic) NSInteger numberOfLines;
@property (nonatomic, strong) UIColor *backGroundColor;
@property (nonatomic, strong) UIColor *fontColor;
@property (nonatomic) NSInteger fontSize;

+ (id)sharedLogger;
- (void)log:(NSString *)logMessage;
@end
