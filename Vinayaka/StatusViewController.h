//
//  StatusViewController.h
//  Vinayaka
//
//  Created by NAGARJUNA on 24/05/17.
//  Copyright © 2017 NAGARJUNA. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StatusViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *statusTitle;
@property (weak, nonatomic) IBOutlet UITextField *statusMessage;
@property (weak, nonatomic) IBOutlet UITextField *username;
@property (weak, nonatomic) IBOutlet UIImageView *imageview;
- (IBAction)share:(id)sender;
- (IBAction)cancel:(id)sender;

@end
