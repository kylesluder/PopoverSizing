//
//  ViewController.m
//  PopoverSizing
//
//  Created by Kyle Sluder on 8/15/14.
//  Copyright (c) 2014 The Omni Group. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UINavigationControllerDelegate>
@end

@implementation ViewController

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender;
{
    if ([segue.identifier isEqualToString:@"PresentPopover"])
        ((UINavigationController *)segue.destinationViewController).delegate = self;
    
    [super prepareForSegue:segue sender:sender];
}

- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated;
{
    [navigationController.transitionCoordinator animateAlongsideTransition:^(id<UIViewControllerTransitionCoordinatorContext> context) {
        navigationController.preferredContentSize = viewController.preferredContentSize;
    } completion:nil];
}

@end

@implementation TableViewController

- (void)viewWillAppear:(BOOL)animated;
{
    [self.tableView layoutIfNeeded];
    self.preferredContentSize = self.tableView.contentSize;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
{
    return self.numberOfRows;
}

static NSUInteger _rowsInNextLevel(NSUInteger rowInThisTableView)
{
    return ((rowInThisTableView + 1) * 3) - (rowInThisTableView + 1);
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ReuseIdentifier" forIndexPath:indexPath];
    cell.textLabel.text = [NSString stringWithFormat:@"%ld items", (unsigned long)_rowsInNextLevel(indexPath.row)];
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender;
{
    if ([segue.identifier isEqualToString:@"NextLevel"]) {
        ((TableViewController *)segue.destinationViewController).numberOfRows = _rowsInNextLevel([self.tableView indexPathForSelectedRow].row);
    }
}

@end
