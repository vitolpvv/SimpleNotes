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

@end

@implementation PSRFontSelectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.allFonts = [NSMutableArray new];
    NSArray *allFontsFamilies = [UIFont familyNames];    
    for (NSString *fontsFamily in allFontsFamilies) {
        [self.allFonts addObjectsFromArray:[UIFont fontNamesForFamilyName:fontsFamily]];
    }
    [self.allFonts sortUsingComparator:^NSComparisonResult(id obj1, id obj2) {
        return [(NSString *)obj1 caseInsensitiveCompare:(NSString *)obj2];
    }];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return self.allFonts.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"fontSelectCell" forIndexPath:indexPath];
    // Configure the cell...
    cell.textLabel.text = [self.allFonts objectAtIndex:indexPath.row];
    cell.textLabel.font = [UIFont fontWithName:cell.textLabel.text size:[UIFont systemFontSize]];
    
    return cell;
}

- (IBAction)didPressDoneButton:(UIBarButtonItem *)sender {
    UIFont *font = nil;
    NSIndexPath *index = [self.tableView indexPathForSelectedRow];
    if (index != nil) {
        font = [UIFont fontWithName:[self.allFonts objectAtIndex:index.row] size:[UIFont systemFontSize]];
    }
    [self.delegate fontSelectViewControler:self didFinishWithFont:font];
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
