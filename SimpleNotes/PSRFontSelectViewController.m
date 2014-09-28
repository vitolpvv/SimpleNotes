//
//  PSRFontSelectViewController.m
//  SimpleNotes
//
//  Created by VitaliyP on 26.09.14.
//  Copyright (c) 2014 Daniil Korotin. All rights reserved.
//

#import "PSRFontSelectViewController.h"

@interface PSRFontSelectViewController ()

@property (nonatomic, strong) NSMutableArray *allFonts;
@property (nonatomic, strong) UIFont *font;

@end

@implementation PSRFontSelectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.font = nil;
    
    self.allFonts = [NSMutableArray new];
    NSArray *allFontsFamilies = [UIFont familyNames];    
    for (NSString *fontsFamily in allFontsFamilies) {
        [self.allFonts addObjectsFromArray:[UIFont fontNamesForFamilyName:fontsFamily]];
    }
    [self.allFonts sortUsingComparator:^NSComparisonResult(id obj1, id obj2) {
        return [(NSString *)obj1 caseInsensitiveCompare:(NSString *)obj2];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.allFonts.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"fontSelectCell"
                                                            forIndexPath:indexPath];
    cell.textLabel.text = [self.allFonts objectAtIndex:indexPath.row];
    cell.textLabel.font = [UIFont fontWithName:cell.textLabel.text
                                          size:[UIFont systemFontSize]];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    self.font = [UIFont fontWithName:self.allFonts[indexPath.row]
                                size:[UIFont systemFontSize]];
}

- (IBAction)didPressDoneButton:(UIBarButtonItem *)sender {
    [self.delegate fontSelectViewControler:self didFinishWithFont:self.font];
}

@end
