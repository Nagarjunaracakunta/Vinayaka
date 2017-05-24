//
//  SimpleTableCell.h
//  Vinayaka
//
//  Created by NAGARJUNA on 24/05/17.
//  Copyright © 2017 NAGARJUNA. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SimpleTableCell : UITableViewCell


@property (nonatomic, strong)IBOutlet UILabel *username;

@property (weak, nonatomic) IBOutlet UILabel *firstname;

@property (weak, nonatomic) IBOutlet UIImageView *image;

@end
