//
//  ViewController.m
//  Deprocrastinator
//
//  Created by Richard Martin on 2016-01-18.
//  Copyright © 2016 Richard Martin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>



@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
}

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 4;
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return nil;
}

@end
