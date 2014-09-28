//
//  PSRDetailViewController.m
//  SimpleNotes
//
//  Created by Daniil Korotin on 24.04.14.
//  Copyright (c) 2014 Daniil Korotin. All rights reserved.
//

#import "PSRDetailViewController.h"
#import "PSRColorSelectViewController.h"
#import "PSRFontSelectViewController.h"

@interface PSRDetailViewController () <PSRColorSelectViewControllerDelegate, PSRFontSelectViewControllerDelegate>

@end

@implementation PSRDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [[UIColor alloc] initWithRed:0.9 green:0.9 blue:0.9 alpha:1];
    
    CGRect textViewRect = self.view.bounds;
    textViewRect.size.height -= 50;
    self.textView = [[UITextView alloc] initWithFrame:textViewRect];
    [self.view addSubview:self.textView];
    
    if (self.note) {
        self.textView.text = self.note.text;
        self.textView.textColor = self.note.color;
        self.textView.font = self.note.font;
        self.navigationItem.title = self.note.text;
    }
    
    CGRect selectButtonRect = textViewRect;
    selectButtonRect.origin.y += textViewRect.size.height;
    selectButtonRect.size.width = textViewRect.size.width / 2;
    selectButtonRect.size.height = 50;
    
    UIButton *selectColorButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [selectColorButton setFrame:selectButtonRect];
    [selectColorButton setTitle:@"Select Color" forState:UIControlStateNormal];
    [selectColorButton addTarget:self action:@selector(selectColor) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:selectColorButton];
    
    selectButtonRect.origin.x += selectButtonRect.size.width;
    UIButton *selectFontButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [selectFontButton setFrame:selectButtonRect];
    [selectFontButton setTitle:@"Select Font" forState:UIControlStateNormal];
    [selectFontButton addTarget:self action:@selector(selectFont) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:selectFontButton];
    
    UIBarButtonItem *doneButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(saveChanges)];
    self.navigationItem.rightBarButtonItem = doneButton;
}

-(void)selectColor {
    [self performSegueWithIdentifier:@"ColorSelect" sender:self];
}

-(void)selectFont {
    [self performSegueWithIdentifier:@"FontSelect" sender:self];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([[segue identifier] isEqualToString:@"ColorSelect"]) {
        PSRColorSelectViewController *controller = [segue destinationViewController];
        controller.delegate = self;
        controller.selectedColor = self.textView.textColor;
    } else if ([[segue identifier] isEqualToString:@"FontSelect"]) {
        PSRFontSelectViewController *controller = [segue destinationViewController];
        controller.delegate = self;
    }
}

-(void)colorSelectViewController:(PSRColorSelectViewController *)controller didFinishWithColor:(UIColor *)color {
    self.textView.textColor = color;
    [controller.navigationController popToViewController:self animated:YES];
}

-(void)fontSelectViewControler:(PSRFontSelectViewController *)controller didFinishWithFont:(UIFont *)font {
    if (font != nil) {
        self.textView.font = font;
    }
    [controller.navigationController popToViewController:self animated:YES];
}

- (void)saveChanges {
    self.note.font = self.textView.font;
    self.note.color = self.textView.textColor;
    self.note.text = self.textView.text;
    [self.navigationController popToRootViewControllerAnimated:YES];
}

@end
