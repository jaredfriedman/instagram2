//
//  ViewController.m
//  InstaGram2
//
//  Created by Jared Friedman on 2/4/14.
//  Copyright (c) 2014 Jared Friedman. All rights reserved.
//

#import "ViewController.h"
#import "Parse/Parse.h"



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




- (void)viewDidLoad
{
    self.parseClassName = @"User";
    self.view.backgroundColor = [UIColor whiteColor];
    
    [super viewDidLoad];
    //    PFObject *user2 = [PFObject objectWithClassName:@"User"];
    //    user2[@"username"] = @"james1989";
    //    user2[@"email"] = @"james@aol.com";
    //
    //
    //    [user2 saveInBackground];
    
    
}

-(PFTableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath object:(PFObject *)object
{
    PFTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"a"];
    if (!cell) {
        cell = [[PFTableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"a"];
        
    }
    cell.textLabel.text = [object objectForKey:@"username"];
    //cell.detailTextLabel.text = [object objectForKey:@"fullname"];
    //cell.detailTextLabel.text = [object objectForKey:@"password"];
    cell.detailTextLabel.text = [object objectForKey:@"email"];
    //cell.detailTextLabel.text = [object objectForKey:@"biography"];
    
    return cell;
    
}

-(void)viewDidAppear:(BOOL)animated
{
    if (![PFUser currentUser]) {
        
        
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
    
}



@end
