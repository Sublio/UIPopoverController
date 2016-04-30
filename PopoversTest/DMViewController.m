//
//  DMViewController.m
//  PopoversTest
//
//  Created by sublio on 30/04/16.
//  Copyright (c) 2016 sublio. All rights reserved.
//

#import "DMViewController.h"
#import "DMViewController.h"

@interface DMViewController ()

@end

@implementation DMViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma  mark - Actions;

- (IBAction) actionAdd:(UIBarButtonItem*)sender{
    
    DMViewController*  vc = [self.storyboard instantiateViewControllerWithIdentifier:@"DMDetailsViewController"];
    
    UIPopoverController* popover = [[UIPopoverController alloc] initWithContentViewController:vc];
    
    [popover presentPopoverFromBarButtonItem:sender
                    permittedArrowDirections: UIPopoverArrowDirectionAny
                                    animated:YES];
    
}
- (IBAction) actionPressMe:(UIButton*)sender{
    
    
    
}



@end
