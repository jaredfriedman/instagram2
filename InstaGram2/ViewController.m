//
//  ViewController.m
//  InstaGram2
//
//  Created by Jared Friedman on 2/4/14.
//  Copyright (c) 2014 Jared Friedman. All rights reserved.
//

#import "ViewController.h"
#import "Parse/Parse.h"
#include <stdlib.h>



@interface ViewController ()<PFSignUpViewControllerDelegate, PFLogInViewControllerDelegate, UIImagePickerControllerDelegate>
{
    
}
@end

@implementation ViewController



//- (IBAction)onAddButtonPressed:(id)sender
//{
//    UIImagePickerController *picker = [[UIImagePickerController alloc]init];
//    picker.delegate = self;
//    picker.allowsEditing = YES;
//    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
//    
//    [self presentViewController:picker animated:YES completion:NULL];
//    
//    profileImageView.image = picker;
//
//}

//        self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"Testbackground.jpg"]];

//works NOWHERE WHAT THE FUCK


- (void)viewDidLoad
{
    self.parseClassName = @"photo";
    [super viewDidLoad];
}


- (void)uploadImage:(NSData *)imageData;
{
    UIImage *img = [UIImage imageNamed:@"Testbackground.jpg"];
    NSData *data = UIImageJPEGRepresentation(img, 0.9);

    PFObject *userPhoto = [PFObject objectWithClassName:@"photo"];
    userPhoto[@"user"] = [PFUser currentUser];
    userPhoto[@"imageFile"] = [PFFile fileWithData:data];
    [userPhoto saveInBackground];
    
}

-(PFTableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath object:(PFObject *)object
{
    PFTableViewCell *cell = [[PFTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"a"];
    PFUser *user = [object objectForKey:@"user"];
    [user fetchIfNeeded];
    //cell.textLabel.text = [user objectForKey:@"username"];
    //cell.detailTextLabel.text = [object objectForKey:@"email"];

    cell.imageView.file = [object objectForKey:@"imageFile"];
   [cell.imageView loadInBackground];
    return cell;
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];


    if (![PFUser currentUser]) {
        PFLogInViewController *logInViewController = [[PFLogInViewController alloc] init];
        [logInViewController setDelegate:self];

        [self performSegueWithIdentifier:@"SignInSegue" sender:self];
    }
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender

{
    PFLogInViewController *login = segue.destinationViewController;
    login.delegate = self;
    login.signUpController.delegate = self;


    UILabel *label = [[UILabel alloc]initWithFrame:CGRectZero];
    label.text = @"Instagram Login";
    [label sizeToFit];
    login.logInView.logo = label;


    label = [[UILabel alloc]initWithFrame:CGRectZero];
    label.text = @"Instagram Sign Up";
    [label sizeToFit];
    login.signUpController.signUpView.logo = label;

}


-(void)signUpViewController:(PFSignUpViewController *)signUpController didSignUpUser:(PFUser *)user
{

    [signUpController dismissViewControllerAnimated:YES completion:nil];
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"Testbackground.jpg"]];

}



@end
