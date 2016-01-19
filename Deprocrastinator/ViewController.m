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

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CellID"];
    
    cell.textLabel.text = [self.tasksArray objectAtIndex:indexPath.row];
    
    return cell;
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

-(void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath {
    
    [tableView exchangeSubviewAtIndex:sourceIndexPath.row withSubviewAtIndex:destinationIndexPath.row];
    
    NSString *rowItem = [self.tasksArray objectAtIndex:sourceIndexPath.row];
    
    [self.tasksArray removeObject:rowItem];
    [self.tasksArray insertObject:rowItem atIndex:destinationIndexPath.row];
    
    NSLog(@"tasksArray is %@", self.tasksArray);
}



-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.tasksArray.count;
    
}



-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    [tableView cellForRowAtIndexPath:indexPath].textLabel.textColor = [UIColor greenColor];

    
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    UIAlertController *deleteAlert = [UIAlertController alertControllerWithTitle:@"Delete Alert" message:@"Are you sure?" preferredStyle:UIAlertControllerStyleActionSheet];
    
    UIAlertAction *cancelAlert = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleDefault handler:nil];
    
    UIAlertAction *confirmDelete = [UIAlertAction actionWithTitle:@"Delete " style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                                    [self.tasksArray removeObject:self.tasksArray[indexPath.row]];
                                    [self.addTableView reloadData];
    }];
    
    [deleteAlert addAction:cancelAlert];
    [deleteAlert addAction:confirmDelete];
    
    [self presentViewController:deleteAlert animated:true completion:nil];
    
    
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
    
    if (self.editing) {
        self.editing = false;
        [self.addTableView setEditing:false animated:false];
        sender.style = UIBarButtonItemStylePlain;
        [sender setTitle:@"Edit"];
    } else {
        self.editing = true;
        [self.addTableView setEditing:true animated:true];
        sender.style = UIBarButtonItemStyleDone;
        [sender setTitle:@"Done"];
    }


}


@end
