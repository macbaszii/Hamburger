//
//  BaseViewController.m
//  Hamburger
//
//  Created by Kiattisak Anoochitarom on 2/2/2558 BE.
//  Copyright (c) 2558 Kiattisak Anoochitarom. All rights reserved.
//

#import <MMDrawerBarButtonItem.h>
#import <UIViewController+MMDrawerController.h>

#import "BaseViewController.h"

@implementation BaseViewController

#pragma mark - View Controller Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.mm_drawerController.openDrawerGestureModeMask = MMOpenDrawerGestureModePanningCenterView;
    self.navigationItem.leftBarButtonItem = [[MMDrawerBarButtonItem alloc] initWithTarget:self
                                                                                   action:@selector(openMenu)];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.mm_drawerController.closeDrawerGestureModeMask = MMCloseDrawerGestureModePanningCenterView;
}

#pragma mark - Action

- (void)openMenu {
    if (self.mm_drawerController.visibleLeftDrawerWidth == 0) {
        [self.mm_drawerController openDrawerSide:MMDrawerSideLeft animated:YES completion:nil];
    } else {
        [self.mm_drawerController closeDrawerAnimated:YES completion:nil];
    }
}

@end
