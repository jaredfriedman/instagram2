//
//  PostViewController.m
//  InstaGram2
//
//  Created by Jared Friedman on 2/4/14.
//  Copyright (c) 2014 Jared Friedman. All rights reserved.
//

#import "PostViewController.h"
#import "Parse/Parse.h"
#import "ViewController.h"

@interface PostViewController () <UIImagePickerControllerDelegate, UINavigationBarDelegate, UINavigationControllerDelegate>
{
    
    __weak IBOutlet UIImageView *myImageView;
    
    UIImage *selectedImageFromPicker;
}

@end

@implementation PostViewController

- (IBAction)onAddPicturePressed:(id)sender
{
    UIImagePickerController *picker = [[UIImagePickerController alloc]init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    
    [self presentViewController:picker animated:YES completion:NULL];

}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    
    selectedImageFromPicker= [info valueForKey:UIImagePickerControllerOriginalImage];
    myImageView.image = selectedImageFromPicker;
    
    [self dismissViewControllerAnimated:YES completion:NULL];
    
}

- (IBAction)onPostToFeedButton:(id)sender
{
    //get picture to post to parse
    //create pfobject
    
     NSData *data = UIImageJPEGRepresentation(selectedImageFromPicker, 0.9);
    
    PFObject *postedPhoto = [PFObject objectWithClassName:@"photo"];
    postedPhoto[@"user"] = [PFUser currentUser];
    postedPhoto[@"imageFile"] = [PFFile fileWithData:data];
    [postedPhoto saveInBackground];
    
    
    
}

@end
