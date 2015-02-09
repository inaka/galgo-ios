//
//  SecondViewController.m
//  Galgo
//
//  Created by Andres on 1/5/15.
//  Copyright (c) 2015 Andres Canal. All rights reserved.
//

#import "SecondViewController.h"
#import "IKGalgo.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[IKGalgo sharedLogger] log:@"Changed View Controller"];
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [[IKGalgo sharedLogger] log:@"Removing View Controller"];
}

@end
