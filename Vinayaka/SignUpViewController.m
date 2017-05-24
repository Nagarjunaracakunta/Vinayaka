//
//  SignUpViewController.m
//  Vinayaka
//
//  Created by NAGARJUNA on 24/05/17.
//  Copyright © 2017 NAGARJUNA. All rights reserved.
//

#import "SignUpViewController.h"
#import "AppDelegate.h"
#import "UsersListViewController.h"
@interface SignUpViewController ()

@end

@implementation SignUpViewController
{
    
    AppDelegate *appObj;
    NSManagedObjectContext *context;
    NSArray *resultArray;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    appObj = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    context = appObj.persistentContainer.viewContext;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void) receiveUsersData{
    
    NSError *error;
    NSFetchRequest *request = [[NSFetchRequest alloc]initWithEntityName:@"Users"];
    resultArray = [context executeFetchRequest:request error:&error];
    NSLog(@"%@",resultArray);
    
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)cancel:(id)sender {
}

- (IBAction)save:(id)sender {
    NSManagedObject *object = [NSEntityDescription insertNewObjectForEntityForName:@"Users" inManagedObjectContext:context];
    
    [object setValue:self.firstname.text forKey:@"firstname"];
    [object setValue:self.username.text forKey:@"username"];
    [object setValue:self.password.text forKey:@"password"];
    [object setValue:self.email.text forKey:@"email"];
    NSError *error;
    if(![context save:&error])
    {
        NSLog(@"failed");
    }
    else{
        NSLog(@"save");
    }
    [self receiveUsersData];
    UsersListViewController *list = [self.storyboard instantiateViewControllerWithIdentifier:@"UsersListViewController"];
    list.result = resultArray;
    [self.navigationController pushViewController:list animated:nil];
    
}
@end
