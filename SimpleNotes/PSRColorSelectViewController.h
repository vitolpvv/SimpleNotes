//
//  PSRColorSelectViewController.h
//  SimpleNotes
//
//  Created by VitaliyP on 26.09.14.
//  Copyright (c) 2014 Daniil Korotin. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PSRColorSelectViewController;
@protocol PSRColorSelectViewControllerDelegate <NSObject>

-(void)colorSelectViewController:(PSRColorSelectViewController *)controller didFinishWithColor:(UIColor *)color;

@end

@class PSRColorSelectSliderView;
@interface PSRColorSelectViewController : UIViewController

@property (weak, nonatomic) IBOutlet PSRColorSelectSliderView *colorSelectView;
@property(nonatomic, strong) UIColor *selectedColor;
@property(nonatomic, weak)id<PSRColorSelectViewControllerDelegate> delegate;

@end
