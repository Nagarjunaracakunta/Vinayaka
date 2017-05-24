//
//  Status+CoreDataProperties.m
//  Vinayaka
//
//  Created by NAGARJUNA on 24/05/17.
//  Copyright © 2017 NAGARJUNA. All rights reserved.
//

#import "Status+CoreDataProperties.h"

@implementation Status (CoreDataProperties)

+ (NSFetchRequest<Status *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"Status"];
}

@dynamic statusMessage;
@dynamic statusTitle;
@dynamic username;
@dynamic imageview;

@end
