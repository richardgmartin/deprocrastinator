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

- (IBAction)onSwipeGesture:(UISwipeGestureRecognizer *)sender {
    
    if (sender.state == UIGestureRecognizerStateEnded) {
        
        CGPoint swipeLocation = [sender locationInView:self.addTableView];
        NSIndexPath *swipedIndexPath = [self.addTableView indexPathForRowAtPoint:swipeLocation];
        UITableViewCell *swipedCell = [self.addTableView cellForRowAtIndexPath:swipedIndexPath];
        
        if (swipedCell.textLabel.textColor == [UIColor blackColor]) {
            swipedCell.textLabel.textColor = [UIColor redColor];
        } else if (swipedCell.textLabel.textColor == [UIColor redColor]) {
            swipedCell.textLabel.textColor = [UIColor yellowColor];
        } else if (swipedCell.textLabel.textColor == [UIColor yellowColor]) {
            swipedCell.textLabel.textColor = [UIColor greenColor];
        } else {
            swipedCell.textLabel.textColor = [UIColor blackColor];
        }
    }
}


-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.tasksArray.count;
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CellID"];
    
    cell.textLabel.text = [self.tasksArray objectAtIndex:indexPath.row];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    [tableView cellForRowAtIndexPath:indexPath].textLabel.textColor = [UIColor greenColor];

    
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [self.tasksArray removeObject:self.tasksArray[indexPath.row]];
    [self.addTableView reloadData];
    
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

- (IBAction)onEditButtonPressed:(UIBarButtonItem *)sender {
    
    if (self.editing == NO) {
        [self.addTableView setEditing:YES];
        [sender setTitle:@"Done"];
    } else {
        [sender setTitle:@"Edit"];
        [self.addTableView setEditing:NO];
    }
}


@end
