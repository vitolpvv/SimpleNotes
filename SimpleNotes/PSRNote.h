//
//  PSRNote.h
//  SimpleNotes
//
//  Created by Daniil Korotin on 24.04.14.
//  Copyright (c) 2014 Daniil Korotin. All rights reserved.
//

@interface PSRNote : NSObject <NSCoding>

@property (nonatomic, strong) NSString *text;
@property (nonatomic, strong) NSDate *date;
@property (nonatomic, strong) UIColor *color;
@property (nonatomic, strong) UIFont *font;

@end
