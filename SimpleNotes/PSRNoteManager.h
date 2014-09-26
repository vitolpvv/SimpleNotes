//
//  PSRNoteManager.h
//  SimpleNotes
//
//  Created by Daniil Korotin on 24.04.14.
//  Copyright (c) 2014 Daniil Korotin. All rights reserved.
//

#import "PSRNote.h"

@interface PSRNoteManager : NSObject {
    NSMutableArray *_notes;
}

@property (nonatomic, strong, readonly) NSArray *notes;

+ (instancetype)sharedManager;

- (void)saveToFile;
- (void)loadFromFile;
- (void)addOrUpdateNote:(PSRNote *)note;
- (void)removeNote:(PSRNote *)note;

@end
