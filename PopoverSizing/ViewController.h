//
//  ViewController.h
//  PopoverSizing
//
//  Created by Kyle Sluder on 8/15/14.
//  Copyright (c) 2014 The Omni Group. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UINavigationController
@end

IB_DESIGNABLE
@interface TableViewController : UITableViewController
@property (nonatomic, assign) IBInspectable NSUInteger numberOfRows;
@end
