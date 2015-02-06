//
//  ViewController.m
//  Galgo
//
//  Created by Andres on 1/5/15.
//  Copyright (c) 2015 Andres Canal. All rights reserved.
//

#include <stdlib.h>
#import "ViewController.h"
#import "IKGalgo.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *label;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    IKGalgo *galgo = [IKGalgo sharedLogger];
}

- (void) viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
}
- (IBAction)touch:(id)sender {
    self.label.text = [@[@"SARASA", @"tururu",@"Coliflor"] objectAtIndex:arc4random_uniform (2)];
}

@end
