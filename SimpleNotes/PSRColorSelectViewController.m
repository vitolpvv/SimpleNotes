//
//  PSRColorSelectViewController.m
//  SimpleNotes
//
//  Created by VitaliyP on 26.09.14.
//  Copyright (c) 2014 Daniil Korotin. All rights reserved.
//

#import "PSRColorSelectViewController.h"
#import "PSRColorSelectSliderView.h"

@implementation PSRColorSelectViewController

-(void)viewDidLoad {
    [super viewDidLoad];
    self.colorSelectView.color = self.selectedColor;
}

- (IBAction)didPressDoneButton:(UIBarButtonItem *)sender {
    [self.delegate colorSelectViewController:self didFinishWithColor:self.colorSelectView.color];
}


@end
