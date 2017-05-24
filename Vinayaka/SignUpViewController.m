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
    NSData *data;
    NSString *firstname;
    NSString *username;
    NSString *password;
    NSString *email;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    appObj = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    context = appObj.persistentContainer.viewContext;
    // Do any additional setup after loading the view.
    if([_str  isEqual: @"update"])
    {
        [self.save setTitle:@"Update" forState:UIControlStateNormal];
        
        NSLog(@"update");
        
        firstname = [[_result valueForKey:@"firstname"] objectAtIndex:0];
        username = [[_result valueForKey:@"username"] objectAtIndex:0];
        password = [[_result valueForKey:@"password"] objectAtIndex:0];
        email = [[_result valueForKey:@"email"] objectAtIndex:0];
        data = [[_result valueForKey:@"imageview"] objectAtIndex:0];
        _firstname.text = firstname;
        _username.text = username;
        _password.text = password;
        _email.text = email;
        
        _imageview.image =[UIImage imageWithData:data];
        
        
        
        // NSLog(@"%@",[_result valueForKey:@"studentbranch"] );
        //NSLog(@"%@",[_result valueForKey:@"studentrollno"] );
        //NSLog(@"%@",[_result valueForKey:@"studentphoneno"] );
        // NSLog(@"%@",[_result valueForKey:@"studentaddress"] );
        //_studentbranch.text=[_result valueForKey:@"studentname"] ;
        //_studentrollno.text=[_result valueForKey:@"studentname"] ;
        //_studentaddress.text=[_result valueForKey:@"studentname"] ;
        //_studentphoneno.text=[_result valueForKey:@"studentname"] ;
    }
    
    else
    {
        [self.save setTitle:@"Save" forState:UIControlStateNormal];
        
        _firstname.placeholder =@"FirstName";
        _username.placeholder=@"Username";
        _password.placeholder=@"Password";
        _email.placeholder=@"Email";
    }

    UITapGestureRecognizer *tap =[[UITapGestureRecognizer alloc]init];
    [tap addTarget:self action:@selector(clckImageView)];
    tap.numberOfTapsRequired = 1;
    self.imageview.userInteractionEnabled = YES;
    [self.imageview addGestureRecognizer:tap];
}
-(void)clckImageView
{
    
    UIAlertController *alertView =[UIAlertController alertControllerWithTitle:@"Upload Photo" message:@"" preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *Camera =[UIAlertAction actionWithTitle:@"Camera" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        UIImagePickerController *image =[[UIImagePickerController alloc]init];
        [image setDelegate:(id)self];
        [image setSourceType:UIImagePickerControllerSourceTypeCamera];
        [image setAllowsEditing:YES];
        [self presentViewController:image animated:YES completion:nil];
        
    }];
    
    UIAlertAction * library =[UIAlertAction actionWithTitle:@"Library" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        UIImagePickerController *image =[[UIImagePickerController alloc]init];
        [image setDelegate:(id)self];
        [image setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
        [image setAllowsEditing:YES];
        [self presentViewController:image animated:YES completion:nil];
        
        
    }];
    
    UIAlertAction *cancel =[UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
        [self dismissViewControllerAnimated:cancel completion:nil];
        
    }];
    
    [alertView addAction:cancel];
    [alertView addAction:Camera];
    [alertView addAction:library];
    
    [self  presentViewController:alertView animated:YES completion:nil];
    
}
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info;
{
    
    self.imageview.image =[info objectForKey:UIImagePickerControllerEditedImage];
    
    
    data = UIImageJPEGRepresentation(self.imageview.image, 1.0) ;
    
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
    
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
    if (_username.text.length==0)
    {
        UIAlertView *alert =[[UIAlertView alloc]initWithTitle:@"hello" message:@"User name required" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"Ok", nil];
        [alert show];
        
    }
    else if (_firstname.text.length==0)
    {
        UIAlertView *alert =[[UIAlertView alloc]initWithTitle:@"hello" message:@"First name required" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"Ok", nil];
        [alert show];
        
    }
    else if(_password.text.length == 0)
    {
        UIAlertView *alert =[[UIAlertView alloc]initWithTitle:@"hello" message:@"Password required" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"Ok", nil];
        [alert show];
    }
    else if(_email.text.length == 0)
    {
        UIAlertView *alert =[[UIAlertView alloc]initWithTitle:@"hello" message:@"email required" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"Ok", nil];
        [alert show];
    }
    else{

    NSManagedObject *object = [NSEntityDescription insertNewObjectForEntityForName:@"Users" inManagedObjectContext:context];
    
    [object setValue:self.firstname.text forKey:@"firstname"];
    [object setValue:self.username.text forKey:@"username"];
    [object setValue:self.password.text forKey:@"password"];
    [object setValue:self.email.text forKey:@"email"];
    
    [object setValue:data forKey:@"imageview"];
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
    
}
@end
