//
//  Users+CoreDataProperties.m
//  Vinayaka
//
//  Created by NAGARJUNA on 24/05/17.
//  Copyright © 2017 NAGARJUNA. All rights reserved.
//

#import "Users+CoreDataProperties.h"

@implementation Users (CoreDataProperties)

+ (NSFetchRequest<Users *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"Users"];
}

@dynamic firstname;
@dynamic username;
@dynamic password;
@dynamic email;
@dynamic imageview;

@end
