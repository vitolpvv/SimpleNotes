//
//  PSRDetailViewController.m
//  SimpleNotes
//
//  Created by Daniil Korotin on 24.04.14.
//  Copyright (c) 2014 Daniil Korotin. All rights reserved.
//

#import "PSRDetailViewController.h"
#import "PSRColorSelectViewController.h"

@interface PSRDetailViewController () <PSRColorSelectViewControllerDelegate>

@end

@implementation PSRDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor lightGrayColor];
    CGRect textViewRect = self.view.bounds;
    textViewRect.size.height /= 2;
    self.textView = [[UITextView alloc] initWithFrame:textViewRect];
    [self.view addSubview:self.textView];
    
    
    
    if (self.note) {
        self.textView.text = self.note.text;
        self.textView.textColor = self.note.color;
    }
    
    self.navigationItem.title = self.note.text;
    
    CGRect selectColorButtonRect = textViewRect;
    selectColorButtonRect.origin.y += textViewRect.size.height;
    selectColorButtonRect.size.width = textViewRect.size.width / 2;
    selectColorButtonRect.size.height = 50;
    
    UIButton *selectColorButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [selectColorButton setFrame:selectColorButtonRect];
    [selectColorButton setTitle:@"Select Text Color" forState:UIControlStateNormal];
    [selectColorButton addTarget:self action:@selector(selectColor) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:selectColorButton];
    
    UIBarButtonItem *cancelButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(cancel)];
    self.navigationItem.rightBarButtonItem = cancelButton;
}

-(IBAction)selectColor {    
    PSRColorSelectViewController *selectColorVC = [[UIStoryboard storyboardWithName:@"Storyboard" bundle:nil] instantiateViewControllerWithIdentifier:@"selectColorViewController"];
    selectColorVC.delegate = self;
    selectColorVC.selectedColor = self.note.color;
    [self.navigationController pushViewController:selectColorVC animated:YES];
}

-(void)colorSelectViewController:(PSRColorSelectViewController *)controller didFinishWithColor:(UIColor *)color {
    self.note.color = color;
    self.textView.textColor = color;
    [controller.navigationController popToViewController:self animated:YES];
}

- (void)cancel {
    
}

- (void)viewWillDisappear:(BOOL)animated {
    self.note.text = self.textView.text;
}

@end
