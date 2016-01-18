//
//  ViewController.m
//  Deprocrastinator
//
//  Created by Richard Martin on 2016-01-18.
//  Copyright © 2016 Richard Martin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property NSMutableArray *cells;
@property (weak, nonatomic) IBOutlet UITableView *taskTableView;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.cells = [NSMutableArray new];
}

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.cells.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CellID"];
    cell.textLabel.text = [self.cells objectAtIndex:indexPath.row];
    return cell;
}
- (IBAction)onAddPressed:(UIButton *)sender {
    [self.cells addObject:self.textField.text];
    [self.taskTableView reloadData];
    
}

@end
