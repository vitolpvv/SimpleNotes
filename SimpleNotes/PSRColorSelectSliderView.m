//
//  PSRColorSelectSliderView.m
//  SimpleNotes
//
//  Created by VitaliyP on 26.09.14.
//  Copyright (c) 2014 Daniil Korotin. All rights reserved.
//

#import "PSRColorSelectSliderView.h"

@implementation PSRColorSelectSliderView

-(IBAction)didChangeSliderValue:(id)sender {
    self.color = [[UIColor alloc] initWithRed: self.redSlider.value green:self.greenSleder.value blue:self.blueSlider.value alpha:1];
}

-(void)setColor:(UIColor *)color {
    if (_color == nil) {
        CGFloat red, green, blue, alpha;
        [color getRed:&red green:&green blue:&blue alpha:&alpha];
        self.redSlider.value = red;
        self.greenSleder.value = green;
        self.blueSlider.value = blue;
    }
    _color = color;
    self.backgroundColor = self.color;
}

@end
