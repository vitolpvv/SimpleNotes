//
//  PSRColorSelectSliderView.h
//  SimpleNotes
//
//  Created by VitaliyP on 26.09.14.
//  Copyright (c) 2014 Daniil Korotin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PSRColorSelectSliderView : UIView

@property(nonatomic, strong) UIColor *color;

@property(nonatomic, weak) IBOutlet UISlider *redSlider;
@property(nonatomic, weak) IBOutlet UISlider *greenSleder;
@property(nonatomic, weak) IBOutlet UISlider *blueSlider;

@end
