//
//  PXViewController.m
//  UIAlertController-BetterConstructor
//
//  Created by Daniel Blakemore on 04/13/2015.
//  Copyright (c) 2014 Daniel Blakemore. All rights reserved.
//

#import "PXViewController.h"

#import <UIAlertController-BetterConstructor/UIAlertController+BetterConstructor.h>

@interface PXViewController ()

@end

@implementation PXViewController
{
    UIButton * _singleButton;
    UIButton * _doubleButton;
    UIButton * _sheetButton;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [[UIButton appearance] setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    
    // buttons
    _singleButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [_singleButton setFrame:CGRectMake(80, 100, 150, 40)];
    [_singleButton setTitle:@"Single" forState:UIControlStateNormal];
    [_singleButton addTarget:self action:@selector(singlePressed) forControlEvents:UIControlEventTouchUpInside];
    [[self view] addSubview:_singleButton];
    
    _doubleButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [_doubleButton setFrame:CGRectMake(80, 240, 150, 40)];
    [_doubleButton setTitle:@"Double" forState:UIControlStateNormal];
    [_doubleButton addTarget:self action:@selector(doublePressed) forControlEvents:UIControlEventTouchUpInside];
    [[self view] addSubview:_doubleButton];
    
    _sheetButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [_sheetButton setFrame:CGRectMake(80, 380, 150, 40)];
    [_sheetButton setTitle:@"Sheet" forState:UIControlStateNormal];
    [_sheetButton addTarget:self action:@selector(sheetPressed) forControlEvents:UIControlEventTouchUpInside];
    [[self view] addSubview:_sheetButton];
}

- (void)singlePressed
{
    UIAlertController * ac = [UIAlertController alertControllerWithTitle:@"Single Button" message:@"This is a single button Alert." style:UIAlertControllerStyleAlert cancelButtonTitle:@"Okay" cancelButtonBlock:^(UIAlertAction *action) {
        NSLog(@"single button pressed");
    } destructiveButtonTitle:nil destructiveButtonBlock:nil otherButtonTitlesAndBlocks:nil];
    [self presentViewController:ac animated:true completion:^{
        
    }];
}

- (void)doublePressed
{
    UIAlertController * ac = [UIAlertController alertControllerWithTitle:@"Double Button" message:@"This is a double button Alert." style:UIAlertControllerStyleAlert cancelButtonTitle:@"Blue" cancelButtonBlock:^(UIAlertAction *action) {
        [_doubleButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    } destructiveButtonTitle:nil destructiveButtonBlock:nil otherButtonTitlesAndBlocks:@"Orange", ^(UIAlertAction *action) {
        [_doubleButton setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    }, nil];
    [self presentViewController:ac animated:true completion:^{
        
    }];
}

- (void)sheetPressed
{
    UIAlertController * ac = [UIAlertController alertControllerWithTitle:@"Sheet" message:nil style:UIAlertControllerStyleActionSheet cancelButtonTitle:@"Green" cancelButtonBlock:^(UIAlertAction *action) {
        [_sheetButton setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
    } destructiveButtonTitle:@"Red" destructiveButtonBlock:^(UIAlertAction *action) {
        [_sheetButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    } otherButtonTitlesAndBlocks:@"Yellow", ^(UIAlertAction *action) {
        [_sheetButton setTitleColor:[UIColor yellowColor] forState:UIControlStateNormal];
    }, nil];
    [self presentViewController:ac animated:true completion:^{
        
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
