//
//  DMViewController.m
//  PopoversTest
//
//  Created by sublio on 30/04/16.
//  Copyright (c) 2016 sublio. All rights reserved.
//

#import "DMViewController.h"
#import "DMViewController.h"

@interface DMViewController () <UIPopoverControllerDelegate>

@property (strong, nonatomic) UIPopoverController* popover;

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



- (void) showControllerAsModal:(UIViewController*)vc {
    
    
    [self presentViewController:vc animated:YES completion:^{
        
        
        double delayInSeconds = 3.0;
        dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
        dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
            
            [self dismissViewControllerAnimated:YES completion:nil];
            self.popover = nil;
            
        });
        
    }];
    
}



- (void) showController:(UIViewController*) vc inPopoverFromSender: (id) sender{
    
    if (!sender){
        
        return
    };
    
    UIPopoverController* popover = [[UIPopoverController alloc] initWithContentViewController:vc];
    
    vc.preferredContentSize = CGSizeMake(300, 300 );
    popover.delegate = self;
    self.popover = popover;
    
    if ([sender isKindOfClass:[UIBarButtonItem class]]){
        
        [popover presentPopoverFromBarButtonItem:sender
                        permittedArrowDirections: UIPopoverArrowDirectionAny
                                        animated:YES];
        
    }else if ([sender isKindOfClass:[UIButton class]]) {
        
        [popover presentPopoverFromRect:[(UIButton*) sender frame]
                                 inView:self.view
               permittedArrowDirections:UIPopoverArrowDirectionLeft
                               animated:YES];
        
    }
    
    
    
    
    
    
    
}


- (IBAction) actionAdd:(UIBarButtonItem*)sender{
    
    DMViewController*  vc = [self.storyboard instantiateViewControllerWithIdentifier:@"DMDetailsViewController"];
    
    
    
    if (UI_USER_INTERFACE_IDIOM() ==UIUserInterfaceIdiomPad){
        
        [self showController:vc inPopoverFromSender:sender];
            
       
        
    }else{
        
        [self showControllerAsModal:vc];
    }
    
}


- (IBAction) actionPressMe:(UIButton*) sender{
    
    DMViewController*  vc = [self.storyboard instantiateViewControllerWithIdentifier:@"DMDetailsViewController"];
    
    if (UI_USER_INTERFACE_IDIOM() ==UIUserInterfaceIdiomPad){
        
       [self showController:vc inPopoverFromSender:sender];
     
        
    }else{
        
        [self showControllerAsModal:vc];
        
        
    }
    
    
}


#pragma  mark - UIPopover Delegate

- (void)popoverControllerDidDismissPopover:(UIPopoverController *)popoverController{
    
    
    self.popover = nil;
    
}



@end


    
