//
//  StatusTableCell.h
//  Vinayaka
//
//  Created by NAGARJUNA on 24/05/17.
//  Copyright © 2017 NAGARJUNA. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StatusTableCell : UITableViewCell

@property (nonatomic, strong)IBOutlet UILabel *username;

@property (weak, nonatomic) IBOutlet UILabel *statusTitle;

@property (weak, nonatomic) IBOutlet UILabel *statusMessage;

@property (weak, nonatomic) IBOutlet UIImageView *imageview;

@end
