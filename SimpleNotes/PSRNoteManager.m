//
//  PSRNoteManager.m
//  SimpleNotes
//
//  Created by Daniil Korotin on 24.04.14.
//  Copyright (c) 2014 Daniil Korotin. All rights reserved.
//

#import "PSRNoteManager.h"

@implementation PSRNoteManager

+ (instancetype)sharedManager {
    static dispatch_once_t token;
    static id shared = nil;
    dispatch_once(&token, ^{
        shared = [[super alloc] init];
    });
    
    return shared;
}

- (id)init {
    self = [super init];
    if (self) {
        _notes = [[NSMutableArray alloc] init];
    }
    return self;
}

- (NSString *)fileName {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *cachePath = [paths objectAtIndex:0];
    
    BOOL isDir = NO;
    NSError *error;
    
    if (! [[NSFileManager defaultManager] fileExistsAtPath:cachePath isDirectory:&isDir] && isDir == NO) {
        [[NSFileManager defaultManager] createDirectoryAtPath:cachePath withIntermediateDirectories:NO attributes:nil error:&error];
    }
    
    return [NSString stringWithFormat:@"%@/mynotes.data", cachePath];
}

- (void)loadFromFile {
    NSData *frozenInfo = [NSData dataWithContentsOfFile: [self fileName]];
    _notes = [NSKeyedUnarchiver unarchiveObjectWithData:frozenInfo];
    
    if (!self.notes) {
        _notes = [[NSMutableArray alloc] init];
    }
}

-(void)saveToFile {
    NSData *frozenInfo = [NSKeyedArchiver archivedDataWithRootObject:self.notes];
    [frozenInfo writeToFile:[self fileName] atomically:NO];
}

- (PSRNote *)findNoteByDate:(NSDate *)date {
    for (PSRNote *note in self.notes) {
        if ([note.date isEqualToDate:date]) {
            return note;
        }
    }
    
    return nil;
}

-(void)addOrUpdateNote:(PSRNote *)note {
    PSRNote *noteToUpdate = [self findNoteByDate:note.date];
    
    if (noteToUpdate) {
        noteToUpdate.text = note.text;
        noteToUpdate.color = note.color;
    } else {
        [_notes insertObject:note atIndex:0];
    }
}

-(void)removeNote:(PSRNote *)note {
    PSRNote *noteToDelete = [self findNoteByDate:note.date];
    
    if (noteToDelete) {
        [_notes removeObject:noteToDelete];
    }
}

@end
