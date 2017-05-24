//
//  AppDelegate.h
//  Vinayaka
//
//  Created by NAGARJUNA on 24/05/17.
//  Copyright © 2017 NAGARJUNA. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;
@property(strong,nonatomic) UITabBarController *tabbar;

- (void)addTabbar;

@property(nonatomic,strong) NSString *str;

@end

