//
//  PSRFontSelectViewController.h
//  SimpleNotes
//
//  Created by VitaliyP on 26.09.14.
//  Copyright (c) 2014 Daniil Korotin. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PSRFontSelectViewController;

@protocol PSRFontSelectViewControllerDelegate <NSObject>

-(void)fontSelectViewControler:(PSRFontSelectViewController *)controller didFinishWithFont:(UIFont *)font;

@end

@interface PSRFontSelectViewController : UITableViewController

@property (nonatomic, weak) id<PSRFontSelectViewControllerDelegate> delegate;

@end
