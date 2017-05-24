//
//  ViewController.m
//  Vinayaka
//
//  Created by NAGARJUNA on 24/05/17.
//  Copyright © 2017 NAGARJUNA. All rights reserved.
//

#import "ViewController.h"
#import "SignUpViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)signin:(id)sender {
    SignUpViewController *signup = [self.storyboard instantiateViewControllerWithIdentifier:@"SignUpViewController"];
    
    [self.navigationController pushViewController:signup animated:nil];
}

- (IBAction)signup:(id)sender {
    SignUpViewController *signup = [self.storyboard instantiateViewControllerWithIdentifier:@"SignUpViewController"];
    
    [self.navigationController pushViewController:signup animated:nil];
    
}
@end
