//
//  Status+CoreDataProperties.h
//  Vinayaka
//
//  Created by NAGARJUNA on 24/05/17.
//  Copyright © 2017 NAGARJUNA. All rights reserved.
//

#import "Status+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Status (CoreDataProperties)

+ (NSFetchRequest<Status *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *statusMessage;
@property (nullable, nonatomic, copy) NSString *statusTitle;
@property (nullable, nonatomic, copy) NSString *username;
@property (nullable, nonatomic, retain) NSData *imageview;

@end

NS_ASSUME_NONNULL_END
