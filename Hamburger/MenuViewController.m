//
//  MenuViewController.m
//  Hamburger
//
//  Created by Kiattisak Anoochitarom on 2/2/2558 BE.
//  Copyright (c) 2558 Kiattisak Anoochitarom. All rights reserved.
//

#import <MMDrawerController.h>
#import <UIViewController+MMDrawerController.h>

#import "MenuViewController.h"

static NSInteger const MenuRow = 3;
static NSString * const MenuCellIdentifier = @"MenuCell";

@interface MenuViewController() <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation MenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return MenuRow;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MenuCellIdentifier forIndexPath:indexPath];
    cell.textLabel.text = [NSString stringWithFormat:@"VC #%ld", indexPath.row];
    
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *changingViewControllerIdentifier;
    
    if (indexPath.row == 0) {
        changingViewControllerIdentifier = @"FirstViewController";
    } else if (indexPath.row == 1) {
        changingViewControllerIdentifier = @"SecondViewController";
    } else if (indexPath.row == 2) {
        changingViewControllerIdentifier = @"ThirdViewController";
    }
    
    UIViewController *viewController = [self.storyboard instantiateViewControllerWithIdentifier:changingViewControllerIdentifier];
    if (viewController) {
        [self.mm_drawerController setCenterViewController:viewController withCloseAnimation:YES completion:nil];
    }
}

@end
