//
//  StatusViewController.m
//  Vinayaka
//
//  Created by NAGARJUNA on 24/05/17.
//  Copyright © 2017 NAGARJUNA. All rights reserved.
//

#import "StatusViewController.h"
#import "AppDelegate.h"
#import "MyViewController.h"
#import "HomeViewController.h"
@interface StatusViewController ()

@end

@implementation StatusViewController
{
    AppDelegate *appObj;
    NSManagedObjectContext * context;
    NSArray *resultArray;
    NSObject *result;
    NSData *date;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    appObj = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    context = appObj.persistentContainer.viewContext;
    // Do any additional setup after loading the view.
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
    
    
    date = UIImageJPEGRepresentation(self.imageview.image, 1.0) ;
    
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)ReceivethUserData
{
    NSError *error;
    
    NSFetchRequest * request =[[NSFetchRequest alloc]initWithEntityName:@"Status" ];
    resultArray= [context executeFetchRequest:request error:&error];
    //  result = [context executeFetchRequest:request error:&error];
    // NSMutableArray *resultArray1 = [resultArray valueForKey:@"firstname"];
    //for (NSString *color in resultArray1) {
    // NSLog(@"%@ is a color", color);
    //}
    // NSLog(@"%@",[resultArray valueForKey:@"firstname"]);
    
    NSLog(@"%@",resultArray);
    
}
- (IBAction)share:(id)sender {
    NSError *error;
    NSManagedObject *object =[NSEntityDescription insertNewObjectForEntityForName:@"Status" inManagedObjectContext:context];
    [object setValue:self.statusMessage.text forKey:@"statusMessage"];
    [object setValue:self.statusTitle.text forKey:@"statusTitle"];
    [object setValue:self.username.text forKey:@"username"];
    [object setValue:date forKey:@"imageview"];
    if (![context save:&error])
    {
        NSLog(@"Failed");
        
    }else{
        NSLog(@"Saved");
    }
    
    
    
    [self ReceivethUserData];
    MyViewController *my = [self.storyboard instantiateViewControllerWithIdentifier:@"MyViewController"];
    my.result = resultArray;
    [self.navigationController pushViewController:my animated:nil];

}

- (IBAction)cancel:(id)sender {
    HomeViewController *home = [self.storyboard instantiateViewControllerWithIdentifier:@"HomeViewController"];
    home.result = resultArray;
    [self.navigationController pushViewController:home animated:nil];
    
    
}
@end
