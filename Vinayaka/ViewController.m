//
//  ViewController.m
//  Vinayaka
//
//  Created by NAGARJUNA on 24/05/17.
//  Copyright © 2017 NAGARJUNA. All rights reserved.
//

#import "ViewController.h"
#import "SignUpViewController.h"
#import "AppDelegate.h"
#import "StatusViewController.h"
@interface ViewController ()

@end

@implementation ViewController
{
    AppDelegate *appObj;
    NSManagedObjectContext *context;
    NSArray *resultArray;
}

- (void)viewDidLoad {
    [super viewDidLoad]; appObj = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    context = appObj.persistentContainer.viewContext;
    resultArray = [[NSArray alloc]init];
    
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)signin:(id)sender {
    if (_username.text.length==0)
    {
        UIAlertView *alert =[[UIAlertView alloc]initWithTitle:@"hello" message:@"User name required" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"Ok", nil];
        [alert show];
        
    }
    else if(_password.text.length == 0)
    {
        UIAlertView *alert =[[UIAlertView alloc]initWithTitle:@"hello" message:@"Password required" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"Ok", nil];
        [alert show];
    }
    else{
        
        NSFetchRequest *request= [[NSFetchRequest alloc] init];
        NSEntityDescription *entity = [NSEntityDescription entityForName:@"Users" inManagedObjectContext:context];
        NSPredicate *predicate =[NSPredicate predicateWithFormat:@"username==%@ AND password==%@",_username.text, _password.text];
        [request setEntity:entity];
        [request setPredicate:predicate];
        NSError *error;
        resultArray= [context executeFetchRequest:request error:&error];
        
        NSLog(@"%@",resultArray);
        if(resultArray.count > 0)
        {
        StatusViewController *status = [self.storyboard instantiateViewControllerWithIdentifier:@"StatusViewController"];
        
        [self.navigationController pushViewController:status animated:nil];
        }
    }
}

- (IBAction)signup:(id)sender {
    SignUpViewController *signup = [self.storyboard instantiateViewControllerWithIdentifier:@"SignUpViewController"];
    
    [self.navigationController pushViewController:signup animated:nil];
    
}
@end
