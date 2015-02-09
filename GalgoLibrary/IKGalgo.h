//
//  Galgo.h
//  Galgo
//
//  Created by Andres on 1/5/15.
//  Copyright (c) 2015 Andres Canal. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface IKGalgo : NSObject

@property (nonatomic) NSInteger numberOfLines;

+ (id)sharedLogger;
- (void)log:(NSString *)logMessage;
@end
