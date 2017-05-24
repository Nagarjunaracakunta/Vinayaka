//
//  MyViewController.h
//  Vinayaka
//
//  Created by NAGARJUNA on 24/05/17.
//  Copyright © 2017 NAGARJUNA. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableview;
@property (nonatomic, strong) NSArray *result;

@property(nonatomic,strong) NSString *user;

@end
