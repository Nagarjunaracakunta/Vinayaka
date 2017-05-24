//
//  UsersDetailsViewController.h
//  Vinayaka
//
//  Created by NAGARJUNA on 24/05/17.
//  Copyright © 2017 NAGARJUNA. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UsersDetailsViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *username;
@property (nonatomic, strong) NSArray *finalresult;
@property (weak, nonatomic) IBOutlet UILabel *firstname;
@property (weak, nonatomic) IBOutlet UIImageView *imageview;
@property (weak, nonatomic) IBOutlet UILabel *email;
- (IBAction)update:(id)sender;
- (IBAction)del:(id)sender;
@end
