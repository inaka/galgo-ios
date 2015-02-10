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
@property (weak, nonatomic) IBOutlet UIButton *blackButton;
@property (weak, nonatomic) IBOutlet UIButton *whiteButton;
@property (weak, nonatomic) IBOutlet UIButton *redButton;

@property (weak, nonatomic) IBOutlet UIButton *blackBackGround;
@property (weak, nonatomic) IBOutlet UIButton *whiteBackGround;
@property (weak, nonatomic) IBOutlet UIButton *redBackGround;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    IKGalgo *galgo = [IKGalgo sharedLogger];
    [galgo setNumberOfLines:10];
    [galgo setBackGroundColor:[UIColor blackColor]];
    [galgo setFontColor:[UIColor whiteColor]];
    [galgo setFontSize:16];
    
    [galgo log:@"Galgo Started"];
    [galgo log:@"Showing First View Controller"];
}

- (IBAction)showAlertView{
    UIAlertController *alertView = [UIAlertController alertControllerWithTitle:@"Test"
                                                                       message:@"Yep This Works"
                                                                preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                               handler:^(UIAlertAction * action){
            [alertView dismissViewControllerAnimated:YES completion:nil];
            [[IKGalgo sharedLogger] log:@"Dismiss Alert Controller"];
    }];
    
    [alertView addAction:ok];
    [self presentViewController:alertView animated:YES completion:nil];
    
    [[IKGalgo sharedLogger] log:@"Show Alert Controller"];

}

- (void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
}

- (IBAction)changeFontColor:(id)sender {
    if (sender == self.blackButton) {
        [[IKGalgo sharedLogger] setFontColor:[UIColor blackColor]];
        [[IKGalgo sharedLogger] log:@"Font: Black Color"];
    }
    
    if (sender == self.whiteButton) {
        [[IKGalgo sharedLogger] setFontColor:[UIColor whiteColor]];
        [[IKGalgo sharedLogger] log:@"Font: White Color"];
    }
    
    if (sender == self.redButton) {
        [[IKGalgo sharedLogger] setFontColor:[UIColor redColor]];
        [[IKGalgo sharedLogger] log:@"Font: Red Color"];
    }
}

- (IBAction)changeBackgroundColor:(id)sender {
    if (sender == self.blackBackGround) {
        [[IKGalgo sharedLogger] setBackGroundColor:[UIColor blackColor]];
        [[IKGalgo sharedLogger] log:@"Back: Black Color"];
    }
    
    if (sender == self.whiteBackGround) {
        [[IKGalgo sharedLogger] setBackGroundColor:[UIColor whiteColor]];
        [[IKGalgo sharedLogger] log:@"Back: White Color"];
    }
    
    if (sender == self.redBackGround) {
        [[IKGalgo sharedLogger] setBackGroundColor:[UIColor redColor]];
        [[IKGalgo sharedLogger] log:@"Back: Red Color"];
    }
}

@end
