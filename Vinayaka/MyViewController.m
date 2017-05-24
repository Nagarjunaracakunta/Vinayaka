//
//  MyViewController.m
//  Vinayaka
//
//  Created by NAGARJUNA on 24/05/17.
//  Copyright © 2017 NAGARJUNA. All rights reserved.
//

#import "MyViewController.h"
#import "StatusTableCell.h"
#import "AppDelegate.h"
@interface MyViewController ()

@end

@implementation MyViewController
{
    AppDelegate *appObj;
    NSManagedObjectContext * context;
    NSArray *result;
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    NSError *error;
    appObj = (AppDelegate *)[[UIApplication sharedApplication]delegate];
    context = appObj.persistentContainer.viewContext;
    NSFetchRequest * request =[[NSFetchRequest alloc]initWithEntityName:@"Status" ];
    
    
    NSPredicate *predicate =[NSPredicate predicateWithFormat:@"username==%@",_user];
    
    [request setPredicate:predicate];
    result= [context executeFetchRequest:request error:&error];

    NSLog(@"%@",result);
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return [result count];
    
    
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"StatusTableCell";
    
    StatusTableCell *cell = (StatusTableCell *)[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    if (cell == nil)
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"StatusTableCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    
    NSData * data =[[result valueForKey:@"imageview"] objectAtIndex:indexPath.row];
    
    cell.username.text = [[result valueForKey:@"username"] objectAtIndex:indexPath.row];
    cell.imageview.image = [UIImage imageWithData:data];
    cell.statusTitle.text = [[result valueForKey:@"statusTitle"] objectAtIndex:indexPath.row];
    cell.statusMessage.text =[[result valueForKey:@"statusMessage"] objectAtIndex:indexPath.row];
    
    return cell;
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
