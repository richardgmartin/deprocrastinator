//
//  ViewController.m
//  Deprocrastinator
//
//  Created by Richard Martin on 2016-01-18.
//  Copyright © 2016 Richard Martin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *taskToAdd;

@property NSMutableArray *tasksArray;

@property (weak, nonatomic) IBOutlet UITableView *addTableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tasksArray = [NSMutableArray new];
    
}

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.tasksArray.count;
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CellID"];
    
    cell.textLabel.text = [self.tasksArray objectAtIndex:indexPath.row];
    
    return cell;
}

- (IBAction)onAddButtonPressed:(UIButton *)sender {
    
    [self.tasksArray addObject:self.taskToAdd.text];
    
    [self.addTableView reloadData];
    
    [self.taskToAdd resignFirstResponder];
    
    self.taskToAdd.text = @"";

}

-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    return true;
    
}



@end
