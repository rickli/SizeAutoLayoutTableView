//
//  ViewController.m
//  SizeAutoLayoutTableView
//
//  Created by King on 2017/6/2.
//  Copyright © 2017年 Rick. All rights reserved.
//

#import "ViewController.h"
#import "SizeAutoLayoutTableViewCell.h"
@interface ViewController ()<UITextViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.estimatedRowHeight = 100;
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SizeAutoLayoutTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"AutoLayoutTableViewCell" forIndexPath:indexPath];
    cell.textView.delegate = self;
    return cell;
}

#pragma mark - UITextViewDelegate
- (void)textViewDidChange:(UITextView *)textView {
    CGPoint currentOffset = self.tableView.contentOffset;
    [UIView setAnimationsEnabled:NO];
    [self.tableView beginUpdates];
    [self.tableView endUpdates];
    [UIView setAnimationsEnabled:YES];
    [self.tableView setContentOffset:currentOffset animated:NO];
}


@end
