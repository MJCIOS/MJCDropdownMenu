//
//  ViewController.m
//  MJCDropdownMenuDemo
//
//  Created by mjc on 16/11/29.
//  Copyright © 2016年 MJC. All rights reserved.
//

#import "ViewController.h"
#import "MJCDropdownMenu/MJCDropdownMenu.h"
#import "MJCTestViewController.h"
#import "MJCTestViewController2.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor redColor];
    
}

- (IBAction)left:(id)sender {
    
    MJCTestViewController *tetVC = [MJCTestViewController new];
    
    [MJCDropdownMenu showFromView:sender mainImage:[UIImage imageNamed:@"popover_background_left@2x"] MJCDropdownMenuType:MJCDropdownMenuLeft];
    [MJCDropdownMenu popContentController:tetVC];
    
    [MJCDropdownMenu setupImagenewFrame:sender ImageW:130 imageH:120 MJCDropdownMenuType:MJCDropdownMenuLeft];
    
    
}

- (IBAction)zhong:(id)sender {
    
    MJCTestViewController2 *tetVC = [MJCTestViewController2 new];
    
    UIImage *newimag1= [MJCDropdownMenu imageByApplyingAlpha:0.5 image:[UIImage imageNamed:@"popover_background@2x"]];
    UIImage *newimag =  [MJCDropdownMenu imageStretchableImageWithLeftCap:newimag1];
    
    [MJCDropdownMenu showFromView:sender mainImage:newimag showcontentController:tetVC MJCDropdownMenuType:MJCDropdownMenuMiddle];
    
    [MJCDropdownMenu setupImagenewFrame:sender ImageW:130 imageH:300 MJCDropdownMenuType:MJCDropdownMenuMiddle];
    
}

- (IBAction)right:(id)sender {
    
    MJCTestViewController *tetVC = [MJCTestViewController new];
    
    [MJCDropdownMenu showFromView:sender mainImage:[UIImage imageNamed:@"popover_background_right@2x"] MJCDropdownMenuType:MJCDropdownMenuLeft];
    
    [MJCDropdownMenu popContentController:tetVC];
    
    [MJCDropdownMenu setupImagenewFrame:sender ImageW:130 imageH:120 MJCDropdownMenuType:MJCDropdownMenuRight];
    
}



@end
