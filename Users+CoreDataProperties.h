//
//  Users+CoreDataProperties.h
//  Vinayaka
//
//  Created by NAGARJUNA on 24/05/17.
//  Copyright © 2017 NAGARJUNA. All rights reserved.
//

#import "Users+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Users (CoreDataProperties)

+ (NSFetchRequest<Users *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *firstname;
@property (nullable, nonatomic, copy) NSString *username;
@property (nullable, nonatomic, copy) NSString *password;
@property (nullable, nonatomic, copy) NSString *email;
@property (nullable, nonatomic, retain) NSData *imageview;

@end

NS_ASSUME_NONNULL_END
