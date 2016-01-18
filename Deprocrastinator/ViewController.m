//
//  ViewController.m
//  Deprocrastinator
//
//  Created by Richard Martin on 2016-01-18.
//  Copyright © 2016 Richard Martin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate, UIGestureRecognizerDelegate, UIGestureRecognizerDelegate>
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property NSMutableArray *cells;
@property (weak, nonatomic) IBOutlet UITableView *taskTableView;
@property (strong, nonatomic) IBOutlet UITapGestureRecognizer *tapGestureRecognizer;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *addButton;
@property int i;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.cells = [NSMutableArray new];
    self.i = 0;
}

- (IBAction)onEditTapped:(UIBarButtonItem *)sender {
    if (self.i%2 == 0) {
        sender.title = @"Edit";
    } else {
        sender.title = @"Done";
    }
    self.i++;
    
    
}
//touch once makes text green
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView cellForRowAtIndexPath:indexPath].textLabel.textColor = [UIColor greenColor];
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
    if (self.textField.text.length > 0) {
        [self.cells addObject:self.textField.text];
        [self.taskTableView reloadData];
        [self.textField resignFirstResponder];
        self.textField.text = @"";
    }
}

@end
